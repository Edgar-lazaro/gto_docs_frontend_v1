import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class NTH9i9aPwrRRm8OPAhRpr2 {
  final Dio bFo;

  NTH9i9aPwrRRm8OPAhRpr2({required this.bFo});

  Future<FormData> _g3eCiOdHRRQo5({
    required File file,
    required String filename,
    required Map<String, dynamic> metadata,
  }) async {
    final normalized = _u7vaVRuAaryMVhmeKmquIe4vwk(
      file: file,
      filename: filename,
      metadata: metadata,
    );

    return FormData.fromMap({
      ...normalized,
      'file': await MultipartFile.fromFile(
        file.path,
        filename: filename,
        contentType: MediaType('application', 'pdf'),
      ),
    });
  }

  Future<String> xBl0mt4FH({
    required File file,
    required String filename,
    required Map<String, dynamic> metadata,
  }) async {
    final source = (metadata['source'] ?? '').toString().toLowerCase().trim();

    // Prefer the new endpoints (served under baseUrl .../api).
    final preferred = <String>[
      '/documentos-pdf/upload',
      '/documentos_pdf/upload',
      if (source == 'checklist') '/checklists/adjuntos',
      if (source == 'reporte') '/reportes/adjuntos',
      // Safe fallback if source is missing/unknown.
      if (source != 'checklist' && source != 'reporte') '/tareas/adjuntos',
    ];

    // Legacy/alternative candidates kept for backwards compatibility.
    final candidates = <String>[
      ...preferred,
      '/pdfs',
      '/pdfs/upload',
      '/documentos/pdf',
      '/documentos_pdf',
      '/checklists/pdf',
    ];

    DioException? last;
    for (final path in candidates) {
      try {
        // IMPORTANT: FormData is single-use (finalized after sending).
        // Rebuild it for every attempt.
        final formData = await _g3eCiOdHRRQo5(
          file: file,
          filename: filename,
          metadata: metadata,
        );
        final res = await bFo.post(path, data: formData);
        final data = res.data;
        if (data is Map) {
          final m = data.cast<String, dynamic>();
          final url = (m['url'] ?? m['publicUrl'] ?? m['url_storage'] ?? '')
              .toString();
          if (url.isNotEmpty) return url;
        }
        // Respuesta sin URL: este endpoint no es compatible para nuestra necesidad.
        // Probamos el siguiente candidato.
        continue;
      } on DioException catch (e) {
        last = e;
        if (e.response?.statusCode == 404) continue;
        rethrow;
      }
    }

    if (last != null) throw last;
    throw StateError('No se encontró un endpoint para subir PDF');
  }

  Map<String, dynamic> _u7vaVRuAaryMVhmeKmquIe4vwk({
    required File file,
    required String filename,
    required Map<String, dynamic> metadata,
  }) {
    final source = (metadata['source'] ?? '').toString().toLowerCase().trim();
    final tipoDocumento = switch (source) {
      'checklist' => 'checklist',
      'reporte' => 'reporte',
      _ => 'reporte',
    };

    int? yT4Py(dynamic v) {
      if (v == null) return null;
      if (v is int) return v;
      return int.tryParse(v.toString());
    }

    final usuarioNombre =
        metadata['usuarioNombre'] ??
        metadata['usuario_nombre'] ??
        metadata['usuario'];
    final gerenciaId = yT4Py(metadata['gerenciaId'] ?? metadata['gerencia_id']);
    final jefaturaId = yT4Py(metadata['jefaturaId'] ?? metadata['jefatura_id']);
    final checklistNombre =
        metadata['checklistNombre'] ?? metadata['checklist_nombre'];

    if (usuarioNombre == null || usuarioNombre.toString().trim().isEmpty) {
      throw StateError('usuario_nombre es requerido para subir el PDF');
    }

    return <String, dynamic>{
      'tipo_documento': tipoDocumento,
      'usuario_nombre': usuarioNombre,
      'gerencia_id': gerenciaId ?? 0,
      'jefatura_id': jefaturaId ?? 0,
      'checklist_nombre': (checklistNombre ?? filename).toString(),
      'nombre_archivo': filename,
      'tamano_bytes': file.lengthSync().toString(),
    };
  }
}
