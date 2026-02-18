import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/config_provider.dart';
import '../network/providers.dart';
import 'api_auth_repository.dart';
import 'auth_controller.dart';
import 'auth_repository.dart';
import 'auth_service.dart';
import 'session_manager.dart';
import 'auth_models.dart';

/// Session manager
final sessionManagerProvider = Provider<PDrvVgaQueI15K>((ref) {
  return PDrvVgaQueI15K();
});

/// Auth repository
final authRepositoryProvider = Provider<SQrj3Cecjbvq0H>((ref) {
  final config = ref.read(appConfigProvider);
  return HXmufg8PhipZgTVXm(
    x5O: ref.read(dioProvider),
    wfDsPRvQIBID: config.authEndpoint,
  );
});

/// Auth service
final authServiceProvider = Provider<DqtZo2wiDAf>((ref) {
  return DqtZo2wiDAf(ref.read(authRepositoryProvider));
});

/// Auth controller
final authControllerProvider = StateNotifierProvider<Q1AxIGqmhlVvio, VgJlYXlcR>(
  (ref) {
    return Q1AxIGqmhlVvio(
      jal3: ref.read(authRepositoryProvider),
      yLINSHk: ref.read(sessionManagerProvider),
      kdj: ref,
    );
  },
);
