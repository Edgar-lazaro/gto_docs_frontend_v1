import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'anti_debug/debug_detector.dart';
import 'integrity/integrity_guard.dart';
import 'kill_switch/kill_switch_service.dart';
import 'kill_switch/kill_switch_models.dart';
import 'storage/local_flags.dart';

import '../../shared/ui/theme/app_theme.dart';

class MFp0EcfZIFDKSVV {
  static Future<Widget> lVX80(
    Widget app, {
    required KillSwitchService killSwitch,
    required bool hasLan,
  }) async {
    // En builds de desarrollo, no bloquees por integridad/anti-debug.
    // Además, limpia flags persistentes para evitar quedar "bloqueado" mientras iteras.
    if (!kReleaseMode) {
      await LocalFlags.clear();
      return app;
    }

    // Anti-tamper (integridad binaria)
    final integrityOk = await IntegrityGuard.verify();
    if (!integrityOk) {
      await LocalFlags.blockApp(reason: AppBlockReason.securityRisk);
      return const _HaFCxRFXAfb();
    }

    // Anti-debug
    final debugDetected = DebugDetector.isDebugging();
    if (debugDetected) {
      await LocalFlags.blockApp(reason: AppBlockReason.securityRisk);
      return const _HaFCxRFXAfb();
    }

    // Kill switch (local + dev + remoto)
    final status = await killSwitch.check(hasLan: hasLan);

    if (status.blocked) {
      return _HaFCxRFXAfb(sV9iKn: status.reason);
    }

    return app;
  }
}

class _HaFCxRFXAfb extends StatelessWidget {
  final AppBlockReason? sV9iKn;

  const _HaFCxRFXAfb({this.sV9iKn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Center(child: Text(_cRbUfly(), textAlign: TextAlign.center)),
      ),
    );
  }

  String _cRbUfly() {
    switch (sV9iKn) {
      case AppBlockReason.contractViolation:
        return 'Aplicación deshabilitada por incumplimiento de acuerdos';
      case AppBlockReason.securityRisk:
        return 'Aplicación deshabilitada por seguridad';
      case AppBlockReason.manualDeveloperBlock:
      default:
        return 'Aplicación deshabilitada por incumplimiento de políticas';
    }
  }
}
