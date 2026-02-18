import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../database/app_database.dart';
import '../auth/session_manager.dart';

class QDP06pvJjGc {
  final AppDatabase f3;
  final Dio jJP;
  final SessionManager cr3TaX0;

  QDP06pvJjGc({required this.f3, required this.jJP, required this.cr3TaX0});

  Future<Response<dynamic>> _xXtF0ovJ2ruRnzTIQHktmQulepu(
    String endpoint, {
    required dynamic data,
    Options? options,
  }) async {
    // Normalize to support callers using either '/path' or 'path'.
    final normalized = endpoint.startsWith('/')
        ? endpoint.substring(1)
        : endpoint;

    try {
      return await jJP.post(normalized, data: data, options: options);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final baseUrl = jJP.options.baseUrl;
      if (status != 404) rethrow;

      // Fallback 1: baseUrl ends with /api but endpoint does not include /api
      // Try without /api (legacy backend).
      if (baseUrl.endsWith('/api') && !normalized.startsWith('api/')) {
        final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
        final uri = Uri.parse('$baseWithoutApi/$normalized');
        return await jJP.postUri(uri, data: data, options: options);
      }

      // Fallback 2: baseUrl does NOT end with /api and endpoint does NOT include /api
      // Try with /api prefix.
      if (!baseUrl.endsWith('/api') && !normalized.startsWith('api/')) {
        return await jJP.post('api/$normalized', data: data, options: options);
      }

      rethrow;
    }
  }

  /// ASISTENCIA
  Future<void> h08wM6fRLIWIW5(int asistenciaId) async {
    final asistencia = await (f3.select(
      f3.asistenciaTable,
    )..where((a) => a.id.equals(asistenciaId))).getSingle();

    await jJP.post(
      '/asistencia',
      data: {
        'usuarioId': asistencia.usuarioId,
        'fechaHora': asistencia.fechaHora.toIso8601String(),
        'tipo': asistencia.tipo,
        'metodo': asistencia.metodo,
      },
    );

    await (f3.update(f3.asistenciaTable)
          ..where((a) => a.id.equals(asistenciaId)))
        .write(const AsistenciaTableCompanion(sincronizado: Value(true)));
  }

  /// GLPI
  Future<void> qo76KwulDFyK9L(Map<String, dynamic> payload) async {
    await jJP.post('/glpi/tickets', data: payload);
  }

  /// COMBUSTIBLE
  Future<Response<dynamic>?> lG81qUjek0bPsniw7WpwY0P(
    Map<String, dynamic> payload,
  ) async {
    final id = payload['id']?.toString();
    final modo = payload['modo']?.toString();
    if (id == null || id.isEmpty || modo == null || modo.isEmpty) {
      throw StateError('Payload de combustible incompleto: $payload');
    }

    Response<dynamic>? lastResponse;

    if (modo == 'usar_vehiculo') {
      lastResponse = await _fBnkNgwXLrsgN2QcfO9yx(payload);
    } else if (modo == 'cargar_combustible') {
      lastResponse = await _lwTxAvRPRJ8B7cQD9RSfqh9Gvw(payload);
    } else {
      throw StateError('Modo de combustible no soportado: $modo');
    }

    return lastResponse;
  }

  Future<Response<dynamic>> _fBnkNgwXLrsgN2QcfO9yx(
    Map<String, dynamic> payload,
  ) async {
    final metadata = payload['metadata'];

    String? u9YiAfMnzUBL(String key) {
      if (metadata is! Map) return null;
      final raw = metadata[key];
      if (raw is List && raw.isNotEmpty) {
        final p = raw.first?.toString();
        if (p != null && p.trim().isNotEmpty) return p.trim();
      }
      return null;
    }

    String? jSjNmDnqzt(String key) {
      final v = payload[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    String? kp5RVqOx8BJhg(String? raw) {
      if (raw == null) return null;
      final trimmed = raw.trim();
      if (trimmed.isEmpty) return null;
      final hhmm = RegExp(r'^\d{1,2}:\d{2}$');
      if (hhmm.hasMatch(trimmed)) return trimmed;
      final timeMatch = RegExp(r'(\d{1,2}):(\d{2})').firstMatch(trimmed);
      if (timeMatch == null) return trimmed;
      final hour = int.tryParse(timeMatch.group(1)!);
      final minute = int.tryParse(timeMatch.group(2)!);
      if (hour == null || minute == null) return trimmed;
      final suffix = trimmed
          .toLowerCase()
          .replaceAll('.', '')
          .replaceAll(' ', '')
          .replaceAll('\u00a0', '');
      if (!suffix.endsWith('am') && !suffix.endsWith('pm')) return trimmed;
      var h = hour % 12;
      if (suffix.endsWith('pm')) {
        h += 12;
      }
      final hh = h.toString().padLeft(2, '0');
      final mm = minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }

    String? jYQzheoONkaP() {
      final direct = payload['vehiculo'] ?? payload['vehiculoId'];
      if (direct != null) {
        final s = direct.toString().trim();
        if (s.isNotEmpty) return s;
      }
      if (metadata is Map) {
        final m = metadata['vehiculo'] ?? metadata['vehiculoId'];
        if (m != null) {
          final s = m.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return null;
    }

    final vehiculo = jYQzheoONkaP();
    if (vehiculo == null) {
      throw StateError('Vehículo requerido para uso de vehículo.');
    }

    final horaIni = kp5RVqOx8BJhg(jSjNmDnqzt('horaInicio'));
    final horaFin = kp5RVqOx8BJhg(jSjNmDnqzt('horaFinal'));

    final fotoIni = u9YiAfMnzUBL('fotosRegistroInicial');
    final fotoFin = u9YiAfMnzUBL('fotosRegistroFinal');
    if (fotoIni == null || fotoFin == null) {
      throw StateError('Se requieren fotos inicial y final.');
    }
    if (!await File(fotoIni).exists() || !await File(fotoFin).exists()) {
      throw StateError('No se encontraron fotos para subir.');
    }

    final form = FormData();
    form.fields.addAll([
      if (jSjNmDnqzt('nombre') != null)
        MapEntry('conductor', jSjNmDnqzt('nombre')!),
      if (jSjNmDnqzt('destino') != null)
        MapEntry('destino', jSjNmDnqzt('destino')!),
      if (horaIni != null) MapEntry('hora_inicio', horaIni),
      if (jSjNmDnqzt('combustibleInicial') != null)
        MapEntry('nivel_combustible', jSjNmDnqzt('combustibleInicial')!),
      if (payload['kilometrajeInicial'] != null)
        MapEntry(
          'kilometraje_inicial',
          payload['kilometrajeInicial'].toString(),
        ),
      if (horaFin != null) MapEntry('hora_final', horaFin),
      if (payload['kilometrajeFinal'] != null)
        MapEntry('kilometraje_final', payload['kilometrajeFinal'].toString()),
      MapEntry('vehiculo', vehiculo),
      if (payload['gerenciaId'] != null)
        MapEntry('gerenciaId', payload['gerenciaId'].toString()),
    ]);

    form.files.addAll([
      MapEntry('foto_km_inicial', await MultipartFile.fromFile(fotoIni)),
      MapEntry('foto_km_final', await MultipartFile.fromFile(fotoFin)),
    ]);

    try {
      return await jJP.post('/uso-car-tics/upload', data: form);
    } on DioException catch (e) {
      if (e.response?.statusCode != 404) rethrow;
      return await _jmgdmpD2R1RCT1aYUVXPQUflV(payload);
    }
  }

  Future<Response<dynamic>> _lwTxAvRPRJ8B7cQD9RSfqh9Gvw(
    Map<String, dynamic> payload,
  ) async {
    final metadata = payload['metadata'];

    String? y6bBfGpNCJI1(String key) {
      if (metadata is! Map) return null;
      final raw = metadata[key];
      if (raw is List && raw.isNotEmpty) {
        final p = raw.first?.toString();
        if (p != null && p.trim().isNotEmpty) return p.trim();
      }
      return null;
    }

    String? ts2u4Oykdk(String key) {
      final v = payload[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    String? tffHpMjZtLOI() {
      final direct = payload['vehiculo'] ?? payload['vehiculoId'];
      if (direct != null) {
        final s = direct.toString().trim();
        if (s.isNotEmpty) return s;
      }
      if (metadata is Map) {
        final m = metadata['vehiculo'] ?? metadata['vehiculoId'];
        if (m != null) {
          final s = m.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return null;
    }

    final vehiculo = tffHpMjZtLOI();
    if (vehiculo == null) {
      throw StateError('Vehículo requerido para cargar combustible.');
    }

    final fotoKmAntes = y6bBfGpNCJI1('fotosKmAntes');
    final fotoKmDespues = y6bBfGpNCJI1('fotosKmDespues');
    final fotoTicket = y6bBfGpNCJI1('fotosTicket');
    if (fotoKmAntes == null || fotoKmDespues == null || fotoTicket == null) {
      throw StateError('Se requieren fotos antes, después y ticket.');
    }
    if (!await File(fotoKmAntes).exists() ||
        !await File(fotoKmDespues).exists() ||
        !await File(fotoTicket).exists()) {
      throw StateError('No se encontraron fotos para subir.');
    }

    final form = FormData();
    form.fields.addAll([
      if (ts2u4Oykdk('operador') != null)
        MapEntry('operador', ts2u4Oykdk('operador')!),
      if (payload['kmAntes'] != null)
        MapEntry('km_bf_carga', payload['kmAntes'].toString()),
      if (payload['kmDespues'] != null)
        MapEntry('km_af_carga', payload['kmDespues'].toString()),
      MapEntry('vehiculo', vehiculo),
      if (payload['gerenciaId'] != null)
        MapEntry('gerenciaId', payload['gerenciaId'].toString()),
    ]);

    form.files.addAll([
      MapEntry('foto_km_bf', await MultipartFile.fromFile(fotoKmAntes)),
      MapEntry('foto_km_af', await MultipartFile.fromFile(fotoKmDespues)),
      MapEntry('foto_ticket', await MultipartFile.fromFile(fotoTicket)),
    ]);

    try {
      return await jJP.post('/carga-car-tics/upload', data: form);
    } on DioException catch (e) {
      if (e.response?.statusCode != 404) rethrow;
      return await _sMxPTGAhd5HaooTSUyCRxAlo0h3GQg(payload);
    }
  }

  Future<Response<dynamic>> _jmgdmpD2R1RCT1aYUVXPQUflV(
    Map<String, dynamic> payload,
  ) async {
    final metadata = payload['metadata'];

    String? omX0TumuMQGz(String key) {
      if (metadata is! Map) return null;
      final raw = metadata[key];
      if (raw is List && raw.isNotEmpty) {
        final p = raw.first?.toString();
        if (p != null && p.trim().isNotEmpty) return p.trim();
      }
      return null;
    }

    String? dKpQ2eeyfe(String key) {
      final v = payload[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    String? mKwYLiyE0wRkQ(String? raw) {
      if (raw == null) return null;
      final trimmed = raw.trim();
      if (trimmed.isEmpty) return null;
      final hhmm = RegExp(r'^\d{1,2}:\d{2}$');
      if (hhmm.hasMatch(trimmed)) return trimmed;
      final timeMatch = RegExp(r'(\d{1,2}):(\d{2})').firstMatch(trimmed);
      if (timeMatch == null) return trimmed;
      final hour = int.tryParse(timeMatch.group(1)!);
      final minute = int.tryParse(timeMatch.group(2)!);
      if (hour == null || minute == null) return trimmed;
      final suffix = trimmed
          .toLowerCase()
          .replaceAll('.', '')
          .replaceAll(' ', '')
          .replaceAll('\u00a0', '');
      if (!suffix.endsWith('am') && !suffix.endsWith('pm')) return trimmed;
      var h = hour % 12;
      if (suffix.endsWith('pm')) {
        h += 12;
      }
      final hh = h.toString().padLeft(2, '0');
      final mm = minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }

    String? nmQI3A2piBJg() {
      final direct = payload['vehiculo'] ?? payload['vehiculoId'];
      if (direct != null) {
        final s = direct.toString().trim();
        if (s.isNotEmpty) return s;
      }
      if (metadata is Map) {
        final m = metadata['vehiculo'] ?? metadata['vehiculoId'];
        if (m != null) {
          final s = m.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return null;
    }

    final vehiculo = nmQI3A2piBJg();
    if (vehiculo == null) {
      throw StateError('Vehículo requerido para uso de vehículo.');
    }

    final data = <String, dynamic>{
      'vehiculo': vehiculo,
      'conductor': dKpQ2eeyfe('nombre'),
      'destino': dKpQ2eeyfe('destino'),
      'hora_inicio': mKwYLiyE0wRkQ(dKpQ2eeyfe('horaInicio')),
      'nivel_combustible': dKpQ2eeyfe('combustibleInicial'),
      'kilometraje_inicial': payload['kilometrajeInicial']?.toString(),
      'foto_km_inicial': await _nlKJE7JpVRZMwB(
        omX0TumuMQGz('fotosRegistroInicial'),
        'uso_ini',
      ),
      'hora_final': mKwYLiyE0wRkQ(dKpQ2eeyfe('horaFinal')),
      'kilometraje_final': payload['kilometrajeFinal']?.toString(),
      'foto_km_final': await _nlKJE7JpVRZMwB(
        omX0TumuMQGz('fotosRegistroFinal'),
        'uso_fin',
      ),
      if (payload['gerenciaId'] != null) 'gerenciaId': payload['gerenciaId'],
    }..removeWhere((_, v) => v == null || v.toString().trim().isEmpty);

    return await jJP.post('/uso-car-tics', data: data);
  }

  Future<Response<dynamic>> _sMxPTGAhd5HaooTSUyCRxAlo0h3GQg(
    Map<String, dynamic> payload,
  ) async {
    final metadata = payload['metadata'];

    String? nHYgBQJp9ird(String key) {
      if (metadata is! Map) return null;
      final raw = metadata[key];
      if (raw is List && raw.isNotEmpty) {
        final p = raw.first?.toString();
        if (p != null && p.trim().isNotEmpty) return p.trim();
      }
      return null;
    }

    String? ouHFHSVVRo(String key) {
      final v = payload[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    String? axtPv5hmsRA0() {
      final direct = payload['vehiculo'] ?? payload['vehiculoId'];
      if (direct != null) {
        final s = direct.toString().trim();
        if (s.isNotEmpty) return s;
      }
      if (metadata is Map) {
        final m = metadata['vehiculo'] ?? metadata['vehiculoId'];
        if (m != null) {
          final s = m.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return null;
    }

    final vehiculo = axtPv5hmsRA0();
    if (vehiculo == null) {
      throw StateError('Vehículo requerido para cargar combustible.');
    }

    final data = <String, dynamic>{
      'operador': ouHFHSVVRo('operador'),
      'km_bf_carga': payload['kmAntes']?.toString(),
      'foto_km_bf': await _nlKJE7JpVRZMwB(
        nHYgBQJp9ird('fotosKmAntes'),
        'carga_bf',
      ),
      'km_af_carga': payload['kmDespues']?.toString(),
      'foto_km_af': await _nlKJE7JpVRZMwB(
        nHYgBQJp9ird('fotosKmDespues'),
        'carga_af',
      ),
      'vehiculo': vehiculo,
      'foto_ticket': await _nlKJE7JpVRZMwB(
        nHYgBQJp9ird('fotosTicket'),
        'carga_ticket',
      ),
      if (payload['gerenciaId'] != null) 'gerenciaId': payload['gerenciaId'],
    }..removeWhere((_, v) => v == null || v.toString().trim().isEmpty);

    return await jJP.post('/carga-car-tics', data: data);
  }

  Future<String?> _nlKJE7JpVRZMwB(String? path, String prefix) async {
    if (path == null) return null;
    final file = File(path);
    if (!await file.exists()) return null;
    const maxBytes = 900 * 1024;
    final len = await file.length();
    if (len <= maxBytes) {
      final bytes = await file.readAsBytes();
      return base64Encode(bytes);
    }

    try {
      final tempDir = await getTemporaryDirectory();
      final ext = p.extension(path).toLowerCase();
      final targetPath = p.join(
        tempDir.path,
        '${prefix}_${DateTime.now().millisecondsSinceEpoch}$ext',
      );

      Future<Uint8List?> fjXSBNGD1P(int quality, int size) async {
        return FlutterImageCompress.compressWithFile(
          path,
          quality: quality,
          minWidth: size,
          minHeight: size,
          format: CompressFormat.jpeg,
        );
      }

      final attempts = <(int quality, int size)>[
        (70, 1600),
        (60, 1400),
        (50, 1200),
        (40, 1000),
      ];

      Uint8List? best;
      for (final (q, s) in attempts) {
        final bytes = await fjXSBNGD1P(q, s);
        if (bytes == null || bytes.isEmpty) continue;
        best = bytes;
        if (bytes.lengthInBytes <= maxBytes) break;
      }

      if (best != null && best.isNotEmpty) {
        await File(targetPath).writeAsBytes(best, flush: true);
        return base64Encode(best);
      }
    } catch (_) {}

    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }

  /// REPORTE
  Future<void> ptNXLFqxsUl(Map<String, dynamic> payload) async {
    final creadorId =
        (payload['creadorId'] ?? payload['creadoPor'] ?? payload['usuarioId'])
            as String?;
    final usuarioId =
        (payload['usuarioId'] ?? payload['creadorId'] ?? payload['creadoPor'])
            as String?;

    final data = <String, dynamic>{
      'id': payload['id'],
      'titulo': payload['titulo'],
      'descripcion': payload['descripcion'],
      'area': payload['area'],
      'estado': payload['estado'],
      'creadorId': creadorId,
      'usuarioId': usuarioId,
    }..removeWhere((_, v) => v == null);

    await jJP.post('/reportes', data: data);
  }

  /// COMENTARIO DE REPORTE
  Future<void> dVKGFEmJTtoD4I7suGy8n(Map<String, dynamic> payload) async {
    final data = <String, dynamic>{
      'id': payload['id'],
      'reporteId': payload['reporteId'],
      'usuarioId': payload['usuarioId'] ?? payload['autorId'],
      'mensaje': payload['mensaje'],
    }..removeWhere((_, v) => v == null);

    await jJP.post('/reportes/comentarios', data: data);
  }

  /// COMENTARIO DE TAREA
  Future<void> d7Pzjj0Rp74UGXxDNEr(Map<String, dynamic> payload) async {
    final data = <String, dynamic>{
      'id': payload['id'],
      'tareaId': payload['tareaId'],
      'usuarioId': payload['usuarioId'] ?? payload['autorId'],
      'mensaje': payload['mensaje'],
    }..removeWhere((_, v) => v == null);

    await _xXtF0ovJ2ruRnzTIQHktmQulepu('/tareas/comentarios', data: data);
  }

  /// ADJUNTO DE TAREA
  Future<void> gDNtocqDuonYqPHe(Map<String, dynamic> payload) async {
    final filePath = payload['localPath'] as String;

    final formData = FormData.fromMap({
      'id': payload['id'],
      'tareaId': payload['tareaId'],
      'tipo': payload['tipo'],
      'nombre': payload['nombre'],
      'file': await MultipartFile.fromFile(filePath),
    });

    final resp = await _xXtF0ovJ2ruRnzTIQHktmQulepu(
      '/tareas/adjuntos',
      data: formData,
    );

    final data = resp.data;
    if (data is Map) {
      final url = (data['url'] ?? data['remoteUrl'])?.toString();
      if (url != null && url.isNotEmpty) {
        await (f3.update(f3.tareaAdjuntosTable)
              ..where((a) => a.id.equals(payload['id'] as String)))
            .write(TareaAdjuntosTableCompanion(remoteUrl: Value(url)));
      }
    }
  }

  /// CAMBIO DE ESTADO DE TAREA
  Future<void> kyyFARPSE1WnMMB(Map<String, dynamic> payload) async {
    final id = payload['id']?.toString();
    final estado = payload['estado']?.toString();
    if (id == null || id.isEmpty || estado == null || estado.isEmpty) {
      throw StateError('Payload de estado incompleto: $payload');
    }

    // Endpoint requerido: POST /api/tareas/estado
    final baseUrl = jJP.options.baseUrl;
    final endpoint = '/tareas/estado';
    if (baseUrl.endsWith('/api')) {
      final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
      final uri = Uri.parse('$baseWithoutApi$endpoint');
      await jJP.postUri(uri, data: {'id': id, 'estado': estado});
      return;
    }

    await jJP.post(endpoint, data: {'id': id, 'estado': estado});
  }

  /// EVIDENCIA (UPLOAD DE ARCHIVO)
  Future<void> aCg3viF3f2Bwm4w0qcYz(Map<String, dynamic> payload) async {
    final filePath = payload['localPath'] as String;

    final formData = FormData.fromMap({
      'id': payload['id'],
      'reporteId': payload['reporteId'],
      'tipo': payload['tipo'],
      'nombre': payload['nombre'],
      'file': await MultipartFile.fromFile(filePath),
    });

    await jJP.post('/reportes/evidencias', data: formData);
  }

  /// TAREA
  Future<Map<String, dynamic>?> eF2GZvl2a(Map<String, dynamic> payload) async {
    bool f6Ia0XzGMiFF(int? code) => code == 409;

    Future<Response<dynamic>> yi8hPdaFuL7gHGhb1XAiQWdsGif(
      String endpoint, {
      required Map<String, dynamic> data,
    }) async {
      return _xXtF0ovJ2ruRnzTIQHktmQulepu(endpoint, data: data);
    }

    String iClKIHMdErPtjSi(String raw) {
      // Compat entre app (enProceso) y backends (en_proceso/en_progreso).
      return switch (raw) {
        'enProceso' => 'en_proceso',
        'en_progreso' => 'en_progreso',
        _ => raw,
      };
    }

    final titulo = payload['titulo'] as String?;
    final estadoRaw = payload['estado'] as String?;
    final descripcionRaw = (payload['descripcion'] as String?) ?? '';
    final asignadoA = payload['asignadoA'] as String?;

    if (titulo == null || titulo.trim().isEmpty) {
      throw StateError('Payload de tarea incompleto (titulo): $payload');
    }

    final estado = iClKIHMdErPtjSi(estadoRaw ?? 'pendiente');
    final descripcion = descripcionRaw.trim().isEmpty
        ? titulo.trim()
        : descripcionRaw.trim();

    // Backend LEGACY (public.tareas) NO acepta: id/estado/creadorId/asignaciones.
    // Espera: titulo, descripcion?, estatus, usuario_asignado, asignado_por, fecha_limite?
    final usuarioAsignado =
        (payload['usuario_asignado'] ?? asignadoA) as String?;
    if (usuarioAsignado == null || usuarioAsignado.isEmpty) {
      throw StateError(
        'Payload de tarea incompleto (usuario_asignado): $payload',
      );
    }

    final legacyData = <String, dynamic>{
      'titulo': titulo,
      if (descripcion.isNotEmpty) 'descripcion': descripcion,
      'estatus': estado,
      'usuario_asignado': usuarioAsignado,
      // opcional
      if (payload['fecha_limite'] != null)
        'fecha_limite': payload['fecha_limite'],
    }..removeWhere((_, v) => v == null);

    final legacyEndpoints = <String>['/tareas'];

    DioException? last;
    for (final ep in legacyEndpoints) {
      try {
        // ignore: avoid_print
        print('[SYNC] POST $ep (legacy tarea) data=$legacyData');
        final response = await yi8hPdaFuL7gHGhb1XAiQWdsGif(
          ep,
          data: legacyData,
        );
        // ignore: avoid_print
        print('[SYNC] POST $ep (legacy tarea) -> OK');
        final data = response.data;
        return (data is Map<String, dynamic>) ? data : null;
      } on DioException catch (e) {
        // ignore: avoid_print
        print(
          '[SYNC] POST $ep (legacy tarea) -> ${e.response?.statusCode} ${e.message} body=${e.response?.data}',
        );
        if (f6Ia0XzGMiFF(e.response?.statusCode)) return null;
        last = e;
      }
    }
    if (last != null) throw last;
    return null;
  }
}
