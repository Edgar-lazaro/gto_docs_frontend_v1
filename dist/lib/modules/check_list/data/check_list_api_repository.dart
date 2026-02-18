import 'package:dio/dio.dart';

import '../domain/checklist_existente.dart';
import '../domain/jefatura.dart';

class PKkYK9BvJuOlesCt4bUgKZ {
  final Dio xvO;

  PKkYK9BvJuOlesCt4bUgKZ({required this.xvO});

  Future<List<Jefatura>> xfxScmLGfjtbnUqw({int? gerenciaId}) async {
    final candidates = <_SdVpDZeQAWckSYEr>[
      // Endpoint confirmado: /api/jefaturas
      _SdVpDZeQAWckSYEr('/jefaturas', _e3(gerenciaId: gerenciaId)),
      _SdVpDZeQAWckSYEr('/jefaturas/list', _e3(gerenciaId: gerenciaId)),

      _SdVpDZeQAWckSYEr('/checklist/jefaturas', _e3(gerenciaId: gerenciaId)),
      _SdVpDZeQAWckSYEr('/checklists/jefaturas', _e3(gerenciaId: gerenciaId)),
      _SdVpDZeQAWckSYEr(
        '/checklist/jefaturas/list',
        _e3(gerenciaId: gerenciaId),
      ),
    ];

    final res = await _qyTWmVtsVj('jefaturas', candidates);
    final list = _pYyvNhdVNIP(res.data);

    return list
        .whereType<Map>()
        .map((m) => Jefatura.fromJson(m.cast<String, dynamic>()))
        .toList();
  }

  Future<List<ChecklistExistente>> zZ8xDhxUdqqzmU6cvo7({
    required int jefaturaId,
    int? gerenciaId,
  }) async {
    final candidates = <_SdVpDZeQAWckSYEr>[
      // Endpoint confirmado: /api/cl-existentes?jefatura=<ID>
      // Nota: _getWithOptionalApiFallback intentará agregar/quitar /api si hace falta.
      _SdVpDZeQAWckSYEr('/cl-existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefatura': jefaturaId,
      }),

      // Variantes legacy/compat (algunos backends usan snake_case o nombre distinto)
      _SdVpDZeQAWckSYEr('/cl-existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefatura_id': jefaturaId,
      }),
      _SdVpDZeQAWckSYEr('/cl-existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefaturaId': jefaturaId,
      }),
      _SdVpDZeQAWckSYEr('/cl_existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefatura': jefaturaId,
      }),

      // Fallback viejo (tu log mostraba que se estaba intentando esto, pero en tu backend da 404)
      _SdVpDZeQAWckSYEr('/checklist/cl_existentes', {
        ...?_e3(gerenciaId: gerenciaId),
        'jefatura': jefaturaId,
      }),
    ];

    final res = await _qyTWmVtsVj('cl_existentes', candidates);
    final list = _pYyvNhdVNIP(res.data);

    final parsed = list
        .whereType<Map>()
        .map((m) => ChecklistExistente.fromJson(m.cast<String, dynamic>()))
        .toList();

    return parsed;
  }

  Map<String, dynamic>? _e3({int? gerenciaId}) {
    if (gerenciaId == null) return null;
    return {
      'gerencia': gerenciaId,
      'gerencia_id': gerenciaId,
      'gerenciaId': gerenciaId,
      'gerencia_cl': gerenciaId,
    };
  }

  Future<Response<dynamic>> _qyTWmVtsVj(
    String feature,
    List<_SdVpDZeQAWckSYEr> candidates,
  ) async {
    DioException? lastDioError;
    DioException? lastAuthError;

    for (final c in candidates) {
      try {
        return await _kzLVgkT8Xc2df0YKSiE5v4CTAD(
          c.ph7v,
          queryParameters: c.rEJeLUIvivCAj0e,
        );
      } on DioException catch (e) {
        final status = e.response?.statusCode;

        // Si un candidato requiere token/permisos pero hay otro endpoint
        // alternativo que sí funciona, no cortamos aquí.
        if (status == 401 || status == 403) {
          lastAuthError = e;
          continue;
        }

        lastDioError = e;

        if (status == 404) continue;

        // Algunos backends enrutan /checklist/<algo> como /checklist/:id.
        // En ese caso, subrutas como "jefaturas" pueden provocar 400 "Invalid id".
        if (status == 400) {
          final msg = (e.response?.data is Map)
              ? ((e.response?.data as Map)['message'] ?? '').toString()
              : (e.response?.data ?? '').toString();
          if (msg.toLowerCase().contains('invalid id')) {
            continue;
          }
        }

        if (_gP9cC0QOJDIvHa0kvP4(e)) {
          final baseUrl = xvO.options.baseUrl;
          throw StateError(
            'Servidor no disponible. Verifica LAN/VPN y el backend. ($baseUrl)',
          );
        }

        rethrow;
      }
    }

    if (lastAuthError != null) {
      throw StateError('No autorizado: inicia sesión de nuevo');
    }

    if (lastDioError != null) {
      final baseUrl = xvO.options.baseUrl;
      throw StateError(
        'Checklist: no se encontró endpoint para $feature. ($baseUrl)',
      );
    }

    throw StateError('Checklist: no se encontró un endpoint disponible');
  }

  Future<Response<dynamic>> _kzLVgkT8Xc2df0YKSiE5v4CTAD(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await xvO.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final baseUrl = xvO.options.baseUrl;
      final is404 = status == 404;
      if (!is404 || !path.startsWith('/')) rethrow;

      // Caso A: baseUrl termina con /api pero el path real NO lleva /api (ej: '/jefaturas').
      // Probamos sin /api (baseUrl sin /api).
      if (baseUrl.endsWith('/api')) {
        final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
        final uri = Uri.parse('$baseWithoutApi$path').replace(
          queryParameters: queryParameters?.map(
            (k, v) => MapEntry(k, v?.toString() ?? ''),
          ),
        );
        return await xvO.getUri(uri);
      }

      // Caso B: baseUrl NO termina con /api pero el backend real vive bajo /api.
      // Probamos agregando /api al path (sin duplicar).
      if (!path.startsWith('/api/')) {
        return await xvO.get('/api$path', queryParameters: queryParameters);
      }

      rethrow;
    }
  }

  bool _gP9cC0QOJDIvHa0kvP4(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout;
  }

  List<dynamic> _pYyvNhdVNIP(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      final map = data.cast<String, dynamic>();
      final v = map['data'] ?? map['items'] ?? map['result'];
      if (v is List) return v;
    }
    return const [];
  }
}

class _SdVpDZeQAWckSYEr {
  final String ph7v;
  final Map<String, dynamic>? rEJeLUIvivCAj0e;

  _SdVpDZeQAWckSYEr(this.ph7v, this.rEJeLUIvivCAj0e);
}
