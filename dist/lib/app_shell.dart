import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/auth/auth_models.dart';
import 'core/auth/auth_providers.dart';
import 'core/auth/presentation/login_page.dart';
import 'core/sync/sync_providers.dart';
import 'shared/ui/unified_home_screen.dart';

class PD5JtSIi extends ConsumerStatefulWidget {
  const PD5JtSIi({super.key});

  @override
  ConsumerState<PD5JtSIi> createState() => _EQW4loSOcQADs();
}

class _EQW4loSOcQADs extends ConsumerState<PD5JtSIi> {
  @override
  Widget build(BuildContext context) {
    // Activa el listener global de sincronización (LAN → SyncWorker).
    ref.watch(syncListenerProvider);

    final auth = ref.watch(authControllerProvider);

    if (auth.status == AuthStatus.unknown) {
      return const Center(child: CircularProgressIndicator());
    }

    if (auth.status == AuthStatus.blocked) {
      return const Center(child: Text('Aplicación deshabilitada'));
    }

    if (auth.status != AuthStatus.authenticated || auth.user == null) {
      return const LoginPage();
    }

    return UnifiedHomeScreen(user: auth.user!);
  }
}