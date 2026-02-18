import 'dart:convert';
import 'dart:io';

Future<int> _run(
  String executable,
  List<String> arguments, {
  String? workingDirectory,
  Map<String, String>? environment,
}) async {
  final process = await Process.start(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    environment: environment,
    runInShell: true,
  );

  unawaited(process.stdout.transform(utf8.decoder).forEach(stdout.write));
  unawaited(process.stderr.transform(utf8.decoder).forEach(stderr.write));

  return process.exitCode;
}

String _parseProjectName(String pubspecYaml) {
  // Best-effort parse of `name: ...`.
  for (final line in const LineSplitter().convert(pubspecYaml)) {
    final trimmed = line.trim();
    if (trimmed.startsWith('name:')) {
      return trimmed.substring('name:'.length).trim();
    }
  }
  throw StateError('Could not find `name:` in pubspec.yaml');
}

Future<void> _deleteIfExists(Directory dir) async {
  if (await dir.exists()) {
    await dir.delete(recursive: true);
  }
}

Future<void> _ensureDir(Directory dir) async {
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }
}

Future<void> _copyRecursive(Directory src, Directory dst) async {
  await _ensureDir(dst);

  await for (final entity in src.list(recursive: false, followLinks: false)) {
    final name = entity.uri.pathSegments.last;
    final targetPath = '${dst.path}${Platform.pathSeparator}$name';

    if (entity is Directory) {
      await _copyRecursive(entity, Directory(targetPath));
      continue;
    }

    if (entity is File) {
      await entity.copy(targetPath);
      continue;
    }
  }
}

Future<bool> _hasSubdirectories(Directory dir) async {
  await for (final entity in dir.list(recursive: false, followLinks: false)) {
    if (entity is Directory) return true;
  }
  return false;
}

Future<void> _writeLibMatchingOriginalLayout({
  required Directory originalLibDir,
  required Directory flatProcessedLibDir,
  required Directory distLibDir,
}) async {
  final processedByName = <String, File>{};
  await for (final entity in flatProcessedLibDir.list(recursive: true, followLinks: false)) {
    if (entity is! File) continue;
    final name = entity.uri.pathSegments.last;
    processedByName.putIfAbsent(name, () => entity);
  }

  Future<void> ensureParent(String filePath) async {
    final parent = File(filePath).parent;
    await _ensureDir(parent);
  }

  await _deleteIfExists(distLibDir);
  await _ensureDir(distLibDir);

  await for (final entity in originalLibDir.list(recursive: true, followLinks: false)) {
    if (entity is! File) continue;

    final rel = entity.path.substring(originalLibDir.path.length + 1);
    final base = entity.uri.pathSegments.last;
    final processed = processedByName[base];
    if (processed == null) {
      throw StateError('Missing processed file for $rel (basename: $base)');
    }

    final outPath = '${distLibDir.path}${Platform.pathSeparator}$rel';
    await ensureParent(outPath);
    await processed.copy(outPath);
  }
}

String _basename(String path) {
  final parts = path.split(Platform.pathSeparator).where((p) => p.isNotEmpty).toList();
  return parts.isEmpty ? path : parts.last;
}

Future<bool> _looksLikeFlutterLib(Directory libDir) async {
  final mainDart = File('${libDir.path}${Platform.pathSeparator}main.dart');
  return mainDart.exists();
}

Future<void> main(List<String> args) async {
  final projectRoot = Directory.current;

  final pubspecFile = File('${projectRoot.path}${Platform.pathSeparator}pubspec.yaml');
  if (!await pubspecFile.exists()) {
    stderr.writeln('ERROR: pubspec.yaml not found in ${projectRoot.path}');
    exitCode = 2;
    return;
  }

  final projectName = _parseProjectName(await pubspecFile.readAsString());

  final distDir = Directory('${projectRoot.path}${Platform.pathSeparator}dist');
  await _ensureDir(distDir);

  final toolingDir = Directory('${projectRoot.path}${Platform.pathSeparator}.dart_tool');
  await _ensureDir(toolingDir);

  // Minimal temporary Flutter project containing only `pubspec.yaml` + `lib/`.
  final workSrcDir = Directory('${toolingDir.path}${Platform.pathSeparator}dist_src');

  // Keep output outside src to avoid recursive self-copy.
  final workOutDir = Directory('${toolingDir.path}${Platform.pathSeparator}dist_out');

  stdout.writeln('==> preparing temp src project at ${workSrcDir.path}');
  await _deleteIfExists(workSrcDir);
  await _ensureDir(workSrcDir);

  await pubspecFile.copy('${workSrcDir.path}${Platform.pathSeparator}pubspec.yaml');

  final srcLibDir = Directory('${projectRoot.path}${Platform.pathSeparator}lib');
  final tmpLibDir = Directory('${workSrcDir.path}${Platform.pathSeparator}lib');
  if (!await srcLibDir.exists()) {
    stderr.writeln('ERROR: lib/ not found at ${srcLibDir.path}');
    exitCode = 2;
    return;
  }
  await _copyRecursive(srcLibDir, tmpLibDir);

  stdout.writeln('==> flutter pub get (temp src)');
  final pubGetExit = await _run(
    'flutter',
    ['pub', 'get'],
    workingDirectory: workSrcDir.path,
  );
  if (pubGetExit != 0) {
    stderr.writeln('ERROR: flutter pub get failed ($pubGetExit)');
    exitCode = pubGetExit;
    return;
  }

  stdout.writeln('==> installing transformer tool');
  final activateExit = await _run('dart', ['pub', 'global', 'activate', 'obfuscator']);
  if (activateExit != 0) {
    stderr.writeln('ERROR: tool install failed ($activateExit)');
    exitCode = activateExit;
    return;
  }

  stdout.writeln('==> cleaning temp output at ${workOutDir.path}');
  await _deleteIfExists(workOutDir);
  await _ensureDir(workOutDir);

  stdout.writeln('==> transforming lib sources (project: $projectName)');
  final transformExit = await _run(
    'dart',
    [
      'pub',
      'global',
      'run',
      'obfuscator',
      '--src',
      workSrcDir.path,
      '--out',
      workOutDir.path,
    ],
  );

  if (transformExit != 0) {
    stderr.writeln('ERROR: transform failed ($transformExit)');
    exitCode = transformExit;
    return;
  }

  // The tool mutates files under `<out>/copy/<srcName>/lib`.
  final copyLibCandidate = Directory(
    '${workOutDir.path}${Platform.pathSeparator}copy'
    '${Platform.pathSeparator}${_basename(workSrcDir.path)}'
    '${Platform.pathSeparator}lib',
  );

  final rootLibCandidate = Directory('${workOutDir.path}${Platform.pathSeparator}lib');

  Directory? processedLibDir;
  if (await copyLibCandidate.exists()) {
    processedLibDir = copyLibCandidate;
  } else if (await rootLibCandidate.exists()) {
    processedLibDir = rootLibCandidate;
  }

  // Prefer a lib tree that looks like a Flutter app.
  if (processedLibDir != null && !await _looksLikeFlutterLib(processedLibDir)) {
    if (await copyLibCandidate.exists() && await _looksLikeFlutterLib(copyLibCandidate)) {
      processedLibDir = copyLibCandidate;
    }
  }

  if (processedLibDir == null || !await processedLibDir.exists()) {
    stderr.writeln('ERROR: Could not locate processed lib/ output under ${workOutDir.path}');
    exitCode = 3;
    return;
  }

  final distLibDir = Directory('${distDir.path}${Platform.pathSeparator}lib');
  stdout.writeln('==> writing lib to ${distLibDir.path}');

  // Some transformer versions output a flat `lib/` directory (no subfolders),
  // which breaks relative imports in the original source tree. If the processed
  // output is flat, reconstruct the folder layout to match the original `lib/`.
  if (!await _hasSubdirectories(processedLibDir) && await _hasSubdirectories(srcLibDir)) {
    await _writeLibMatchingOriginalLayout(
      originalLibDir: srcLibDir,
      flatProcessedLibDir: processedLibDir,
      distLibDir: distLibDir,
    );
  } else {
    await _deleteIfExists(distLibDir);
    await _copyRecursive(processedLibDir, distLibDir);
  }

  final distArtifactsDir = Directory('${distDir.path}${Platform.pathSeparator}artifacts');
  await _ensureDir(distArtifactsDir);

  Future<void> copyIfExists(File src, String dstName) async {
    if (await src.exists()) {
      await src.copy('${distArtifactsDir.path}${Platform.pathSeparator}$dstName');
    }
  }

  stdout.writeln('==> copying build artifacts to ${distArtifactsDir.path}');
  await copyIfExists(File('${workOutDir.path}${Platform.pathSeparator}mappings.json'), 'mappings.json');
  await copyIfExists(File('${workOutDir.path}${Platform.pathSeparator}pubspec.yaml'), 'pubspec.yaml');

  // merged.dart location varies.
  final merged1 = File('${workOutDir.path}${Platform.pathSeparator}merged.dart');
  final merged2 = File(
    '${workOutDir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}merged.dart',
  );
  if (await merged1.exists()) {
    await copyIfExists(merged1, 'merged.dart');
  } else if (await merged2.exists()) {
    await copyIfExists(merged2, 'merged.dart');
  }

  stdout.writeln('DONE');
}

/// Silence analyzer lint for unawaited futures without importing package:pedantic.
void unawaited(Future<void> future) {}
