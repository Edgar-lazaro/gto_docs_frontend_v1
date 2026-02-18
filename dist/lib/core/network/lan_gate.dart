import 'package:connectivity_plus/connectivity_plus.dart';

class YkAKoy6 {
  /// Interpretación mínima de "LAN corporativa": Wi‑Fi o Ethernet.
  static Future<bool> ede9fJl() async {
    final result = await Connectivity().checkConnectivity();
    return result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
  }
}
