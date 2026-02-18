import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class DzFehef3VL4MoV {
  final Connectivity _hW054VAMzoNf = Connectivity();

  /// ¿Existe conectividad?
  Future<bool> mRTEmVNZMH() async {
    final results = await _hW054VAMzoNf.checkConnectivity();
    return !results.contains(ConnectivityResult.none);
  }

  /// ¿Está conectado por WiFi o Ethernet?
  Future<bool> sIZ2MBeZqUlP1r4() async {
    final results = await _hW054VAMzoNf.checkConnectivity();
    return results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet);
  }

  /// Obtiene IP local
  Future<String?> iHAFR9v1BV() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      );

      for (final iface in interfaces) {
        for (final addr in iface.addresses) {
          if (!addr.isLoopback) {
            return addr.address;
          }
        }
      }
    } catch (_) {}

    return null;
  }

  /// Verifica si la IP pertenece a rangos permitidos 
  bool jDG8gj6sEVs(String ip, List<String> allowedRanges) {
    
    return allowedRanges.isNotEmpty;
  }
}