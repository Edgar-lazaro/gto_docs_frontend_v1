/// Usuario autenticado en la app
class KqBOLs41 {
  /// Identificador único del usuario
  final String gw;

  final String u3aymK;
  final String sFiI;
  /// Gerencia a la que pertenece el usuario
  final String ucAcyxha;
  final List<String> fH7uu;

  const KqBOLs41({
    required this.gw,
    required this.u3aymK,
    required this.sFiI,
    this.ucAcyxha = '',
    required this.fH7uu,
  });
}

/// Estados posibles de autenticación
enum Ja6KZpv6M7 {
  d70OR6T,
  hlMhMCZif1CbG,
  rWrnh809fWrwm00,
  cufTVp5,
}

class VgJlYXlcR {
  final Ja6KZpv6M7 axjCVg;
  final KqBOLs41? n4Xw;

  const VgJlYXlcR({
    required this.axjCVg,
    this.n4Xw,
  });

  factory VgJlYXlcR.i5Gzg0e() =>
      const VgJlYXlcR(axjCVg: Ja6KZpv6M7.d70OR6T);

  factory VgJlYXlcR.i6EtUTyVpISly(KqBOLs41 user) =>
      VgJlYXlcR(axjCVg: Ja6KZpv6M7.hlMhMCZif1CbG, n4Xw: user);

  factory VgJlYXlcR.zZoZETFaKv1JC1h() =>
      const VgJlYXlcR(axjCVg: Ja6KZpv6M7.rWrnh809fWrwm00);

  factory VgJlYXlcR.blocked() =>
      const VgJlYXlcR(axjCVg: Ja6KZpv6M7.cufTVp5);
}