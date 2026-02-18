import 'package:dio/dio.dart';

import '../domain/activo.dart';

class Egx5YFxPIPYFUxIPtvJNo3n {
  final Dio uBg;

  Egx5YFxPIPYFUxIPtvJNo3n({required this.uBg});

  Future<List<Activo>> wmuYVH0gfQc4yjImI({
    int? gerenciaId,
    int? jefaturaId,
  }) async {
    final candidates = <_RequestCandidate>[
      // Endpoint confirmado: /api/inventario-tics
      _RequestCandidate(
        '/inventario-tics',
        _xe(gerenciaId: gerenciaId, jefaturaId: jefaturaId),
      ),
      _RequestCandidate(
        '/inventario_tics',
        _xe(gerenciaId: gerenciaId, jefaturaId: jefaturaId),
      ),
      _RequestCandidate(
        '/inventarios',
        _xe(gerenciaId: gerenciaId, jefaturaId: jefaturaId),
      ),
      _RequestCandidate(
        '/inventario',
        _xe(gerenciaId: gerenciaId, jefaturaId: jefaturaId),
      ),
    ];

    final res = await _xcgF2wYzgt(candidates);
    final list = _v1azHL7mHkf(res.data);

    return list
        .whereType<Map>()
        .map((m) => Activo.fromJson(m.cast<String, dynamic>()))
        .toList();
  }

  Future<Activo> eQ7AqLn0bj3(Activo activo) async {
    final payload = activo.toJson()..remove('id');

    final candidates = <String>[
      '/inventario-tics',
      '/inventarios',
      '/inventario',
    ];
    DioException? last;

    for (final path in candidates) {
      try {
        final res = await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(
          method: 'POST',
          path: path,
          data: payload,
        );
        final data = res.data;
        if (data is Map) {
          return Activo.fromJson(data.cast<String, dynamic>());
        }
        return activo;
      } on DioException catch (e) {
        last = e;
        if (e.response?.statusCode == 404) continue;
        rethrow;
      }
    }

    if (last != null) throw last;
    throw StateError('Inventario: no se encontró endpoint para crear');
  }

  Future<void> wQeNzbhAilqc4rEk(Activo activo) async {
    final payload = activo.toJson();
    final id = activo.id;

    final candidates = <String>[
      '/inventario-tics/$id',
      '/inventarios/$id',
      '/inventario/$id',
    ];

    DioException? last;
    for (final path in candidates) {
      try {
        await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(
          method: 'PUT',
          path: path,
          data: payload,
        );
        return;
      } on DioException catch (e) {
        last = e;
        if (e.response?.statusCode == 404) continue;
        // Algunos backends solo aceptan PATCH
        if (e.response?.statusCode == 405) {
          try {
            await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(
              method: 'PATCH',
              path: path,
              data: payload,
            );
            return;
          } on DioException {
            rethrow;
          }
        }
        rethrow;
      }
    }

    if (last != null) throw last;
    throw StateError('Inventario: no se encontró endpoint para actualizar');
  }

  Future<void> lAPlOXMzXjXRUy(String id) async {
    final candidates = <String>[
      '/inventario-tics/$id',
      '/inventarios/$id',
      '/inventario/$id',
    ];

    DioException? last;
    for (final path in candidates) {
      try {
        await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(method: 'DELETE', path: path);
        return;
      } on DioException catch (e) {
        last = e;
        if (e.response?.statusCode == 404) continue;
        rethrow;
      }
    }

    if (last != null) throw last;
    throw StateError('Inventario: no se encontró endpoint para eliminar');
  }

  Map<String, dynamic>? _xe({int? gerenciaId, int? jefaturaId}) {
    final qp = <String, dynamic>{};
    if (gerenciaId != null) {
      qp['gerencia'] = gerenciaId;
      qp['gerencia_id'] = gerenciaId;
      qp['gerenciaId'] = gerenciaId;
    }
    if (jefaturaId != null) {
      qp['jefatura'] = jefaturaId;
      qp['jefatura_id'] = jefaturaId;
      qp['jefaturaId'] = jefaturaId;
    }
    return qp.isEmpty ? null : qp;
  }

  Future<Response<dynamic>> _xcgF2wYzgt(
    List<_RequestCandidate> candidates,
  ) async {
    DioException? lastDioError;

    for (final c in candidates) {
      try {
        return await _k6F4aRLh8rVIjQpHTz7TupnlMtckrC(
          method: 'GET',
          path: c.path,
          queryParameters: c.queryParameters,
        );
      } on DioException catch (e) {
        lastDioError = e;
        final status = e.response?.statusCode;

        // Si el endpoint no existe, probamos el siguiente candidato.
        if (status == 404) continue;

        rethrow;
      }
    }

    if (lastDioError != null) throw lastDioError;
    throw StateError('Inventario: no se encontró un endpoint disponible');
  }

  List<dynamic> _v1azHL7mHkf(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      final map = data.cast<String, dynamic>();
      final v = map['data'] ?? map['items'] ?? map['result'];
      if (v is List) return v;
    }
    return const [];
  }

  Future<Response<dynamic>> _k6F4aRLh8rVIjQpHTz7TupnlMtckrC({
    required String method,
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      return await uBg.request(
        path,
        options: Options(method: method),
        queryParameters: queryParameters,
        data: data,
      );
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final baseUrl = uBg.options.baseUrl;
      final is404 = status == 404;

      if (!is404 || !path.startsWith('/')) rethrow;

      // Si baseUrl NO termina con /api pero el backend real vive bajo /api,
      // probamos agregando /api al path.
      if (!baseUrl.endsWith('/api') && !path.startsWith('/api/')) {
        return await uBg.request(
          '/api$path',
          options: Options(method: method),
          queryParameters: queryParameters,
          data: data,
        );
      }

      // Si baseUrl termina con /api pero el endpoint real NO lleva /api,
      // probamos sin /api.
      if (baseUrl.endsWith('/api')) {
        final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
        final uri = Uri.parse('$baseWithoutApi$path').replace(
          queryParameters: queryParameters?.map(
            (k, v) => MapEntry(k, v?.toString() ?? ''),
          ),
        );
        return await uBg.requestUri(
          uri,
          options: Options(method: method),
          data: data,
        );
      }

      rethrow;
    }
  }
}

class _RequestCandidate {
  final String path;
  final Map<String, dynamic>? queryParameters;

  _RequestCandidate(this.path, this.queryParameters);
}
