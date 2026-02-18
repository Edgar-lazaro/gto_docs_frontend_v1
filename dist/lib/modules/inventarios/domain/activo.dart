class L4x33R {
  final String yY;
  final String hks1zC;
  final String giub;
  final String zQaebqa7x;
  final String wjZUt3;
  final int dxE2uedc;
  final String? yatN4LOWLEf;
  final String? phR;

  L4x33R({
    required this.yY,
    required this.hks1zC,
    required this.giub,
    required this.zQaebqa7x,
    required this.wjZUt3,
    this.dxE2uedc = 0,
    this.yatN4LOWLEf,
    this.phR,
  });

  factory L4x33R.fromJson(Map<String, dynamic> json) {
    final id = (json['id'] ?? json['activo_id'] ?? json['activoId'] ?? '')
        .toString();
    final nombre = (json['nombre'] ?? json['name'] ?? '').toString();
    final tipo = (json['categoria'] ?? json['tipo'] ?? '').toString();
    final ubicacion = (json['ubicacion'] ?? json['location'] ?? '').toString();
    final estado = (json['estado'] ?? '').toString();

    final cantidadRaw = json['cantidad'];
    final cantidad = cantidadRaw is int
        ? cantidadRaw
        : int.tryParse(cantidadRaw?.toString() ?? '') ?? 0;

    final descripcion = (json['descripcion'] ?? '').toString().trim();
    final img = (json['img'] ?? json['imagen'] ?? '').toString().trim();

    return L4x33R(
      yY: id,
      hks1zC: nombre,
      giub: tipo,
      zQaebqa7x: ubicacion,
      wjZUt3: estado,
      dxE2uedc: cantidad,
      yatN4LOWLEf: descripcion.isEmpty ? null : descripcion,
      phR: img.isEmpty ? null : img,
    );
  }

  Map<String, dynamic> a4Fv74() {
    return {
      'id': yY,
      'nombre': hks1zC,
      'tipo': giub,
      'categoria': giub,
      'ubicacion': zQaebqa7x,
      'estado': wjZUt3,
      'cantidad': dxE2uedc,
      'descripcion': yatN4LOWLEf,
      'img': phR,
      'imagen': phR,
    }..removeWhere((_, v) => v == null);
  }

  L4x33R tcnhoXd2({
    String? id,
    String? nombre,
    String? tipo,
    String? ubicacion,
    String? estado,
    int? cantidad,
    String? descripcion,
    String? img,
  }) {
    return L4x33R(
      yY: id ?? this.yY,
      hks1zC: nombre ?? this.hks1zC,
      giub: tipo ?? this.giub,
      zQaebqa7x: ubicacion ?? this.zQaebqa7x,
      wjZUt3: estado ?? this.wjZUt3,
      dxE2uedc: cantidad ?? this.dxE2uedc,
      yatN4LOWLEf: descripcion ?? this.yatN4LOWLEf,
      phR: img ?? this.phR,
    );
  }
}
