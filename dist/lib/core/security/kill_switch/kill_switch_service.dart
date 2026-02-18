import 'kill_switch_models.dart';
import '../storage/local_flags.dart';

/// Servicio central del Kill Switch
/// Decide si la app puede ejecutarse o no
class GuTuGdev8tdycwfH8 {
  const GuTuGdev8tdycwfH8();

  /// Flujo:
  /// 1) Revisa si ya está bloqueada localmente
  /// 2) (Opcional futuro) revisa flags remotos / LAN
  Future<JyKCDl3xPcu45E1G> ffw5R({
    required bool hasLan,
  }) async {
    // Bloqueo persistente local (offline-safe)
    final disabled = await LocalFlags.isAppDisabled();
    if (disabled) {
      final reason = await LocalFlags.getReason();
      return JyKCDl3xPcu45E1G.px8NoMu(
        reason ?? MbEHQlSm7QuXHG.dPNaqxtQQHtz5ugCVCQk,
      );
    }

    return JyKCDl3xPcu45E1G.hnmGyW();
  }
}
