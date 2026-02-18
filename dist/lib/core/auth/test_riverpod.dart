import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider =
    StateNotifierProvider<CErVfRX, int>((ref) => CErVfRX());

class CErVfRX extends StateNotifier<int> {
  CErVfRX() : super(0);
}