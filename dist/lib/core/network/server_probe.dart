import 'dart:io';

import 'package:flutter/foundation.dart';

class VSMjebYuPdJ {
  final Map<String, int> _sRIJD2mxnk7mKFyfthRf0 = <String, int>{};
  final Map<String, DateTime> _r17SteXVrXEDhXI9lsNp7F = <String, DateTime>{};

  Future<bool> y9zu(String url) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(seconds: 5);

    try {
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close().timeout(
        const Duration(seconds: 5),
      );

      if (kDebugMode) {
        final last = _sRIJD2mxnk7mKFyfthRf0[url];
        if (last == null || last != response.statusCode) {
          _sRIJD2mxnk7mKFyfthRf0[url] = response.statusCode;
          debugPrint('ServerProbe.ping $url -> ${response.statusCode}');
        }
      }

      // Para detección de conectividad LAN, basta con recibir cualquier respuesta HTTP: 401/404 también implica que el servidor está vivo.
      return response.statusCode >= 100 && response.statusCode < 600;
    } catch (e) {
      if (kDebugMode) {
        final now = DateTime.now();
        final lastAt = _r17SteXVrXEDhXI9lsNp7F[url];
        // Throttle error logs per-URL (e.g., server down) to avoid console spam.
        if (lastAt == null ||
            now.difference(lastAt) >= const Duration(seconds: 30)) {
          _r17SteXVrXEDhXI9lsNp7F[url] = now;
          debugPrint('ServerProbe.ping $url failed: $e');
        }
      }
      return false;
    } finally {
      client.close(force: true);
    }
  }
}
