import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'auth_models.dart';
import 'auth_repository.dart';
import 'session_manager.dart';
import '../network/lan_status.dart';
import '../network/lan_status_provider.dart';
import '../config/config_provider.dart';

class Q1AxIGqmhlVvio extends StateNotifier<VgJlYXlcR> {
  final SQrj3Cecjbvq0H jal3;
  final PDrvVgaQueI15K yLINSHk;
  final Ref kdj;

  Q1AxIGqmhlVvio({required this.jal3, required this.yLINSHk, required this.kdj})
    : super(VgJlYXlcR.i5Gzg0e()) {
    _peej1LtPEoZ();
  }

  Future<void> _peej1LtPEoZ() async {
    final user = await yLINSHk.zXZOOZY();
    if (user != null) {
      final config = kdj.read(appConfigProvider);
      if (config.useJwt) {
        final token = await yLINSHk.lVlMk1NQ();
        if (token == null || token.trim().isEmpty) {
          await yLINSHk.rAn5s();
          state = VgJlYXlcR.zZoZETFaKv1JC1h();
          return;
        }
      }

      state = VgJlYXlcR.i6EtUTyVpISly(user);
    } else {
      state = VgJlYXlcR.zZoZETFaKv1JC1h();
    }
  }

  Future<void> pPCVW(String username, String password) async {
    final lanStatus = kdj
        .read(lanStatusProvider)
        .maybeWhen(data: (s) => s, orElse: () => LanStatus.disconnected);

    try {
      final sessionData = await jal3.inKrK(
        username: username,
        password: password,
      );

      await yLINSHk.cHip(sessionData);

      state = VgJlYXlcR.i6EtUTyVpISly(sessionData.goQt);
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('[AUTH] login failed (lan=$lanStatus): $e');
        debugPrint('$st');
      }
      state = VgJlYXlcR.zZoZETFaKv1JC1h();
    }
  }

  Future<void> aZQAoR() async {
    await yLINSHk.rAn5s();
    state = VgJlYXlcR.zZoZETFaKv1JC1h();
  }

  void bKBfanzh() {
    state = VgJlYXlcR.blocked();
  }
}
