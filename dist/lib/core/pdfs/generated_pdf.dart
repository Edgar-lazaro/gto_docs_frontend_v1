class Q3ORRT7xmyLi {
  final String n4;
  final String tMMKhV3H;
  final String bsgnqUUkv;
  final DateTime e8oZ3Wfig;

  final String ywhq14BTG0b43li;
  final String cqEcENRgqkJSQ;
  final String qddC;
  final int? d2npiuvZvd;

  final int? aMJZYEAeTh;
  final int? zXBUacE2fth;
  final String? zSe38rK9GorypDw;
  final String sjjG55; // 'checklist' | 'reporte'

  final bool k7omPnyS;
  final String? oZbTnA0ey9H;

  const Q3ORRT7xmyLi({
    required this.n4,
    required this.tMMKhV3H,
    required this.bsgnqUUkv,
    required this.e8oZ3Wfig,
    required this.ywhq14BTG0b43li,
    required this.cqEcENRgqkJSQ,
    required this.qddC,
    required this.d2npiuvZvd,
    required this.sjjG55,
    this.aMJZYEAeTh,
    this.zXBUacE2fth,
    this.zSe38rK9GorypDw,
    this.k7omPnyS = false,
    this.oZbTnA0ey9H,
  });

  Map<String, dynamic> nZyuVf() => {
        'id': n4,
        'filename': tMMKhV3H,
        'localPath': bsgnqUUkv,
        'createdAt': e8oZ3Wfig.toIso8601String(),
        'createdByUserId': ywhq14BTG0b43li,
        'createdByName': cqEcENRgqkJSQ,
        'area': qddC,
        'gerenciaId': d2npiuvZvd,
        'jefaturaId': aMJZYEAeTh,
        'checklistId': zXBUacE2fth,
        'checklistNombre': zSe38rK9GorypDw,
        'source': sjjG55,
        'uploaded': k7omPnyS,
        'uploadedUrl': oZbTnA0ey9H,
      };

  static Q3ORRT7xmyLi yOIFNA3A(Map<String, dynamic> json) {
    return Q3ORRT7xmyLi(
      n4: (json['id'] ?? '').toString(),
      tMMKhV3H: (json['filename'] ?? '').toString(),
      bsgnqUUkv: (json['localPath'] ?? '').toString(),
      e8oZ3Wfig:
          DateTime.tryParse((json['createdAt'] ?? '').toString()) ??
              DateTime.fromMillisecondsSinceEpoch(0),
      ywhq14BTG0b43li: (json['createdByUserId'] ?? '').toString(),
      cqEcENRgqkJSQ: (json['createdByName'] ?? '').toString(),
      qddC: (json['area'] ?? '').toString(),
      d2npiuvZvd: _asInt(json['gerenciaId']),
      aMJZYEAeTh: _asInt(json['jefaturaId']),
      zXBUacE2fth: _asInt(json['checklistId']),
      zSe38rK9GorypDw: (json['checklistNombre'] ?? '').toString().isEmpty
          ? null
          : (json['checklistNombre'] ?? '').toString(),
      sjjG55: (json['source'] ?? '').toString(),
      k7omPnyS: json['uploaded'] == true,
      oZbTnA0ey9H: (json['uploadedUrl'] ?? '').toString().isEmpty
          ? null
          : (json['uploadedUrl'] ?? '').toString(),
    );
  }

  Q3ORRT7xmyLi phnNhahU({
    bool? uploaded,
    String? uploadedUrl,
  }) {
    return Q3ORRT7xmyLi(
      n4: n4,
      tMMKhV3H: tMMKhV3H,
      bsgnqUUkv: bsgnqUUkv,
      e8oZ3Wfig: e8oZ3Wfig,
      ywhq14BTG0b43li: ywhq14BTG0b43li,
      cqEcENRgqkJSQ: cqEcENRgqkJSQ,
      qddC: qddC,
      d2npiuvZvd: d2npiuvZvd,
      sjjG55: sjjG55,
      aMJZYEAeTh: aMJZYEAeTh,
      zXBUacE2fth: zXBUacE2fth,
      zSe38rK9GorypDw: zSe38rK9GorypDw,
      k7omPnyS: uploaded ?? this.k7omPnyS,
      oZbTnA0ey9H: uploadedUrl ?? this.oZbTnA0ey9H,
    );
  }
}

int? _asInt(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  return int.tryParse(v.toString());
}
