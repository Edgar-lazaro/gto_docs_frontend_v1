import 'package:local_auth/local_auth.dart';

class E3Rl9qbo5VSQRrvk {
  final LocalAuthentication _hX4G = LocalAuthentication();

  Future<bool> gdddZZ6Y2zZt() async {
    final canCheck = await _hX4G.canCheckBiometrics;
    if (!canCheck) return false;

    return await _hX4G.authenticate(
      localizedReason: 'Confirma tu identidad para registrar asistencia',
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );
  }
}