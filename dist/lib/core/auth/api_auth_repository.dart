import 'package:dio/dio.dart';

import 'auth_repository.dart';
import 'auth_models.dart';
import 'session_manager.dart';

class HXmufg8PhipZgTVXm implements SQrj3Cecjbvq0H {
  final Dio x5O;
  final String wfDsPRvQIBID;
  final String pm7DIMBOLf;

  HXmufg8PhipZgTVXm({
    required this.x5O,
    this.wfDsPRvQIBID = '/auth/login',
    this.pm7DIMBOLf = '/auth/me',
  });

  @override
  Future<ZUV35mlB33k> inKrK({
    required String username,
    required String password,
  }) async {
    Future<Response<dynamic>> eVwmBw0(Map<String, dynamic> data) async {
      return await x5O.post(wfDsPRvQIBID, data: data);
    }

    final userKeys = <String>['username', 'usuario', 'user', 'email'];
    final passKeys = <String>['password', 'clave', 'contrasena', 'pass'];

    DioException? lastDio;
    Response<dynamic>? res;

    for (final uKey in userKeys) {
      for (final pKey in passKeys) {
        try {
          res = await eVwmBw0({uKey: username, pKey: password});
          break;
        } on DioException catch (e) {
          lastDio = e;
          // Si el backend devuelve 400 por shape inválido, intentamos otras llaves.
          if (e.response?.statusCode == 400) {
            continue;
          }
          rethrow;
        }
      }
      if (res != null) break;
    }

    if (res == null) {
      if (lastDio != null) throw lastDio;
      throw StateError('Login: no se pudo enviar credenciales.');
    }

    final token = _eTJ3FpYI8IuT(res.data);

    // Obtener usuario autenticado desde /auth/me
    final meRes = await x5O.get(
      pm7DIMBOLf,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final me = (meRes.data as Map).cast<String, dynamic>();

    final userId = (me['id'] ?? me['userId'] ?? me['sub'] ?? '').toString();
    final nombre = (me['nombre'] ?? me['username'] ?? '').toString();
    final area = (me['area'] ?? '').toString();
    final gerencia =
        (me['gerencia'] ??
                me['gerenciaNombre'] ??
                me['gerencia_name'] ??
                me['gerenciaId'] ??
                me['gerencia_id'] ??
                '')
            .toString();
    final rolesRaw = me['roles'];

    return ZUV35mlB33k(
      zkR30: token,
      goQt: KqBOLs41(
        gw: userId,
        u3aymK: nombre,
        sFiI: area,
        ucAcyxha: gerencia,
        fH7uu: rolesRaw is List
            ? rolesRaw.map((e) => e.toString()).toList()
            : const <String>[],
      ),
    );
  }

  String _eTJ3FpYI8IuT(dynamic data) {
    String? fVybDzqyiqWXAQ1pyElPCT(Map map) {
      final token =
          map['access_token'] ??
          map['accessToken'] ??
          map['token'] ??
          map['jwt'] ??
          map['id_token'] ??
          map['idToken'];
      if (token is String && token.trim().isNotEmpty) return token.trim();
      return null;
    }

    // 1) Respuesta directa como string.
    if (data is String && data.trim().isNotEmpty) return data.trim();

    // 2) Respuesta como mapa (posible nesting: data/result/payload).
    if (data is Map) {
      final root = data;

      // Direct keys
      final direct = fVybDzqyiqWXAQ1pyElPCT(root);
      if (direct != null) return direct;

      // Common nesting levels
      const nestKeys = <String>['data', 'result', 'payload', 'session', 'auth'];
      for (final k in nestKeys) {
        final nested = root[k];
        if (nested is String && nested.trim().isNotEmpty) return nested.trim();
        if (nested is Map) {
          final nestedToken = fVybDzqyiqWXAQ1pyElPCT(nested);
          if (nestedToken != null) return nestedToken;

          // One more level deep: e.g. data: { data: { token: ... } }
          for (final k2 in nestKeys) {
            final nested2 = nested[k2];
            if (nested2 is String && nested2.trim().isNotEmpty) {
              return nested2.trim();
            }
            if (nested2 is Map) {
              final t = fVybDzqyiqWXAQ1pyElPCT(nested2);
              if (t != null) return t;
            }
          }
        }
      }

      // Helpful error for debugging backend response shape
      final keys = root.keys.map((e) => e.toString()).toList()..sort();
      throw StateError('Login: respuesta sin token. Keys=$keys');
    }

    throw StateError('Login: respuesta sin token (tipo=${data.runtimeType})');
  }

  @override
  Future<ZUV35mlB33k?> ygDJQag3yA() async {
    // La sesión persistida la maneja SessionManager
    return null;
  }

  @override
  Future<void> bGwfss() async {
    // Opcional: notificar backend
  }
}
