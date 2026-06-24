import 'package:dio/dio.dart';

import 'auth_repository.dart';
import 'auth_models.dart';
import 'session_manager.dart';

class ApiAuthRepository implements AuthRepository {
  final Dio dio;
  final String authEndpoint;
  final String meEndpoint;

  ApiAuthRepository({
    required this.dio,
    this.authEndpoint = '/auth/login',
    this.meEndpoint = '/auth/me',
  });

  @override
  Future<SessionData> login({
    required String username,
    required String password,
  }) async {
    Future<Response<dynamic>> attempt(Map<String, dynamic> data) async {
      return await dio.post(authEndpoint, data: data);
    }

    final userKeys = <String>['username', 'usuario', 'user', 'email'];
    final passKeys = <String>['password', 'clave', 'contrasena', 'pass'];

    DioException? lastDio;
    Response<dynamic>? res;

    for (final uKey in userKeys) {
      for (final pKey in passKeys) {
        try {
          res = await attempt({uKey: username, pKey: password});
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

    final token = _extractToken(res.data);

    // Obtener usuario autenticado desde /auth/me
    final meRes = await dio.get(
      meEndpoint,
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

    final glpiUserIdRaw = me['glpiUserId'] ?? me['glpi_user_id'];
    final glpiUserId = glpiUserIdRaw is int
        ? glpiUserIdRaw
        : (glpiUserIdRaw != null ? int.tryParse(glpiUserIdRaw.toString()) : int.tryParse(userId));

    return SessionData(
      token: token,
      user: AuthUser(
        id: userId,
        nombre: nombre,
        area: area,
        gerencia: gerencia,
        roles: rolesRaw is List
            ? rolesRaw.map((e) => e.toString()).toList()
            : const <String>[],
        glpiUserId: glpiUserId,
      ),
    );
  }

  String _extractToken(dynamic data) {
    String? readDirectTokenFromMap(Map map) {
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
      final direct = readDirectTokenFromMap(root);
      if (direct != null) return direct;

      // Common nesting levels
      const nestKeys = <String>['data', 'result', 'payload', 'session', 'auth'];
      for (final k in nestKeys) {
        final nested = root[k];
        if (nested is String && nested.trim().isNotEmpty) return nested.trim();
        if (nested is Map) {
          final nestedToken = readDirectTokenFromMap(nested);
          if (nestedToken != null) return nestedToken;

          // One more level deep: e.g. data: { data: { token: ... } }
          for (final k2 in nestKeys) {
            final nested2 = nested[k2];
            if (nested2 is String && nested2.trim().isNotEmpty) {
              return nested2.trim();
            }
            if (nested2 is Map) {
              final t = readDirectTokenFromMap(nested2);
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
  Future<SessionData?> getSession() async {
    // La sesión persistida la maneja SessionManager
    return null;
  }

  @override
  Future<void> logout() async {
    // Opcional: notificar backend
  }
}
