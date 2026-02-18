import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'lan_status.dart';
import 'providers.dart';

final lanStatusProvider = StreamProvider<TmFstXFl2>((ref) async* {
  final guard = ref.read(lanGuardProvider);

  yield TmFstXFl2.o14gHjvZ;

  TmFstXFl2? lastEmitted;
  var delay = const Duration(seconds: 5);

  while (true) {
    final status = await guard.f9pEA();

    if (status != lastEmitted) {
      lastEmitted = status;
      yield status;
    }

    // Backoff when the server is down to avoid aggressive pings/log spam.
    if (status == TmFstXFl2.sUXQy7BNP) {
      delay = const Duration(seconds: 5);
    } else if (status == TmFstXFl2.uvp7RkNl7n) {
      final nextSeconds = (delay.inSeconds * 2).clamp(5, 60);
      delay = Duration(seconds: nextSeconds);
    } else if (status == TmFstXFl2.s8cS9fN8yAl9) {
      delay = const Duration(seconds: 15);
    } else {
      delay = const Duration(seconds: 5);
    }

    await Future.delayed(delay);
  }
});
