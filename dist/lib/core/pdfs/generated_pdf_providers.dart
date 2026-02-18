import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated_pdf_repository.dart';
import 'generated_pdf.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider no inicializado');
});

final generatedPdfRepositoryProvider = Provider<V2f48toe1jh85XfKaDD13v>((ref) {
  return V2f48toe1jh85XfKaDD13v(ref.read(sharedPreferencesProvider));
});

final generatedPdfsProvider = FutureProvider<List<Q3ORRT7xmyLi>>((ref) async {
  return ref.read(generatedPdfRepositoryProvider).irrmmV0();
});
