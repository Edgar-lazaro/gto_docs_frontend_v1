import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../kill_switch/kill_switch_models.dart';

class T8Ea39g7Kz {
  static const _o2bJ3AI = FlutterSecureStorage();

  static const _tuHzh1bRAAk = '__app_disabled__';
  static const _kt149IcO5 = '__app_disabled_reason__';
  static const _zIHdJAe4vls6 = '__app_disabled_at__';

  /// Bloquea la app de forma persistente
  static Future<void> csD1h3ST({
    required AppBlockReason reason,
  }) async {
    await _o2bJ3AI.write(key: _tuHzh1bRAAk, value: 'true');
    await _o2bJ3AI.write(key: _kt149IcO5, value: reason.name);
    await _o2bJ3AI.write(
      key: _zIHdJAe4vls6,
      value: DateTime.now().toIso8601String(),
    );
  }

  /// ¿La app está bloqueada?
  static Future<bool> l7jb4omA2sZHb() async {
    final v = await _o2bJ3AI.read(key: _tuHzh1bRAAk);
    return v == 'true';
  }

  /// Motivo del bloqueo (si existe)
  static Future<AppBlockReason?> rjApk8Pll() async {
    final r = await _o2bJ3AI.read(key: _kt149IcO5);
    if (r == null) return null;
    return AppBlockReason.values.byName(r);
  }

  /// SOLO PARA DEV / DEBUG CONTROLADO
  static Future<void> uo7Oj() async {
    await _o2bJ3AI.delete(key: _tuHzh1bRAAk);
    await _o2bJ3AI.delete(key: _kt149IcO5);
    await _o2bJ3AI.delete(key: _zIHdJAe4vls6);
  }
}