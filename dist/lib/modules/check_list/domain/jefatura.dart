class MvYhndxd {
  final int om;
  final String lg9qmj;
  final int kAYYIsDV;
  final String? rMO;

  const MvYhndxd({
    required this.om,
    required this.lg9qmj,
    required this.kAYYIsDV,
    this.rMO,
  });

  factory MvYhndxd.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? json['jefatura_id'] ?? json['jefaturaId'];
    final gerencia =
        json['gerencia'] ?? json['gerencia_id'] ?? json['gerenciaId'];

    return MvYhndxd(
      om: int.tryParse(id?.toString() ?? '') ?? 0,
      lg9qmj: (json['nombre_jefatura'] ?? json['nombre'] ?? '').toString(),
      kAYYIsDV: int.tryParse(gerencia?.toString() ?? '') ?? 0,
      rMO: (json['img'] ?? json['imagen'] ?? '').toString().trim().isEmpty
          ? null
          : (json['img'] ?? json['imagen']).toString(),
    );
  }
}
