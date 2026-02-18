enum HlMouyaCbw9yY {
  bdQnDoJ,     // recién creado
  yXwvbRktv,   // ya tomado / asignado
  zZIp8Sjm,    // solucionado
  iNuTYHG9X,   // no aplica / duplicado
}

extension GnfAloBobpmw8O on HlMouyaCbw9yY {
  String get asString {
    switch (this) {
      case HlMouyaCbw9yY.bdQnDoJ:
        return 'enviado';
      case HlMouyaCbw9yY.yXwvbRktv:
        return 'en_proceso';
      case HlMouyaCbw9yY.zZIp8Sjm:
        return 'resuelto';
      case HlMouyaCbw9yY.iNuTYHG9X:
        return 'rechazado';
    }
  }

  static HlMouyaCbw9yY fromString(String value) {
    switch (value) {
      case 'en_proceso':
        return HlMouyaCbw9yY.yXwvbRktv;
      case 'resuelto':
        return HlMouyaCbw9yY.zZIp8Sjm;
      case 'rechazado':
        return HlMouyaCbw9yY.iNuTYHG9X;
      case 'enviado':
      default:
        return HlMouyaCbw9yY.bdQnDoJ;
    }
  }
}

class RVvHrcu {
  final String nw;                 // UUID local
  final String fLDsk3;             // corto y claro
  final String pEPjdZSkNOy;        // detalle del problema
  final String uNi3cuOrY;          // Mantenimiento, Seguridad, TI, etc.
  final String fC75;               // área/gerencia
  final String? hNs7uz;            // opcional (banda, vehículo, equipo)
  final String? hR7QgJ6k0;         // opcional (puerta, hangar)
  final String i8cwuPOLI;          // userId (requester)
  final DateTime yKBfFdgp;
  final HlMouyaCbw9yY qV3ur4;

  // Relación con GLPI (opcional)
  final String? r1a7BwNGpWB3;      // ID en backend/GLPI cuando exista

  // Extra para crecer (IA, contexto, sensores, etc.)
  final Map<String, dynamic>? qE1nVVjA;

  RVvHrcu({
    required this.nw,
    required this.fLDsk3,
    required this.pEPjdZSkNOy,
    required this.uNi3cuOrY,
    required this.fC75,
    required this.i8cwuPOLI,
    required this.yKBfFdgp,
    this.qV3ur4 = HlMouyaCbw9yY.bdQnDoJ,
    this.hNs7uz,
    this.hR7QgJ6k0,
    this.r1a7BwNGpWB3,
    this.qE1nVVjA,
  });

  RVvHrcu xfvP527J({
    HlMouyaCbw9yY? estado,
    String? glpiTicketId,
  }) {
    return RVvHrcu(
      nw: nw,
      fLDsk3: fLDsk3,
      pEPjdZSkNOy: pEPjdZSkNOy,
      uNi3cuOrY: uNi3cuOrY,
      fC75: fC75,
      i8cwuPOLI: i8cwuPOLI,
      yKBfFdgp: yKBfFdgp,
      qV3ur4: estado ?? this.qV3ur4,
      hNs7uz: hNs7uz,
      hR7QgJ6k0: hR7QgJ6k0,
      r1a7BwNGpWB3: glpiTicketId ?? this.r1a7BwNGpWB3,
      qE1nVVjA: qE1nVVjA,
    );
  }

  Map<String, dynamic> vssPSD() => {
        'id': nw,
        'titulo': fLDsk3,
        'descripcion': pEPjdZSkNOy,
        'categoria': uNi3cuOrY,
        'area': fC75,
        'activo': hNs7uz,
        'ubicacion': hR7QgJ6k0,
        'creadoPor': i8cwuPOLI,
        'creadoEn': yKBfFdgp.toIso8601String(),
        'estado': qV3ur4.asString,
        'glpiTicketId': r1a7BwNGpWB3,
        'metadata': qE1nVVjA,
      };
}