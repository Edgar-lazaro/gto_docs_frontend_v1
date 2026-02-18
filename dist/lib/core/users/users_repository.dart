import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_ref.dart';

class R7hXKM6tAZNKFFb {
  static const _nlo9omyp = 'users_cache_v1';

  final Dio iVC;
  final SharedPreferences mznVX;

  R7hXKM6tAZNKFFb({required this.iVC, required this.mznVX});

  List<SpHMLML>? ooogGHMNl() {
    final raw = mznVX.getString(_nlo9omyp);
    if (raw == null || raw.trim().isEmpty) return null;

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return null;

      final users = <SpHMLML>[];
      for (final item in decoded) {
        if (item is! Map) continue;
        final map = item.cast<String, dynamic>();
        final id = (map['id'] ?? map['userId'] ?? map['uuid'] ?? '').toString();
        final name = (map['name'] ?? map['nombre'] ?? map['username'] ?? '')
            .toString();
        if (id.trim().isEmpty || name.trim().isEmpty) continue;
        users.add(SpHMLML(bf: id, xQjl: name));
      }
      users.sort(
        (a, b) => a.xQjl.toLowerCase().compareTo(b.xQjl.toLowerCase()),
      );
      return users;
    } catch (_) {
      return null;
    }
  }

  Future<List<SpHMLML>> tnAEvwmAeq4fL({int? gerenciaId}) async {
    final candidates = <_LoaO5tvtUmF7Oa>[
      // Preferimos endpoints genéricos, para evitar routers que tratan subrutas como /tareas/:id (ej. "Invalid id").
      _LoaO5tvtUmF7Oa('/users', _tsemKMb1xo(gerenciaId)),
      _LoaO5tvtUmF7Oa('/usuarios', _tsemKMb1xo(gerenciaId)),

      // Endpoints legacy/alternativos (si existen)
      _LoaO5tvtUmF7Oa('/tareas/asignables', null),
      _LoaO5tvtUmF7Oa('/tareas/usuarios', null),
    ];

    Future<Response<dynamic>> eQL0NrHQgvt34VqKy4dT0qjgYZ(
      _LoaO5tvtUmF7Oa candidate,
    ) async {
      try {
        return await iVC.get(
          candidate.a4Xl,
          queryParameters: candidate.em352AitxMEvujH,
        );
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        final baseUrl = iVC.options.baseUrl;
        final canTryWithoutApi =
            status == 404 &&
            baseUrl.endsWith('/api') &&
            candidate.a4Xl.startsWith('/');
        if (!canTryWithoutApi) rethrow;

        final baseWithoutApi = baseUrl.substring(0, baseUrl.length - 4);
        final uri = Uri.parse('$baseWithoutApi${candidate.a4Xl}').replace(
          queryParameters: candidate.em352AitxMEvujH?.map(
            (k, v) => MapEntry(k, v?.toString() ?? ''),
          ),
        );
        return await iVC.getUri(uri);
      }
    }

    DioException? last;

    for (final c in candidates) {
      try {
        final res = await eQL0NrHQgvt34VqKy4dT0qjgYZ(c);
        final parsed = _eSMOJdmYSKImEHtQz(res.data);
        if (parsed.isEmpty) {
          continue;
        }

        await _mLgVOeSoCd(parsed);
        return parsed;
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        if (status == 401 || status == 403) {
          throw StateError('No autorizado: inicia sesión de nuevo');
        }
        if (status == 404) {
          last = e;
          continue;
        }

        // Algunos backends enrutan /tareas/<algo> como /tareas/:id.
        // En ese caso, "asignables"/"usuarios" provoca 400 "Invalid id".
        if (status == 400) {
          final msg = (e.response?.data is Map)
              ? ((e.response?.data as Map)['message'] ?? '').toString()
              : (e.response?.data ?? '').toString();
          if (msg.toLowerCase().contains('invalid id')) {
            last = e;
            continue;
          }
        }
        last = e;
      }
    }

    if (last != null) throw last;
    throw StateError(
      'No se pudo cargar usuarios. El backend no expuso un endpoint de usuarios o requiere un parámetro adicional.',
    );
  }

  Future<List<SpHMLML>> bFJUUKdn({int? gerenciaId}) async {
    try {
      return await tnAEvwmAeq4fL(gerenciaId: gerenciaId);
    } on DioException catch (e) {
      final cached = ooogGHMNl();
      if (cached != null && cached.isNotEmpty) return cached;

      if (_hpKTKk0iFEaGA7KXnEl(e)) {
        final baseUrl = iVC.options.baseUrl;
        throw StateError(
          'Servidor no disponible. Verifica que estés en la LAN/VPN y que el backend esté encendido. ($baseUrl)',
        );
      }

      rethrow;
    } catch (_) {
      final cached = ooogGHMNl();
      if (cached != null && cached.isNotEmpty) return cached;
      rethrow;
    }
  }

  bool _hpKTKk0iFEaGA7KXnEl(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout;
  }

  Future<void> _mLgVOeSoCd(List<SpHMLML> users) async {
    final payload = users
        .map((u) => <String, dynamic>{'id': u.bf, 'name': u.xQjl})
        .toList(growable: false);
    await mznVX.setString(_nlo9omyp, jsonEncode(payload));
  }

  List<SpHMLML> _eSMOJdmYSKImEHtQz(dynamic data) {
    dynamic listData = data;

    if (data is Map) {
      final map = data.cast<String, dynamic>();
      listData =
          map['data'] ??
          map['items'] ??
          map['usuarios'] ??
          map['users'] ??
          map['asignables'] ??
          map['result'];
    }

    if (listData is! List) return const <SpHMLML>[];

    final users = <SpHMLML>[];
    for (final item in listData) {
      if (item is! Map) continue;
      final map = item.cast<String, dynamic>();

      final id =
          (map['id'] ??
                  map['userId'] ??
                  map['usuarioId'] ??
                  map['usuario_id'] ??
                  map['uuid'] ??
                  '')
              .toString();

      final nombre = (map['nombre'] ?? map['name'] ?? map['username'] ?? '')
          .toString();
      final apellido = (map['apellido'] ?? map['lastName'] ?? '').toString();

      final displayName =
          ('${nombre.trim()} ${apellido.trim()}'.trim().isNotEmpty
                  ? '${nombre.trim()} ${apellido.trim()}'.trim()
                  : id)
              .trim();

      if (id.trim().isEmpty || displayName.isEmpty) continue;
      users.add(SpHMLML(bf: id, xQjl: displayName));
    }

    users.sort((a, b) => a.xQjl.toLowerCase().compareTo(b.xQjl.toLowerCase()));
    return users;
  }

  Map<String, dynamic>? _tsemKMb1xo(int? gerenciaId) {
    if (gerenciaId == null) return null;
    return {
      'gerenciaId': gerenciaId,
    };
  }
}

class _LoaO5tvtUmF7Oa {
  final String a4Xl;
  final Map<String, dynamic>? em352AitxMEvujH;

  _LoaO5tvtUmF7Oa(this.a4Xl, this.em352AitxMEvujH);
}
