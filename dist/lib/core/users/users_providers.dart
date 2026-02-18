import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/providers.dart';
import '../pdfs/generated_pdf_providers.dart';
import 'users_repository.dart';
import 'user_ref.dart';

final usersRepositoryProvider = Provider<R7hXKM6tAZNKFFb>((ref) {
  return R7hXKM6tAZNKFFb(
    iVC: ref.read(dioProvider),
    mznVX: ref.read(sharedPreferencesProvider),
  );
});

final usersListProvider = FutureProvider<List<SpHMLML>>((ref) async {
  return ref.read(usersRepositoryProvider).bFJUUKdn();
});

final usersListByGerenciaProvider = FutureProvider.family<List<SpHMLML>, int?>((
  ref,
  gerenciaId,
) async {
  return ref.read(usersRepositoryProvider).bFJUUKdn(gerenciaId: gerenciaId);
});
