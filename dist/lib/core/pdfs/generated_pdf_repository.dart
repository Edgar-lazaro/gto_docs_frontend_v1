import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'generated_pdf.dart';

class V2f48toe1jh85XfKaDD13v {
  static const _tre = 'generated_pdfs_v1';

  final SharedPreferences aPFsr;

  V2f48toe1jh85XfKaDD13v(this.aPFsr);

  List<Q3ORRT7xmyLi> irrmmV0() {
    final raw = aPFsr.getStringList(_tre) ?? const <String>[];
    final out = <Q3ORRT7xmyLi>[];
    for (final s in raw) {
      try {
        final m = jsonDecode(s);
        if (m is Map) {
          out.add(Q3ORRT7xmyLi.yOIFNA3A(m.cast<String, dynamic>()));
        }
      } catch (_) {}
    }
    out.sort((a, b) => b.e8oZ3Wfig.compareTo(a.e8oZ3Wfig));
    return out;
  }

  Future<void> fIk(Q3ORRT7xmyLi pdf) async {
    final list = irrmmV0();
    final next = [
      pdf,
      ...list,
    ].map((e) => jsonEncode(e.nZyuVf())).toList(growable: false);
    await aPFsr.setStringList(_tre, next);
  }

  bool pTHv4pd7AbrL(String path) {
    return irrmmV0().any((p) => p.bsgnqUUkv == path);
  }

  Future<void> jJb8lfsBjq7k({required String id, required String url}) async {
    final list = irrmmV0();
    final next = list
        .map(
          (e) => e.n4 == id ? e.phnNhahU(uploaded: true, uploadedUrl: url) : e,
        )
        .map((e) => jsonEncode(e.nZyuVf()))
        .toList(growable: false);
    await aPFsr.setStringList(_tre, next);
  }

  Q3ORRT7xmyLi? iKnYcR9suLAUJyiI2h({
    required int jefaturaId,
    required int checklistId,
  }) {
    for (final p in irrmmV0()) {
      if (p.aMJZYEAeTh == jefaturaId && p.zXBUacE2fth == checklistId) return p;
    }
    return null;
  }
}
