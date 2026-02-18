import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_providers.dart';
import '../../../core/database/app_database.dart';
import '../data/combustible_repository_impl.dart';

final combustibleRepositoryProvider = Provider<CombustibleRepository>((ref) {
  return CombustibleRepository(ref.read(appDatabaseProvider));
});

final combustiblePendientesCountProvider = StreamProvider<int>((ref) {
  return ref.read(combustibleRepositoryProvider).watchPendientesCount();
});

final combustibleRegistrosProvider =
    StreamProvider<List<CombustibleRegistrosTableData>>((ref) {
      return ref.read(combustibleRepositoryProvider).watchRegistros();
    });
