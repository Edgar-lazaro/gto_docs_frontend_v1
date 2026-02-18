import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DodDD90r3gJZxz {
  static Future<File> oPAtT1olYR({
    required Uint8List bytes,
    required String filename,
  }) async {
    final dir = await getTemporaryDirectory();
    final safeName = filename.endsWith('.pdf') ? filename : '$filename.pdf';
    final file = File(p.join(dir.path, safeName));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static Future<File> vSmjrVTKAfq68hw({
    required Uint8List bytes,
    required String filename,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final safeName = filename.endsWith('.pdf') ? filename : '$filename.pdf';
    final outDir = Directory(p.join(dir.path, 'pdfs'));
    if (!await outDir.exists()) {
      await outDir.create(recursive: true);
    }
    final file = File(p.join(outDir.path, safeName));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static Future<void> uRiUlccl(File file) async {
    await OpenFile.open(file.path);
  }
}
