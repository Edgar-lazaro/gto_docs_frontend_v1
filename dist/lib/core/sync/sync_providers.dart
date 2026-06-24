import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gto_docs_v2_ad/core/network/providers.dart';
import 'package:gto_docs_v2_ad/modules/notificacions/presentation/notificacion_providers.dart';
import 'package:gto_docs_v2_ad/modules/tareas/presentation/tareas_providers.dart';

import '../auth/auth_providers.dart';
import '../auth/session_manager.dart';
import '../database/database_providers.dart';
import '../network/lan_status.dart';
import '../network/lan_status_provider.dart';
import 'sync_service.dart';
import 'sync_worker.dart';

/// Servicio de sincronización
final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(
    db: ref.read(appDatabaseProvider),
    dio: ref.read(dioProvider),
    session: ref.read(sessionManagerProvider),
  );
});

/// Worker de sincronización
final syncWorkerProvider = Provider<SyncWorker>((ref) {
  return SyncWorker(
    db: ref.read(appDatabaseProvider),
    service: ref.read(syncServiceProvider),
    notificacionRepo: ref.read(notificacionRepositoryProvider),
  );
});

/// Contador de version de sync (se incrementa tras cada ciclo)
/// Los providers de API pueden depender de esto para refetchear.
final syncVersionProvider = StateProvider<int>((_) => 0);

/// Listener global (se ejecuta automáticamente)
final syncListenerProvider = Provider<void>((ref) {
  Timer? timer;
  LanStatus? lastStatus;

  ref.onDispose(() {
    timer?.cancel();
  });

  Future<void> _runAndInvalidate() async {
    await ref.read(syncWorkerProvider).run(LanStatus.connected);
    // Incrementar version de sync para que dependientes se refetchen
    ref.read(syncVersionProvider.notifier).state++;
    // Refrescar providers de tareas después de cada sync
    ref.invalidate(tareasApiPorCreadorProvider);
    ref.invalidate(tareasApiPorAsignadoProvider);
  }

  void ensureTimerRunning() {
    timer ??= Timer.periodic(
      const Duration(seconds: 10),
      (_) => _runAndInvalidate(),
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
        _runAndInvalidate();
        ensureTimerRunning();
        return;
      }

      stopTimer();
    });
  });
});
