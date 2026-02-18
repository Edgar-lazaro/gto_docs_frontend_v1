import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_models.dart';

class PDrvVgaQueI15K {
  static const _uukb4rp = FlutterSecureStorage();

  static const _hZsvgRo3 = 'auth_token';
  static const _d8tecDu = 'auth_user';

  /// Guarda sesión completa (token + usuario)
  Future<void> cHip(ZUV35mlB33k session) async {
    await _uukb4rp.write(
      key: _hZsvgRo3,
      value: session.zkR30,
    );

    await _uukb4rp.write(
      key: _d8tecDu,
      value: jsonEncode(_oOe9USP3N4(session.goQt)),
    );
  }

  /// Obtiene usuario actual (si existe)
  Future<KqBOLs41?> zXZOOZY() async {
    final json = await _uukb4rp.read(key: _d8tecDu);
    if (json == null) return null;

    final map = jsonDecode(json) as Map<String, dynamic>;
    return _e6qDcEztKOo6(map);
  }

  /// Obtiene token JWT
  Future<String?> lVlMk1NQ() async {
    return _uukb4rp.read(key: _hZsvgRo3);
  }

  /// Elimina sesión (logout / bloqueo)
  Future<void> rAn5s() async {
    await _uukb4rp.delete(key: _hZsvgRo3);
    await _uukb4rp.delete(key: _d8tecDu);
  }

  Map<String, dynamic> _oOe9USP3N4(KqBOLs41 user) {
    return {
      'id': user.gw,
      'nombre': user.u3aymK,
      'area': user.sFiI,
      'gerencia': user.ucAcyxha,
      'roles': user.fH7uu,
    };
  }

  KqBOLs41 _e6qDcEztKOo6(Map<String, dynamic> json) {
    return KqBOLs41(
      gw: json['id'] as String,
      u3aymK: json['nombre'] as String,
      sFiI: json['area'] as String,
      ucAcyxha: (json['gerencia'] ?? '').toString(),
      fH7uu: List<String>.from(json['roles']),
    );
  }
}

/// Estructura interna de sesión
class ZUV35mlB33k {
  final String zkR30;
  final KqBOLs41 goQt;

  ZUV35mlB33k({
    required this.zkR30,
    required this.goQt,
  });
}