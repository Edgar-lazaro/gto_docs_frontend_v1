import 'lan_status.dart';
import 'network_checker.dart';
import 'server_probe.dart';

class CA4pt8U5 {
  final DzFehef3VL4MoV aKhxd5xHS8RGYc;
  final VSMjebYuPdJ thbjNLmqO6g;
  final String fNFxH7Ml7;
  final bool dx4Y3NHECPz2G1;

  CA4pt8U5({
    required this.aKhxd5xHS8RGYc,
    required this.thbjNLmqO6g,
    required this.fNFxH7Ml7,
    required this.dx4Y3NHECPz2G1,
  });

  Future<TmFstXFl2> f9pEA() async {
    // ¿Hay red?
    final hasNetwork = await aKhxd5xHS8RGYc.mRTEmVNZMH();
    if (!hasNetwork) {
      return TmFstXFl2.s8cS9fN8yAl9;
    }

    // Si se requiere LAN, validar que sea WiFi/Ethernet.
    if (dx4Y3NHECPz2G1) {
      final onLan = await aKhxd5xHS8RGYc.sIZ2MBeZqUlP1r4();
      if (!onLan) {
        return TmFstXFl2.s8cS9fN8yAl9;
      }
    }

    // ¿Servidor interno responde?
    var serverOk = await thbjNLmqO6g.y9zu(fNFxH7Ml7);
    if (!serverOk) {
      // Compatibilidad: algunos backends exponen /health fuera de /api.
      if (fNFxH7Ml7.endsWith('/api/health')) {
        final fallback = fNFxH7Ml7.replaceFirst('/api/health', '/health');
        serverOk = await thbjNLmqO6g.y9zu(fallback);
      } else if (fNFxH7Ml7.endsWith('/health')) {
        final fallback = fNFxH7Ml7.replaceFirst('/health', '/api/health');
        serverOk = await thbjNLmqO6g.y9zu(fallback);
      }
    }
    if (!serverOk) {
      return TmFstXFl2.uvp7RkNl7n;
    }

    // OK
    return TmFstXFl2.sUXQy7BNP;
  }
}
