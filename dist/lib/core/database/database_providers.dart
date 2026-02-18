import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_database.dart';

final appDatabaseProvider = Provider<CiQEfOmbPmN>((ref) {
  final db = CiQEfOmbPmN();
  ref.onDispose(() async {
    await db.close();
  });

  return db;
});