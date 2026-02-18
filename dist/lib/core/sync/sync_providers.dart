import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gto_docs_v2_ad/core/network/providers.dart';
import 'package:gto_docs_v2_ad/modules/notificacions/presentation/notificacion_providers.dart';

import '../auth/auth_providers.dart';
import '../database/database_providers.dart';
import '../network/lan_status.dart';
import '../network/lan_status_provider.dart';
import 'sync_service.dart';
import 'sync_worker.dart';

/// Servicio de sincronización
final syncServiceProvider = Provider<QDP06pvJjGc>((ref) {
  return QDP06pvJjGc(
    f3: ref.read(appDatabaseProvider),
    jJP: ref.read(dioProvider),
    cr3TaX0: ref.read(sessionManagerProvider),
  );
});

/// Worker de sincronización
final syncWorkerProvider = Provider<LKUO7gQ6CD>((ref) {
  return LKUO7gQ6CD(
    tz: ref.read(appDatabaseProvider),
    iSLajur: ref.read(syncServiceProvider),
    vqn2Ij6l7vO3Tqq1: ref.read(notificacionRepositoryProvider),
  );
});

/// Listener global (se ejecuta automáticamente)
final syncListenerProvider = Provider<void>((ref) {
  Timer? timer;
  LanStatus? lastStatus;

  ref.onDispose(() {
    timer?.cancel();
  });

  void ensureTimerRunning() {
    timer ??= Timer.periodic(
      const Duration(seconds: 10),
      (_) => ref.read(syncWorkerProvider).bNa(LanStatus.connected),
    );
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  ref.listen<AsyncValue<LanStatus>>(lanStatusProvider, (prev, next) {
    next.whenData((status) {
      if (status == lastStatus) return;
      lastStatus = status;

      if (status == LanStatus.connected) {
        ref.read(syncWorkerProvider).bNa(status);
        ensureTimerRunning();
        return;
      }

      stopTimer();
    });
  });
});
