// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class JUtMtZAhU8S2N01nW0NOb extends AsistenciaTable
    with TableInfo<JUtMtZAhU8S2N01nW0NOb, K7g68SL3ZcwxYHO0o9J> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _m093a;
  JUtMtZAhU8S2N01nW0NOb(this.attachedDatabase, [this._m093a]);
  static const VerificationMeta _avE8n3 = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _zBXQOmgmFkojs = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _my4AOrVkSDOBj = const VerificationMeta(
    'fechaHora',
  );
  @override
  late final GeneratedColumn<DateTime> fechaHora = GeneratedColumn<DateTime>(
    'fecha_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _y1oSoUer = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    check: () => CustomExpression<bool>("tipo IN ('entrada', 'salida')"),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sWrluaatB2 = const VerificationMeta('metodo');
  @override
  late final GeneratedColumn<String> metodo = GeneratedColumn<String>(
    'metodo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('manual'),
  );
  static const VerificationMeta _r6u2uVu7JE1JLV73 = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _p6tN0Lt1D19j = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    fechaHora,
    tipo,
    metodo,
    sincronizado,
    creadoEn,
  ];
  @override
  String get aliasedName => _m093a ?? actualTableName;
  @override
  String get actualTableName => mCfae;
  static const String mCfae = 'asistencia_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<K7g68SL3ZcwxYHO0o9J> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_avE8n3, id.isAcceptableOrUnknown(data['id']!, _avE8n3));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _zBXQOmgmFkojs,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _zBXQOmgmFkojs),
      );
    } else if (isInserting) {
      context.missing(_zBXQOmgmFkojs);
    }
    if (data.containsKey('fecha_hora')) {
      context.handle(
        _my4AOrVkSDOBj,
        fechaHora.isAcceptableOrUnknown(data['fecha_hora']!, _my4AOrVkSDOBj),
      );
    } else if (isInserting) {
      context.missing(_my4AOrVkSDOBj);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _y1oSoUer,
        tipo.isAcceptableOrUnknown(data['tipo']!, _y1oSoUer),
      );
    } else if (isInserting) {
      context.missing(_y1oSoUer);
    }
    if (data.containsKey('metodo')) {
      context.handle(
        _sWrluaatB2,
        metodo.isAcceptableOrUnknown(data['metodo']!, _sWrluaatB2),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _r6u2uVu7JE1JLV73,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _r6u2uVu7JE1JLV73,
        ),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _p6tN0Lt1D19j,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _p6tN0Lt1D19j),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  K7g68SL3ZcwxYHO0o9J map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return K7g68SL3ZcwxYHO0o9J(
      oB: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nmb3ybNSI: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      nfT5TUbRp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_hora'],
      )!,
      gFdG: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      zSuqNP: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metodo'],
      )!,
      bHyFLr1ImGWV: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      gxS2VMwG: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  JUtMtZAhU8S2N01nW0NOb createAlias(String alias) {
    return JUtMtZAhU8S2N01nW0NOb(attachedDatabase, alias);
  }
}

class K7g68SL3ZcwxYHO0o9J extends DataClass
    implements Insertable<K7g68SL3ZcwxYHO0o9J> {
  final int oB;
  final String nmb3ybNSI;
  final DateTime nfT5TUbRp;
  final String gFdG;
  final String zSuqNP;
  final bool bHyFLr1ImGWV;
  final DateTime gxS2VMwG;
  const K7g68SL3ZcwxYHO0o9J({
    required this.oB,
    required this.nmb3ybNSI,
    required this.nfT5TUbRp,
    required this.gFdG,
    required this.zSuqNP,
    required this.bHyFLr1ImGWV,
    required this.gxS2VMwG,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(oB);
    map['usuario_id'] = Variable<String>(nmb3ybNSI);
    map['fecha_hora'] = Variable<DateTime>(nfT5TUbRp);
    map['tipo'] = Variable<String>(gFdG);
    map['metodo'] = Variable<String>(zSuqNP);
    map['sincronizado'] = Variable<bool>(bHyFLr1ImGWV);
    map['creado_en'] = Variable<DateTime>(gxS2VMwG);
    return map;
  }

  I4D75iPWJH0cc2eGwEo90OsZ bbVwdtMONGP(bool nullToAbsent) {
    return I4D75iPWJH0cc2eGwEo90OsZ(
      oG: Value(oB),
      j5hswdgrL: Value(nmb3ybNSI),
      tZ5Jbb5Kk: Value(nfT5TUbRp),
      obO0: Value(gFdG),
      sjelo5: Value(zSuqNP),
      qI8LLZmrR7bZ: Value(bHyFLr1ImGWV),
      b2OwXecC: Value(gxS2VMwG),
    );
  }

  factory K7g68SL3ZcwxYHO0o9J.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return K7g68SL3ZcwxYHO0o9J(
      oB: serializer.fromJson<int>(json['id']),
      nmb3ybNSI: serializer.fromJson<String>(json['usuarioId']),
      nfT5TUbRp: serializer.fromJson<DateTime>(json['fechaHora']),
      gFdG: serializer.fromJson<String>(json['tipo']),
      zSuqNP: serializer.fromJson<String>(json['metodo']),
      bHyFLr1ImGWV: serializer.fromJson<bool>(json['sincronizado']),
      gxS2VMwG: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(oB),
      'usuarioId': serializer.toJson<String>(nmb3ybNSI),
      'fechaHora': serializer.toJson<DateTime>(nfT5TUbRp),
      'tipo': serializer.toJson<String>(gFdG),
      'metodo': serializer.toJson<String>(zSuqNP),
      'sincronizado': serializer.toJson<bool>(bHyFLr1ImGWV),
      'creadoEn': serializer.toJson<DateTime>(gxS2VMwG),
    };
  }

  K7g68SL3ZcwxYHO0o9J r5ALyhCf({
    int? id,
    String? usuarioId,
    DateTime? fechaHora,
    String? tipo,
    String? metodo,
    bool? sincronizado,
    DateTime? creadoEn,
  }) => K7g68SL3ZcwxYHO0o9J(
    oB: id ?? this.oB,
    nmb3ybNSI: usuarioId ?? this.nmb3ybNSI,
    nfT5TUbRp: fechaHora ?? this.nfT5TUbRp,
    gFdG: tipo ?? this.gFdG,
    zSuqNP: metodo ?? this.zSuqNP,
    bHyFLr1ImGWV: sincronizado ?? this.bHyFLr1ImGWV,
    gxS2VMwG: creadoEn ?? this.gxS2VMwG,
  );
  K7g68SL3ZcwxYHO0o9J vzY0VBuOmdnzs0O1N(I4D75iPWJH0cc2eGwEo90OsZ data) {
    return K7g68SL3ZcwxYHO0o9J(
      oB: data.oG.present ? data.oG.value : this.oB,
      nmb3ybNSI: data.j5hswdgrL.present ? data.j5hswdgrL.value : this.nmb3ybNSI,
      nfT5TUbRp: data.tZ5Jbb5Kk.present ? data.tZ5Jbb5Kk.value : this.nfT5TUbRp,
      gFdG: data.obO0.present ? data.obO0.value : this.gFdG,
      zSuqNP: data.sjelo5.present ? data.sjelo5.value : this.zSuqNP,
      bHyFLr1ImGWV: data.qI8LLZmrR7bZ.present
          ? data.qI8LLZmrR7bZ.value
          : this.bHyFLr1ImGWV,
      gxS2VMwG: data.b2OwXecC.present ? data.b2OwXecC.value : this.gxS2VMwG,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AsistenciaTableData(')
          ..write('id: $oB, ')
          ..write('usuarioId: $nmb3ybNSI, ')
          ..write('fechaHora: $nfT5TUbRp, ')
          ..write('tipo: $gFdG, ')
          ..write('metodo: $zSuqNP, ')
          ..write('sincronizado: $bHyFLr1ImGWV, ')
          ..write('creadoEn: $gxS2VMwG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    oB,
    nmb3ybNSI,
    nfT5TUbRp,
    gFdG,
    zSuqNP,
    bHyFLr1ImGWV,
    gxS2VMwG,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is K7g68SL3ZcwxYHO0o9J &&
          other.oB == this.oB &&
          other.nmb3ybNSI == this.nmb3ybNSI &&
          other.nfT5TUbRp == this.nfT5TUbRp &&
          other.gFdG == this.gFdG &&
          other.zSuqNP == this.zSuqNP &&
          other.bHyFLr1ImGWV == this.bHyFLr1ImGWV &&
          other.gxS2VMwG == this.gxS2VMwG);
}

class I4D75iPWJH0cc2eGwEo90OsZ extends UpdateCompanion<K7g68SL3ZcwxYHO0o9J> {
  final Value<int> oG;
  final Value<String> j5hswdgrL;
  final Value<DateTime> tZ5Jbb5Kk;
  final Value<String> obO0;
  final Value<String> sjelo5;
  final Value<bool> qI8LLZmrR7bZ;
  final Value<DateTime> b2OwXecC;
  const I4D75iPWJH0cc2eGwEo90OsZ({
    this.oG = const Value.absent(),
    this.j5hswdgrL = const Value.absent(),
    this.tZ5Jbb5Kk = const Value.absent(),
    this.obO0 = const Value.absent(),
    this.sjelo5 = const Value.absent(),
    this.qI8LLZmrR7bZ = const Value.absent(),
    this.b2OwXecC = const Value.absent(),
  });
  I4D75iPWJH0cc2eGwEo90OsZ.gJkcVJ({
    this.oG = const Value.absent(),
    required String usuarioId,
    required DateTime fechaHora,
    required String tipo,
    this.sjelo5 = const Value.absent(),
    this.qI8LLZmrR7bZ = const Value.absent(),
    this.b2OwXecC = const Value.absent(),
  }) : j5hswdgrL = Value(usuarioId),
       tZ5Jbb5Kk = Value(fechaHora),
       obO0 = Value(tipo);
  static Insertable<K7g68SL3ZcwxYHO0o9J> dJVQUn({
    Expression<int>? id,
    Expression<String>? usuarioId,
    Expression<DateTime>? fechaHora,
    Expression<String>? tipo,
    Expression<String>? metodo,
    Expression<bool>? sincronizado,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (fechaHora != null) 'fecha_hora': fechaHora,
      if (tipo != null) 'tipo': tipo,
      if (metodo != null) 'metodo': metodo,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  I4D75iPWJH0cc2eGwEo90OsZ hUpy3cxf({
    Value<int>? id,
    Value<String>? usuarioId,
    Value<DateTime>? fechaHora,
    Value<String>? tipo,
    Value<String>? metodo,
    Value<bool>? sincronizado,
    Value<DateTime>? creadoEn,
  }) {
    return I4D75iPWJH0cc2eGwEo90OsZ(
      oG: id ?? this.oG,
      j5hswdgrL: usuarioId ?? this.j5hswdgrL,
      tZ5Jbb5Kk: fechaHora ?? this.tZ5Jbb5Kk,
      obO0: tipo ?? this.obO0,
      sjelo5: metodo ?? this.sjelo5,
      qI8LLZmrR7bZ: sincronizado ?? this.qI8LLZmrR7bZ,
      b2OwXecC: creadoEn ?? this.b2OwXecC,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (oG.present) {
      map['id'] = Variable<int>(oG.value);
    }
    if (j5hswdgrL.present) {
      map['usuario_id'] = Variable<String>(j5hswdgrL.value);
    }
    if (tZ5Jbb5Kk.present) {
      map['fecha_hora'] = Variable<DateTime>(tZ5Jbb5Kk.value);
    }
    if (obO0.present) {
      map['tipo'] = Variable<String>(obO0.value);
    }
    if (sjelo5.present) {
      map['metodo'] = Variable<String>(sjelo5.value);
    }
    if (qI8LLZmrR7bZ.present) {
      map['sincronizado'] = Variable<bool>(qI8LLZmrR7bZ.value);
    }
    if (b2OwXecC.present) {
      map['creado_en'] = Variable<DateTime>(b2OwXecC.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AsistenciaTableCompanion(')
          ..write('id: $oG, ')
          ..write('usuarioId: $j5hswdgrL, ')
          ..write('fechaHora: $tZ5Jbb5Kk, ')
          ..write('tipo: $obO0, ')
          ..write('metodo: $sjelo5, ')
          ..write('sincronizado: $qI8LLZmrR7bZ, ')
          ..write('creadoEn: $b2OwXecC')
          ..write(')'))
        .toString();
  }
}

class XE5bck28Z2cvTleRiVdRxj76YhW5AXu extends CombustibleRegistrosTable
    with
        TableInfo<
          XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
          Tu1jStwkwzpbJHfkGU7g09MJhUwdD
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _pB5W4;
  XE5bck28Z2cvTleRiVdRxj76YhW5AXu(this.attachedDatabase, [this._pB5W4]);
  static const VerificationMeta _lDpzZA = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qWxuUQKkUoEZQ = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _afeUNWxy = const VerificationMeta('modo');
  @override
  late final GeneratedColumn<String> modo = GeneratedColumn<String>(
    'modo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qMm0cbznYy = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mozm6Wl59cG = const VerificationMeta(
    'destino',
  );
  @override
  late final GeneratedColumn<String> destino = GeneratedColumn<String>(
    'destino',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scV2ub1igbVMNj = const VerificationMeta(
    'horaInicio',
  );
  @override
  late final GeneratedColumn<String> horaInicio = GeneratedColumn<String>(
    'hora_inicio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _n6S4fCBmseHEr = const VerificationMeta(
    'horaFinal',
  );
  @override
  late final GeneratedColumn<String> horaFinal = GeneratedColumn<String>(
    'hora_final',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dfyP4rudt0ZhFWBr4W5vQq =
      const VerificationMeta('combustibleInicial');
  @override
  late final GeneratedColumn<String> combustibleInicial =
      GeneratedColumn<String>(
        'combustible_inicial',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _tz4me5PPcsU6FwYLWIJy7u =
      const VerificationMeta('kilometrajeInicial');
  @override
  late final GeneratedColumn<int> kilometrajeInicial = GeneratedColumn<int>(
    'kilometraje_inicial',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rriC9PNPOQ3BDsDL7F49 = const VerificationMeta(
    'combustibleFinal',
  );
  @override
  late final GeneratedColumn<String> combustibleFinal = GeneratedColumn<String>(
    'combustible_final',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bgZNUyGXbuS95si9q2WS = const VerificationMeta(
    'kilometrajeFinal',
  );
  @override
  late final GeneratedColumn<int> kilometrajeFinal = GeneratedColumn<int>(
    'kilometraje_final',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bBYuMp51Rk0ooD = const VerificationMeta(
    'fechaCarga',
  );
  @override
  late final GeneratedColumn<String> fechaCarga = GeneratedColumn<String>(
    'fecha_carga',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _n6pQory4ZxWP = const VerificationMeta(
    'operador',
  );
  @override
  late final GeneratedColumn<String> operador = GeneratedColumn<String>(
    'operador',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rPKfJyfdpSP = const VerificationMeta(
    'kmAntes',
  );
  @override
  late final GeneratedColumn<int> kmAntes = GeneratedColumn<int>(
    'km_antes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _arcQVsmtGfH5k = const VerificationMeta(
    'kmDespues',
  );
  @override
  late final GeneratedColumn<int> kmDespues = GeneratedColumn<int>(
    'km_despues',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fK6VNlpdOSVR = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _arJzeXp9Hkin1 = const VerificationMeta(
    'syncError',
  );
  @override
  late final GeneratedColumn<String> syncError = GeneratedColumn<String>(
    'sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aEn67yle7sy1 = const VerificationMeta(
    'syncInfo',
  );
  @override
  late final GeneratedColumn<String> syncInfo = GeneratedColumn<String>(
    'sync_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pTbL26hnjmzFcSUZ = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _jU7eY7n3g8hb = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    modo,
    nombre,
    destino,
    horaInicio,
    horaFinal,
    combustibleInicial,
    kilometrajeInicial,
    combustibleFinal,
    kilometrajeFinal,
    fechaCarga,
    operador,
    kmAntes,
    kmDespues,
    metadata,
    syncError,
    syncInfo,
    sincronizado,
    creadoEn,
  ];
  @override
  String get aliasedName => _pB5W4 ?? actualTableName;
  @override
  String get actualTableName => mkmAY;
  static const String mkmAY = 'combustible_registros_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tu1jStwkwzpbJHfkGU7g09MJhUwdD> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_lDpzZA, id.isAcceptableOrUnknown(data['id']!, _lDpzZA));
    } else if (isInserting) {
      context.missing(_lDpzZA);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _qWxuUQKkUoEZQ,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _qWxuUQKkUoEZQ),
      );
    } else if (isInserting) {
      context.missing(_qWxuUQKkUoEZQ);
    }
    if (data.containsKey('modo')) {
      context.handle(
        _afeUNWxy,
        modo.isAcceptableOrUnknown(data['modo']!, _afeUNWxy),
      );
    } else if (isInserting) {
      context.missing(_afeUNWxy);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _qMm0cbznYy,
        nombre.isAcceptableOrUnknown(data['nombre']!, _qMm0cbznYy),
      );
    }
    if (data.containsKey('destino')) {
      context.handle(
        _mozm6Wl59cG,
        destino.isAcceptableOrUnknown(data['destino']!, _mozm6Wl59cG),
      );
    }
    if (data.containsKey('hora_inicio')) {
      context.handle(
        _scV2ub1igbVMNj,
        horaInicio.isAcceptableOrUnknown(data['hora_inicio']!, _scV2ub1igbVMNj),
      );
    }
    if (data.containsKey('hora_final')) {
      context.handle(
        _n6S4fCBmseHEr,
        horaFinal.isAcceptableOrUnknown(data['hora_final']!, _n6S4fCBmseHEr),
      );
    }
    if (data.containsKey('combustible_inicial')) {
      context.handle(
        _dfyP4rudt0ZhFWBr4W5vQq,
        combustibleInicial.isAcceptableOrUnknown(
          data['combustible_inicial']!,
          _dfyP4rudt0ZhFWBr4W5vQq,
        ),
      );
    }
    if (data.containsKey('kilometraje_inicial')) {
      context.handle(
        _tz4me5PPcsU6FwYLWIJy7u,
        kilometrajeInicial.isAcceptableOrUnknown(
          data['kilometraje_inicial']!,
          _tz4me5PPcsU6FwYLWIJy7u,
        ),
      );
    }
    if (data.containsKey('combustible_final')) {
      context.handle(
        _rriC9PNPOQ3BDsDL7F49,
        combustibleFinal.isAcceptableOrUnknown(
          data['combustible_final']!,
          _rriC9PNPOQ3BDsDL7F49,
        ),
      );
    }
    if (data.containsKey('kilometraje_final')) {
      context.handle(
        _bgZNUyGXbuS95si9q2WS,
        kilometrajeFinal.isAcceptableOrUnknown(
          data['kilometraje_final']!,
          _bgZNUyGXbuS95si9q2WS,
        ),
      );
    }
    if (data.containsKey('fecha_carga')) {
      context.handle(
        _bBYuMp51Rk0ooD,
        fechaCarga.isAcceptableOrUnknown(data['fecha_carga']!, _bBYuMp51Rk0ooD),
      );
    }
    if (data.containsKey('operador')) {
      context.handle(
        _n6pQory4ZxWP,
        operador.isAcceptableOrUnknown(data['operador']!, _n6pQory4ZxWP),
      );
    }
    if (data.containsKey('km_antes')) {
      context.handle(
        _rPKfJyfdpSP,
        kmAntes.isAcceptableOrUnknown(data['km_antes']!, _rPKfJyfdpSP),
      );
    }
    if (data.containsKey('km_despues')) {
      context.handle(
        _arcQVsmtGfH5k,
        kmDespues.isAcceptableOrUnknown(data['km_despues']!, _arcQVsmtGfH5k),
      );
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _fK6VNlpdOSVR,
        metadata.isAcceptableOrUnknown(data['metadata']!, _fK6VNlpdOSVR),
      );
    }
    if (data.containsKey('sync_error')) {
      context.handle(
        _arJzeXp9Hkin1,
        syncError.isAcceptableOrUnknown(data['sync_error']!, _arJzeXp9Hkin1),
      );
    }
    if (data.containsKey('sync_info')) {
      context.handle(
        _aEn67yle7sy1,
        syncInfo.isAcceptableOrUnknown(data['sync_info']!, _aEn67yle7sy1),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _pTbL26hnjmzFcSUZ,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _pTbL26hnjmzFcSUZ,
        ),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _jU7eY7n3g8hb,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _jU7eY7n3g8hb),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tu1jStwkwzpbJHfkGU7g09MJhUwdD map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tu1jStwkwzpbJHfkGU7g09MJhUwdD(
      qv: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dHkTLhou3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      mE20: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modo'],
      )!,
      zHSeei: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      u0d8zC8: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destino'],
      ),
      xrqanryIfY: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hora_inicio'],
      ),
      pfPYTLcZW: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hora_final'],
      ),
      vW6U1ZKngveCqaekKE: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}combustible_inicial'],
      ),
      jjhtiKfKbbLk4UJJSa: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kilometraje_inicial'],
      ),
      lBsuQ6Pm36uQs6yF: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}combustible_final'],
      ),
      jI2sYBxqgDhVihhg: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kilometraje_final'],
      ),
      m11T7w8q0a: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fecha_carga'],
      ),
      bOCjZ6ap: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operador'],
      ),
      pwO9NB4: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}km_antes'],
      ),
      rMiidWbov: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}km_despues'],
      ),
      eYZ1MeCE: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
      znAuBOBCl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_error'],
      ),
      vw0B8mCJ: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_info'],
      ),
      uOeqAJlQTogm: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      vSmPHSr3: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  XE5bck28Z2cvTleRiVdRxj76YhW5AXu createAlias(String alias) {
    return XE5bck28Z2cvTleRiVdRxj76YhW5AXu(attachedDatabase, alias);
  }
}

class Tu1jStwkwzpbJHfkGU7g09MJhUwdD extends DataClass
    implements Insertable<Tu1jStwkwzpbJHfkGU7g09MJhUwdD> {
  final String qv;
  final String dHkTLhou3;

  /// usar_vehiculo | cargar_combustible
  final String mE20;
  final String? zHSeei;
  final String? u0d8zC8;
  final String? xrqanryIfY;
  final String? pfPYTLcZW;
  final String? vW6U1ZKngveCqaekKE;
  final int? jjhtiKfKbbLk4UJJSa;
  final String? lBsuQ6Pm36uQs6yF;
  final int? jI2sYBxqgDhVihhg;
  final String? m11T7w8q0a;
  final String? bOCjZ6ap;
  final int? pwO9NB4;
  final int? rMiidWbov;

  /// JSON libre (ej. rutas locales de fotos)
  final String? eYZ1MeCE;

  /// Último error de sincronización (para diagnóstico en UI)
  final String? znAuBOBCl;

  /// Última respuesta/resultado de sincronización (para auditoría/diagnóstico)
  final String? vw0B8mCJ;
  final bool uOeqAJlQTogm;
  final DateTime vSmPHSr3;
  const Tu1jStwkwzpbJHfkGU7g09MJhUwdD({
    required this.qv,
    required this.dHkTLhou3,
    required this.mE20,
    this.zHSeei,
    this.u0d8zC8,
    this.xrqanryIfY,
    this.pfPYTLcZW,
    this.vW6U1ZKngveCqaekKE,
    this.jjhtiKfKbbLk4UJJSa,
    this.lBsuQ6Pm36uQs6yF,
    this.jI2sYBxqgDhVihhg,
    this.m11T7w8q0a,
    this.bOCjZ6ap,
    this.pwO9NB4,
    this.rMiidWbov,
    this.eYZ1MeCE,
    this.znAuBOBCl,
    this.vw0B8mCJ,
    required this.uOeqAJlQTogm,
    required this.vSmPHSr3,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(qv);
    map['usuario_id'] = Variable<String>(dHkTLhou3);
    map['modo'] = Variable<String>(mE20);
    if (!nullToAbsent || zHSeei != null) {
      map['nombre'] = Variable<String>(zHSeei);
    }
    if (!nullToAbsent || u0d8zC8 != null) {
      map['destino'] = Variable<String>(u0d8zC8);
    }
    if (!nullToAbsent || xrqanryIfY != null) {
      map['hora_inicio'] = Variable<String>(xrqanryIfY);
    }
    if (!nullToAbsent || pfPYTLcZW != null) {
      map['hora_final'] = Variable<String>(pfPYTLcZW);
    }
    if (!nullToAbsent || vW6U1ZKngveCqaekKE != null) {
      map['combustible_inicial'] = Variable<String>(vW6U1ZKngveCqaekKE);
    }
    if (!nullToAbsent || jjhtiKfKbbLk4UJJSa != null) {
      map['kilometraje_inicial'] = Variable<int>(jjhtiKfKbbLk4UJJSa);
    }
    if (!nullToAbsent || lBsuQ6Pm36uQs6yF != null) {
      map['combustible_final'] = Variable<String>(lBsuQ6Pm36uQs6yF);
    }
    if (!nullToAbsent || jI2sYBxqgDhVihhg != null) {
      map['kilometraje_final'] = Variable<int>(jI2sYBxqgDhVihhg);
    }
    if (!nullToAbsent || m11T7w8q0a != null) {
      map['fecha_carga'] = Variable<String>(m11T7w8q0a);
    }
    if (!nullToAbsent || bOCjZ6ap != null) {
      map['operador'] = Variable<String>(bOCjZ6ap);
    }
    if (!nullToAbsent || pwO9NB4 != null) {
      map['km_antes'] = Variable<int>(pwO9NB4);
    }
    if (!nullToAbsent || rMiidWbov != null) {
      map['km_despues'] = Variable<int>(rMiidWbov);
    }
    if (!nullToAbsent || eYZ1MeCE != null) {
      map['metadata'] = Variable<String>(eYZ1MeCE);
    }
    if (!nullToAbsent || znAuBOBCl != null) {
      map['sync_error'] = Variable<String>(znAuBOBCl);
    }
    if (!nullToAbsent || vw0B8mCJ != null) {
      map['sync_info'] = Variable<String>(vw0B8mCJ);
    }
    map['sincronizado'] = Variable<bool>(uOeqAJlQTogm);
    map['creado_en'] = Variable<DateTime>(vSmPHSr3);
    return map;
  }

  U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB ionUPB0GzuW(bool nullToAbsent) {
    return U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB(
      kG: Value(qv),
      zP9InJmSB: Value(dHkTLhou3),
      piVk: Value(mE20),
      i5QUQk: zHSeei == null && nullToAbsent
          ? const Value.absent()
          : Value(zHSeei),
      u5GveBn: u0d8zC8 == null && nullToAbsent
          ? const Value.absent()
          : Value(u0d8zC8),
      xAMz01YkIt: xrqanryIfY == null && nullToAbsent
          ? const Value.absent()
          : Value(xrqanryIfY),
      ewIdFnxeO: pfPYTLcZW == null && nullToAbsent
          ? const Value.absent()
          : Value(pfPYTLcZW),
      bLRN1zQYqxM1WWlXjr: vW6U1ZKngveCqaekKE == null && nullToAbsent
          ? const Value.absent()
          : Value(vW6U1ZKngveCqaekKE),
      aYKSs386BUhF2mkPnG: jjhtiKfKbbLk4UJJSa == null && nullToAbsent
          ? const Value.absent()
          : Value(jjhtiKfKbbLk4UJJSa),
      ybJGZWDVbEKc4n5m: lBsuQ6Pm36uQs6yF == null && nullToAbsent
          ? const Value.absent()
          : Value(lBsuQ6Pm36uQs6yF),
      h0jpAs6ZpPJPw8NI: jI2sYBxqgDhVihhg == null && nullToAbsent
          ? const Value.absent()
          : Value(jI2sYBxqgDhVihhg),
      aqcX18IRuB: m11T7w8q0a == null && nullToAbsent
          ? const Value.absent()
          : Value(m11T7w8q0a),
      ekcREChe: bOCjZ6ap == null && nullToAbsent
          ? const Value.absent()
          : Value(bOCjZ6ap),
      dXt6KMU: pwO9NB4 == null && nullToAbsent
          ? const Value.absent()
          : Value(pwO9NB4),
      ngpZB55Sc: rMiidWbov == null && nullToAbsent
          ? const Value.absent()
          : Value(rMiidWbov),
      j4QNm5oy: eYZ1MeCE == null && nullToAbsent
          ? const Value.absent()
          : Value(eYZ1MeCE),
      yR3qhIbzL: znAuBOBCl == null && nullToAbsent
          ? const Value.absent()
          : Value(znAuBOBCl),
      uX8ZvZgj: vw0B8mCJ == null && nullToAbsent
          ? const Value.absent()
          : Value(vw0B8mCJ),
      dJCVP37dMYlm: Value(uOeqAJlQTogm),
      lYeqPFYS: Value(vSmPHSr3),
    );
  }

  factory Tu1jStwkwzpbJHfkGU7g09MJhUwdD.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tu1jStwkwzpbJHfkGU7g09MJhUwdD(
      qv: serializer.fromJson<String>(json['id']),
      dHkTLhou3: serializer.fromJson<String>(json['usuarioId']),
      mE20: serializer.fromJson<String>(json['modo']),
      zHSeei: serializer.fromJson<String?>(json['nombre']),
      u0d8zC8: serializer.fromJson<String?>(json['destino']),
      xrqanryIfY: serializer.fromJson<String?>(json['horaInicio']),
      pfPYTLcZW: serializer.fromJson<String?>(json['horaFinal']),
      vW6U1ZKngveCqaekKE: serializer.fromJson<String?>(
        json['combustibleInicial'],
      ),
      jjhtiKfKbbLk4UJJSa: serializer.fromJson<int?>(json['kilometrajeInicial']),
      lBsuQ6Pm36uQs6yF: serializer.fromJson<String?>(json['combustibleFinal']),
      jI2sYBxqgDhVihhg: serializer.fromJson<int?>(json['kilometrajeFinal']),
      m11T7w8q0a: serializer.fromJson<String?>(json['fechaCarga']),
      bOCjZ6ap: serializer.fromJson<String?>(json['operador']),
      pwO9NB4: serializer.fromJson<int?>(json['kmAntes']),
      rMiidWbov: serializer.fromJson<int?>(json['kmDespues']),
      eYZ1MeCE: serializer.fromJson<String?>(json['metadata']),
      znAuBOBCl: serializer.fromJson<String?>(json['syncError']),
      vw0B8mCJ: serializer.fromJson<String?>(json['syncInfo']),
      uOeqAJlQTogm: serializer.fromJson<bool>(json['sincronizado']),
      vSmPHSr3: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(qv),
      'usuarioId': serializer.toJson<String>(dHkTLhou3),
      'modo': serializer.toJson<String>(mE20),
      'nombre': serializer.toJson<String?>(zHSeei),
      'destino': serializer.toJson<String?>(u0d8zC8),
      'horaInicio': serializer.toJson<String?>(xrqanryIfY),
      'horaFinal': serializer.toJson<String?>(pfPYTLcZW),
      'combustibleInicial': serializer.toJson<String?>(vW6U1ZKngveCqaekKE),
      'kilometrajeInicial': serializer.toJson<int?>(jjhtiKfKbbLk4UJJSa),
      'combustibleFinal': serializer.toJson<String?>(lBsuQ6Pm36uQs6yF),
      'kilometrajeFinal': serializer.toJson<int?>(jI2sYBxqgDhVihhg),
      'fechaCarga': serializer.toJson<String?>(m11T7w8q0a),
      'operador': serializer.toJson<String?>(bOCjZ6ap),
      'kmAntes': serializer.toJson<int?>(pwO9NB4),
      'kmDespues': serializer.toJson<int?>(rMiidWbov),
      'metadata': serializer.toJson<String?>(eYZ1MeCE),
      'syncError': serializer.toJson<String?>(znAuBOBCl),
      'syncInfo': serializer.toJson<String?>(vw0B8mCJ),
      'sincronizado': serializer.toJson<bool>(uOeqAJlQTogm),
      'creadoEn': serializer.toJson<DateTime>(vSmPHSr3),
    };
  }

  Tu1jStwkwzpbJHfkGU7g09MJhUwdD hT2xYrby({
    String? id,
    String? usuarioId,
    String? modo,
    Value<String?> nombre = const Value.absent(),
    Value<String?> destino = const Value.absent(),
    Value<String?> horaInicio = const Value.absent(),
    Value<String?> horaFinal = const Value.absent(),
    Value<String?> combustibleInicial = const Value.absent(),
    Value<int?> kilometrajeInicial = const Value.absent(),
    Value<String?> combustibleFinal = const Value.absent(),
    Value<int?> kilometrajeFinal = const Value.absent(),
    Value<String?> fechaCarga = const Value.absent(),
    Value<String?> operador = const Value.absent(),
    Value<int?> kmAntes = const Value.absent(),
    Value<int?> kmDespues = const Value.absent(),
    Value<String?> metadata = const Value.absent(),
    Value<String?> syncError = const Value.absent(),
    Value<String?> syncInfo = const Value.absent(),
    bool? sincronizado,
    DateTime? creadoEn,
  }) => Tu1jStwkwzpbJHfkGU7g09MJhUwdD(
    qv: id ?? this.qv,
    dHkTLhou3: usuarioId ?? this.dHkTLhou3,
    mE20: modo ?? this.mE20,
    zHSeei: nombre.present ? nombre.value : this.zHSeei,
    u0d8zC8: destino.present ? destino.value : this.u0d8zC8,
    xrqanryIfY: horaInicio.present ? horaInicio.value : this.xrqanryIfY,
    pfPYTLcZW: horaFinal.present ? horaFinal.value : this.pfPYTLcZW,
    vW6U1ZKngveCqaekKE: combustibleInicial.present
        ? combustibleInicial.value
        : this.vW6U1ZKngveCqaekKE,
    jjhtiKfKbbLk4UJJSa: kilometrajeInicial.present
        ? kilometrajeInicial.value
        : this.jjhtiKfKbbLk4UJJSa,
    lBsuQ6Pm36uQs6yF: combustibleFinal.present
        ? combustibleFinal.value
        : this.lBsuQ6Pm36uQs6yF,
    jI2sYBxqgDhVihhg: kilometrajeFinal.present
        ? kilometrajeFinal.value
        : this.jI2sYBxqgDhVihhg,
    m11T7w8q0a: fechaCarga.present ? fechaCarga.value : this.m11T7w8q0a,
    bOCjZ6ap: operador.present ? operador.value : this.bOCjZ6ap,
    pwO9NB4: kmAntes.present ? kmAntes.value : this.pwO9NB4,
    rMiidWbov: kmDespues.present ? kmDespues.value : this.rMiidWbov,
    eYZ1MeCE: metadata.present ? metadata.value : this.eYZ1MeCE,
    znAuBOBCl: syncError.present ? syncError.value : this.znAuBOBCl,
    vw0B8mCJ: syncInfo.present ? syncInfo.value : this.vw0B8mCJ,
    uOeqAJlQTogm: sincronizado ?? this.uOeqAJlQTogm,
    vSmPHSr3: creadoEn ?? this.vSmPHSr3,
  );
  Tu1jStwkwzpbJHfkGU7g09MJhUwdD wCVsvOimo21t9uSWE(
    U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB data,
  ) {
    return Tu1jStwkwzpbJHfkGU7g09MJhUwdD(
      qv: data.kG.present ? data.kG.value : this.qv,
      dHkTLhou3: data.zP9InJmSB.present ? data.zP9InJmSB.value : this.dHkTLhou3,
      mE20: data.piVk.present ? data.piVk.value : this.mE20,
      zHSeei: data.i5QUQk.present ? data.i5QUQk.value : this.zHSeei,
      u0d8zC8: data.u5GveBn.present ? data.u5GveBn.value : this.u0d8zC8,
      xrqanryIfY: data.xAMz01YkIt.present
          ? data.xAMz01YkIt.value
          : this.xrqanryIfY,
      pfPYTLcZW: data.ewIdFnxeO.present ? data.ewIdFnxeO.value : this.pfPYTLcZW,
      vW6U1ZKngveCqaekKE: data.bLRN1zQYqxM1WWlXjr.present
          ? data.bLRN1zQYqxM1WWlXjr.value
          : this.vW6U1ZKngveCqaekKE,
      jjhtiKfKbbLk4UJJSa: data.aYKSs386BUhF2mkPnG.present
          ? data.aYKSs386BUhF2mkPnG.value
          : this.jjhtiKfKbbLk4UJJSa,
      lBsuQ6Pm36uQs6yF: data.ybJGZWDVbEKc4n5m.present
          ? data.ybJGZWDVbEKc4n5m.value
          : this.lBsuQ6Pm36uQs6yF,
      jI2sYBxqgDhVihhg: data.h0jpAs6ZpPJPw8NI.present
          ? data.h0jpAs6ZpPJPw8NI.value
          : this.jI2sYBxqgDhVihhg,
      m11T7w8q0a: data.aqcX18IRuB.present
          ? data.aqcX18IRuB.value
          : this.m11T7w8q0a,
      bOCjZ6ap: data.ekcREChe.present ? data.ekcREChe.value : this.bOCjZ6ap,
      pwO9NB4: data.dXt6KMU.present ? data.dXt6KMU.value : this.pwO9NB4,
      rMiidWbov: data.ngpZB55Sc.present ? data.ngpZB55Sc.value : this.rMiidWbov,
      eYZ1MeCE: data.j4QNm5oy.present ? data.j4QNm5oy.value : this.eYZ1MeCE,
      znAuBOBCl: data.yR3qhIbzL.present ? data.yR3qhIbzL.value : this.znAuBOBCl,
      vw0B8mCJ: data.uX8ZvZgj.present ? data.uX8ZvZgj.value : this.vw0B8mCJ,
      uOeqAJlQTogm: data.dJCVP37dMYlm.present
          ? data.dJCVP37dMYlm.value
          : this.uOeqAJlQTogm,
      vSmPHSr3: data.lYeqPFYS.present ? data.lYeqPFYS.value : this.vSmPHSr3,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CombustibleRegistrosTableData(')
          ..write('id: $qv, ')
          ..write('usuarioId: $dHkTLhou3, ')
          ..write('modo: $mE20, ')
          ..write('nombre: $zHSeei, ')
          ..write('destino: $u0d8zC8, ')
          ..write('horaInicio: $xrqanryIfY, ')
          ..write('horaFinal: $pfPYTLcZW, ')
          ..write('combustibleInicial: $vW6U1ZKngveCqaekKE, ')
          ..write('kilometrajeInicial: $jjhtiKfKbbLk4UJJSa, ')
          ..write('combustibleFinal: $lBsuQ6Pm36uQs6yF, ')
          ..write('kilometrajeFinal: $jI2sYBxqgDhVihhg, ')
          ..write('fechaCarga: $m11T7w8q0a, ')
          ..write('operador: $bOCjZ6ap, ')
          ..write('kmAntes: $pwO9NB4, ')
          ..write('kmDespues: $rMiidWbov, ')
          ..write('metadata: $eYZ1MeCE, ')
          ..write('syncError: $znAuBOBCl, ')
          ..write('syncInfo: $vw0B8mCJ, ')
          ..write('sincronizado: $uOeqAJlQTogm, ')
          ..write('creadoEn: $vSmPHSr3')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    qv,
    dHkTLhou3,
    mE20,
    zHSeei,
    u0d8zC8,
    xrqanryIfY,
    pfPYTLcZW,
    vW6U1ZKngveCqaekKE,
    jjhtiKfKbbLk4UJJSa,
    lBsuQ6Pm36uQs6yF,
    jI2sYBxqgDhVihhg,
    m11T7w8q0a,
    bOCjZ6ap,
    pwO9NB4,
    rMiidWbov,
    eYZ1MeCE,
    znAuBOBCl,
    vw0B8mCJ,
    uOeqAJlQTogm,
    vSmPHSr3,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tu1jStwkwzpbJHfkGU7g09MJhUwdD &&
          other.qv == this.qv &&
          other.dHkTLhou3 == this.dHkTLhou3 &&
          other.mE20 == this.mE20 &&
          other.zHSeei == this.zHSeei &&
          other.u0d8zC8 == this.u0d8zC8 &&
          other.xrqanryIfY == this.xrqanryIfY &&
          other.pfPYTLcZW == this.pfPYTLcZW &&
          other.vW6U1ZKngveCqaekKE == this.vW6U1ZKngveCqaekKE &&
          other.jjhtiKfKbbLk4UJJSa == this.jjhtiKfKbbLk4UJJSa &&
          other.lBsuQ6Pm36uQs6yF == this.lBsuQ6Pm36uQs6yF &&
          other.jI2sYBxqgDhVihhg == this.jI2sYBxqgDhVihhg &&
          other.m11T7w8q0a == this.m11T7w8q0a &&
          other.bOCjZ6ap == this.bOCjZ6ap &&
          other.pwO9NB4 == this.pwO9NB4 &&
          other.rMiidWbov == this.rMiidWbov &&
          other.eYZ1MeCE == this.eYZ1MeCE &&
          other.znAuBOBCl == this.znAuBOBCl &&
          other.vw0B8mCJ == this.vw0B8mCJ &&
          other.uOeqAJlQTogm == this.uOeqAJlQTogm &&
          other.vSmPHSr3 == this.vSmPHSr3);
}

class U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB
    extends UpdateCompanion<Tu1jStwkwzpbJHfkGU7g09MJhUwdD> {
  final Value<String> kG;
  final Value<String> zP9InJmSB;
  final Value<String> piVk;
  final Value<String?> i5QUQk;
  final Value<String?> u5GveBn;
  final Value<String?> xAMz01YkIt;
  final Value<String?> ewIdFnxeO;
  final Value<String?> bLRN1zQYqxM1WWlXjr;
  final Value<int?> aYKSs386BUhF2mkPnG;
  final Value<String?> ybJGZWDVbEKc4n5m;
  final Value<int?> h0jpAs6ZpPJPw8NI;
  final Value<String?> aqcX18IRuB;
  final Value<String?> ekcREChe;
  final Value<int?> dXt6KMU;
  final Value<int?> ngpZB55Sc;
  final Value<String?> j4QNm5oy;
  final Value<String?> yR3qhIbzL;
  final Value<String?> uX8ZvZgj;
  final Value<bool> dJCVP37dMYlm;
  final Value<DateTime> lYeqPFYS;
  final Value<int> tHjkb;
  const U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB({
    this.kG = const Value.absent(),
    this.zP9InJmSB = const Value.absent(),
    this.piVk = const Value.absent(),
    this.i5QUQk = const Value.absent(),
    this.u5GveBn = const Value.absent(),
    this.xAMz01YkIt = const Value.absent(),
    this.ewIdFnxeO = const Value.absent(),
    this.bLRN1zQYqxM1WWlXjr = const Value.absent(),
    this.aYKSs386BUhF2mkPnG = const Value.absent(),
    this.ybJGZWDVbEKc4n5m = const Value.absent(),
    this.h0jpAs6ZpPJPw8NI = const Value.absent(),
    this.aqcX18IRuB = const Value.absent(),
    this.ekcREChe = const Value.absent(),
    this.dXt6KMU = const Value.absent(),
    this.ngpZB55Sc = const Value.absent(),
    this.j4QNm5oy = const Value.absent(),
    this.yR3qhIbzL = const Value.absent(),
    this.uX8ZvZgj = const Value.absent(),
    this.dJCVP37dMYlm = const Value.absent(),
    this.lYeqPFYS = const Value.absent(),
    this.tHjkb = const Value.absent(),
  });
  U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB.insert({
    required String id,
    required String usuarioId,
    required String modo,
    this.i5QUQk = const Value.absent(),
    this.u5GveBn = const Value.absent(),
    this.xAMz01YkIt = const Value.absent(),
    this.ewIdFnxeO = const Value.absent(),
    this.bLRN1zQYqxM1WWlXjr = const Value.absent(),
    this.aYKSs386BUhF2mkPnG = const Value.absent(),
    this.ybJGZWDVbEKc4n5m = const Value.absent(),
    this.h0jpAs6ZpPJPw8NI = const Value.absent(),
    this.aqcX18IRuB = const Value.absent(),
    this.ekcREChe = const Value.absent(),
    this.dXt6KMU = const Value.absent(),
    this.ngpZB55Sc = const Value.absent(),
    this.j4QNm5oy = const Value.absent(),
    this.yR3qhIbzL = const Value.absent(),
    this.uX8ZvZgj = const Value.absent(),
    this.dJCVP37dMYlm = const Value.absent(),
    this.lYeqPFYS = const Value.absent(),
    this.tHjkb = const Value.absent(),
  }) : kG = Value(id),
       zP9InJmSB = Value(usuarioId),
       piVk = Value(modo);
  static Insertable<Tu1jStwkwzpbJHfkGU7g09MJhUwdD> v0AqHV({
    Expression<String>? id,
    Expression<String>? usuarioId,
    Expression<String>? modo,
    Expression<String>? nombre,
    Expression<String>? destino,
    Expression<String>? horaInicio,
    Expression<String>? horaFinal,
    Expression<String>? combustibleInicial,
    Expression<int>? kilometrajeInicial,
    Expression<String>? combustibleFinal,
    Expression<int>? kilometrajeFinal,
    Expression<String>? fechaCarga,
    Expression<String>? operador,
    Expression<int>? kmAntes,
    Expression<int>? kmDespues,
    Expression<String>? metadata,
    Expression<String>? syncError,
    Expression<String>? syncInfo,
    Expression<bool>? sincronizado,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (modo != null) 'modo': modo,
      if (nombre != null) 'nombre': nombre,
      if (destino != null) 'destino': destino,
      if (horaInicio != null) 'hora_inicio': horaInicio,
      if (horaFinal != null) 'hora_final': horaFinal,
      if (combustibleInicial != null) 'combustible_inicial': combustibleInicial,
      if (kilometrajeInicial != null) 'kilometraje_inicial': kilometrajeInicial,
      if (combustibleFinal != null) 'combustible_final': combustibleFinal,
      if (kilometrajeFinal != null) 'kilometraje_final': kilometrajeFinal,
      if (fechaCarga != null) 'fecha_carga': fechaCarga,
      if (operador != null) 'operador': operador,
      if (kmAntes != null) 'km_antes': kmAntes,
      if (kmDespues != null) 'km_despues': kmDespues,
      if (metadata != null) 'metadata': metadata,
      if (syncError != null) 'sync_error': syncError,
      if (syncInfo != null) 'sync_info': syncInfo,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB qqisE6Cx({
    Value<String>? id,
    Value<String>? usuarioId,
    Value<String>? modo,
    Value<String?>? nombre,
    Value<String?>? destino,
    Value<String?>? horaInicio,
    Value<String?>? horaFinal,
    Value<String?>? combustibleInicial,
    Value<int?>? kilometrajeInicial,
    Value<String?>? combustibleFinal,
    Value<int?>? kilometrajeFinal,
    Value<String?>? fechaCarga,
    Value<String?>? operador,
    Value<int?>? kmAntes,
    Value<int?>? kmDespues,
    Value<String?>? metadata,
    Value<String?>? syncError,
    Value<String?>? syncInfo,
    Value<bool>? sincronizado,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB(
      kG: id ?? this.kG,
      zP9InJmSB: usuarioId ?? this.zP9InJmSB,
      piVk: modo ?? this.piVk,
      i5QUQk: nombre ?? this.i5QUQk,
      u5GveBn: destino ?? this.u5GveBn,
      xAMz01YkIt: horaInicio ?? this.xAMz01YkIt,
      ewIdFnxeO: horaFinal ?? this.ewIdFnxeO,
      bLRN1zQYqxM1WWlXjr: combustibleInicial ?? this.bLRN1zQYqxM1WWlXjr,
      aYKSs386BUhF2mkPnG: kilometrajeInicial ?? this.aYKSs386BUhF2mkPnG,
      ybJGZWDVbEKc4n5m: combustibleFinal ?? this.ybJGZWDVbEKc4n5m,
      h0jpAs6ZpPJPw8NI: kilometrajeFinal ?? this.h0jpAs6ZpPJPw8NI,
      aqcX18IRuB: fechaCarga ?? this.aqcX18IRuB,
      ekcREChe: operador ?? this.ekcREChe,
      dXt6KMU: kmAntes ?? this.dXt6KMU,
      ngpZB55Sc: kmDespues ?? this.ngpZB55Sc,
      j4QNm5oy: metadata ?? this.j4QNm5oy,
      yR3qhIbzL: syncError ?? this.yR3qhIbzL,
      uX8ZvZgj: syncInfo ?? this.uX8ZvZgj,
      dJCVP37dMYlm: sincronizado ?? this.dJCVP37dMYlm,
      lYeqPFYS: creadoEn ?? this.lYeqPFYS,
      tHjkb: rowid ?? this.tHjkb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (kG.present) {
      map['id'] = Variable<String>(kG.value);
    }
    if (zP9InJmSB.present) {
      map['usuario_id'] = Variable<String>(zP9InJmSB.value);
    }
    if (piVk.present) {
      map['modo'] = Variable<String>(piVk.value);
    }
    if (i5QUQk.present) {
      map['nombre'] = Variable<String>(i5QUQk.value);
    }
    if (u5GveBn.present) {
      map['destino'] = Variable<String>(u5GveBn.value);
    }
    if (xAMz01YkIt.present) {
      map['hora_inicio'] = Variable<String>(xAMz01YkIt.value);
    }
    if (ewIdFnxeO.present) {
      map['hora_final'] = Variable<String>(ewIdFnxeO.value);
    }
    if (bLRN1zQYqxM1WWlXjr.present) {
      map['combustible_inicial'] = Variable<String>(bLRN1zQYqxM1WWlXjr.value);
    }
    if (aYKSs386BUhF2mkPnG.present) {
      map['kilometraje_inicial'] = Variable<int>(aYKSs386BUhF2mkPnG.value);
    }
    if (ybJGZWDVbEKc4n5m.present) {
      map['combustible_final'] = Variable<String>(ybJGZWDVbEKc4n5m.value);
    }
    if (h0jpAs6ZpPJPw8NI.present) {
      map['kilometraje_final'] = Variable<int>(h0jpAs6ZpPJPw8NI.value);
    }
    if (aqcX18IRuB.present) {
      map['fecha_carga'] = Variable<String>(aqcX18IRuB.value);
    }
    if (ekcREChe.present) {
      map['operador'] = Variable<String>(ekcREChe.value);
    }
    if (dXt6KMU.present) {
      map['km_antes'] = Variable<int>(dXt6KMU.value);
    }
    if (ngpZB55Sc.present) {
      map['km_despues'] = Variable<int>(ngpZB55Sc.value);
    }
    if (j4QNm5oy.present) {
      map['metadata'] = Variable<String>(j4QNm5oy.value);
    }
    if (yR3qhIbzL.present) {
      map['sync_error'] = Variable<String>(yR3qhIbzL.value);
    }
    if (uX8ZvZgj.present) {
      map['sync_info'] = Variable<String>(uX8ZvZgj.value);
    }
    if (dJCVP37dMYlm.present) {
      map['sincronizado'] = Variable<bool>(dJCVP37dMYlm.value);
    }
    if (lYeqPFYS.present) {
      map['creado_en'] = Variable<DateTime>(lYeqPFYS.value);
    }
    if (tHjkb.present) {
      map['rowid'] = Variable<int>(tHjkb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CombustibleRegistrosTableCompanion(')
          ..write('id: $kG, ')
          ..write('usuarioId: $zP9InJmSB, ')
          ..write('modo: $piVk, ')
          ..write('nombre: $i5QUQk, ')
          ..write('destino: $u5GveBn, ')
          ..write('horaInicio: $xAMz01YkIt, ')
          ..write('horaFinal: $ewIdFnxeO, ')
          ..write('combustibleInicial: $bLRN1zQYqxM1WWlXjr, ')
          ..write('kilometrajeInicial: $aYKSs386BUhF2mkPnG, ')
          ..write('combustibleFinal: $ybJGZWDVbEKc4n5m, ')
          ..write('kilometrajeFinal: $h0jpAs6ZpPJPw8NI, ')
          ..write('fechaCarga: $aqcX18IRuB, ')
          ..write('operador: $ekcREChe, ')
          ..write('kmAntes: $dXt6KMU, ')
          ..write('kmDespues: $ngpZB55Sc, ')
          ..write('metadata: $j4QNm5oy, ')
          ..write('syncError: $yR3qhIbzL, ')
          ..write('syncInfo: $uX8ZvZgj, ')
          ..write('sincronizado: $dJCVP37dMYlm, ')
          ..write('creadoEn: $lYeqPFYS, ')
          ..write('rowid: $tHjkb')
          ..write(')'))
        .toString();
  }
}

class Gn9jkqIImNg4fnxYGw6rFKUi extends NotificationsTable
    with TableInfo<Gn9jkqIImNg4fnxYGw6rFKUi, DPidT9wqpsXGu3Kq8QK4mS> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _pCVLn;
  Gn9jkqIImNg4fnxYGw6rFKUi(this.attachedDatabase, [this._pCVLn]);
  static const VerificationMeta _aptkfF = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ws1zF7BG5f = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gqY6lnGk7kb = const VerificationMeta(
    'mensaje',
  );
  @override
  late final GeneratedColumn<String> mensaje = GeneratedColumn<String>(
    'mensaje',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fekBaXMO = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('info'),
  );
  static const VerificationMeta _lT3RTEZUb = const VerificationMeta('leida');
  @override
  late final GeneratedColumn<bool> leida = GeneratedColumn<bool>(
    'leida',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("leida" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _vJ9J8HCz3I = const VerificationMeta('origen');
  @override
  late final GeneratedColumn<String> origen = GeneratedColumn<String>(
    'origen',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tmEuO0Smb = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    titulo,
    mensaje,
    tipo,
    leida,
    origen,
    fecha,
  ];
  @override
  String get aliasedName => _pCVLn ?? actualTableName;
  @override
  String get actualTableName => l6Xah;
  static const String l6Xah = 'notifications_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DPidT9wqpsXGu3Kq8QK4mS> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_aptkfF, id.isAcceptableOrUnknown(data['id']!, _aptkfF));
    } else if (isInserting) {
      context.missing(_aptkfF);
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _ws1zF7BG5f,
        titulo.isAcceptableOrUnknown(data['titulo']!, _ws1zF7BG5f),
      );
    } else if (isInserting) {
      context.missing(_ws1zF7BG5f);
    }
    if (data.containsKey('mensaje')) {
      context.handle(
        _gqY6lnGk7kb,
        mensaje.isAcceptableOrUnknown(data['mensaje']!, _gqY6lnGk7kb),
      );
    } else if (isInserting) {
      context.missing(_gqY6lnGk7kb);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _fekBaXMO,
        tipo.isAcceptableOrUnknown(data['tipo']!, _fekBaXMO),
      );
    }
    if (data.containsKey('leida')) {
      context.handle(
        _lT3RTEZUb,
        leida.isAcceptableOrUnknown(data['leida']!, _lT3RTEZUb),
      );
    }
    if (data.containsKey('origen')) {
      context.handle(
        _vJ9J8HCz3I,
        origen.isAcceptableOrUnknown(data['origen']!, _vJ9J8HCz3I),
      );
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _tmEuO0Smb,
        fecha.isAcceptableOrUnknown(data['fecha']!, _tmEuO0Smb),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DPidT9wqpsXGu3Kq8QK4mS map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DPidT9wqpsXGu3Kq8QK4mS(
      gG: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sIKxds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      nKcObHB: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mensaje'],
      )!,
      m3UR: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      wR1et: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}leida'],
      )!,
      zUnAP2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origen'],
      ),
      iHrN4: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
    );
  }

  @override
  Gn9jkqIImNg4fnxYGw6rFKUi createAlias(String alias) {
    return Gn9jkqIImNg4fnxYGw6rFKUi(attachedDatabase, alias);
  }
}

class DPidT9wqpsXGu3Kq8QK4mS extends DataClass
    implements Insertable<DPidT9wqpsXGu3Kq8QK4mS> {
  final String gG;
  final String sIKxds;
  final String nKcObHB;
  final String m3UR;
  final bool wR1et;
  final String? zUnAP2;
  final DateTime iHrN4;
  const DPidT9wqpsXGu3Kq8QK4mS({
    required this.gG,
    required this.sIKxds,
    required this.nKcObHB,
    required this.m3UR,
    required this.wR1et,
    this.zUnAP2,
    required this.iHrN4,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(gG);
    map['titulo'] = Variable<String>(sIKxds);
    map['mensaje'] = Variable<String>(nKcObHB);
    map['tipo'] = Variable<String>(m3UR);
    map['leida'] = Variable<bool>(wR1et);
    if (!nullToAbsent || zUnAP2 != null) {
      map['origen'] = Variable<String>(zUnAP2);
    }
    map['fecha'] = Variable<DateTime>(iHrN4);
    return map;
  }

  SWa7JoZtay7PsWkFUBhxewW9jpO a2G3oLEQ3cI(bool nullToAbsent) {
    return SWa7JoZtay7PsWkFUBhxewW9jpO(
      aN: Value(gG),
      ljk5Nd: Value(sIKxds),
      mnrOxtx: Value(nKcObHB),
      jdRb: Value(m3UR),
      zZbwB: Value(wR1et),
      b5yrQ9: zUnAP2 == null && nullToAbsent
          ? const Value.absent()
          : Value(zUnAP2),
      moLEU: Value(iHrN4),
    );
  }

  factory DPidT9wqpsXGu3Kq8QK4mS.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DPidT9wqpsXGu3Kq8QK4mS(
      gG: serializer.fromJson<String>(json['id']),
      sIKxds: serializer.fromJson<String>(json['titulo']),
      nKcObHB: serializer.fromJson<String>(json['mensaje']),
      m3UR: serializer.fromJson<String>(json['tipo']),
      wR1et: serializer.fromJson<bool>(json['leida']),
      zUnAP2: serializer.fromJson<String?>(json['origen']),
      iHrN4: serializer.fromJson<DateTime>(json['fecha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(gG),
      'titulo': serializer.toJson<String>(sIKxds),
      'mensaje': serializer.toJson<String>(nKcObHB),
      'tipo': serializer.toJson<String>(m3UR),
      'leida': serializer.toJson<bool>(wR1et),
      'origen': serializer.toJson<String?>(zUnAP2),
      'fecha': serializer.toJson<DateTime>(iHrN4),
    };
  }

  DPidT9wqpsXGu3Kq8QK4mS laXQWkNU({
    String? id,
    String? titulo,
    String? mensaje,
    String? tipo,
    bool? leida,
    Value<String?> origen = const Value.absent(),
    DateTime? fecha,
  }) => DPidT9wqpsXGu3Kq8QK4mS(
    gG: id ?? this.gG,
    sIKxds: titulo ?? this.sIKxds,
    nKcObHB: mensaje ?? this.nKcObHB,
    m3UR: tipo ?? this.m3UR,
    wR1et: leida ?? this.wR1et,
    zUnAP2: origen.present ? origen.value : this.zUnAP2,
    iHrN4: fecha ?? this.iHrN4,
  );
  DPidT9wqpsXGu3Kq8QK4mS v9mp6RwBmwQwO2Bbp(SWa7JoZtay7PsWkFUBhxewW9jpO data) {
    return DPidT9wqpsXGu3Kq8QK4mS(
      gG: data.aN.present ? data.aN.value : this.gG,
      sIKxds: data.ljk5Nd.present ? data.ljk5Nd.value : this.sIKxds,
      nKcObHB: data.mnrOxtx.present ? data.mnrOxtx.value : this.nKcObHB,
      m3UR: data.jdRb.present ? data.jdRb.value : this.m3UR,
      wR1et: data.zZbwB.present ? data.zZbwB.value : this.wR1et,
      zUnAP2: data.b5yrQ9.present ? data.b5yrQ9.value : this.zUnAP2,
      iHrN4: data.moLEU.present ? data.moLEU.value : this.iHrN4,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsTableData(')
          ..write('id: $gG, ')
          ..write('titulo: $sIKxds, ')
          ..write('mensaje: $nKcObHB, ')
          ..write('tipo: $m3UR, ')
          ..write('leida: $wR1et, ')
          ..write('origen: $zUnAP2, ')
          ..write('fecha: $iHrN4')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(gG, sIKxds, nKcObHB, m3UR, wR1et, zUnAP2, iHrN4);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DPidT9wqpsXGu3Kq8QK4mS &&
          other.gG == this.gG &&
          other.sIKxds == this.sIKxds &&
          other.nKcObHB == this.nKcObHB &&
          other.m3UR == this.m3UR &&
          other.wR1et == this.wR1et &&
          other.zUnAP2 == this.zUnAP2 &&
          other.iHrN4 == this.iHrN4);
}

class SWa7JoZtay7PsWkFUBhxewW9jpO
    extends UpdateCompanion<DPidT9wqpsXGu3Kq8QK4mS> {
  final Value<String> aN;
  final Value<String> ljk5Nd;
  final Value<String> mnrOxtx;
  final Value<String> jdRb;
  final Value<bool> zZbwB;
  final Value<String?> b5yrQ9;
  final Value<DateTime> moLEU;
  final Value<int> b82qb;
  const SWa7JoZtay7PsWkFUBhxewW9jpO({
    this.aN = const Value.absent(),
    this.ljk5Nd = const Value.absent(),
    this.mnrOxtx = const Value.absent(),
    this.jdRb = const Value.absent(),
    this.zZbwB = const Value.absent(),
    this.b5yrQ9 = const Value.absent(),
    this.moLEU = const Value.absent(),
    this.b82qb = const Value.absent(),
  });
  SWa7JoZtay7PsWkFUBhxewW9jpO.insert({
    required String id,
    required String titulo,
    required String mensaje,
    this.jdRb = const Value.absent(),
    this.zZbwB = const Value.absent(),
    this.b5yrQ9 = const Value.absent(),
    this.moLEU = const Value.absent(),
    this.b82qb = const Value.absent(),
  }) : aN = Value(id),
       ljk5Nd = Value(titulo),
       mnrOxtx = Value(mensaje);
  static Insertable<DPidT9wqpsXGu3Kq8QK4mS> dXN3z1({
    Expression<String>? id,
    Expression<String>? titulo,
    Expression<String>? mensaje,
    Expression<String>? tipo,
    Expression<bool>? leida,
    Expression<String>? origen,
    Expression<DateTime>? fecha,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titulo != null) 'titulo': titulo,
      if (mensaje != null) 'mensaje': mensaje,
      if (tipo != null) 'tipo': tipo,
      if (leida != null) 'leida': leida,
      if (origen != null) 'origen': origen,
      if (fecha != null) 'fecha': fecha,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SWa7JoZtay7PsWkFUBhxewW9jpO dnTB2RGJ({
    Value<String>? id,
    Value<String>? titulo,
    Value<String>? mensaje,
    Value<String>? tipo,
    Value<bool>? leida,
    Value<String?>? origen,
    Value<DateTime>? fecha,
    Value<int>? rowid,
  }) {
    return SWa7JoZtay7PsWkFUBhxewW9jpO(
      aN: id ?? this.aN,
      ljk5Nd: titulo ?? this.ljk5Nd,
      mnrOxtx: mensaje ?? this.mnrOxtx,
      jdRb: tipo ?? this.jdRb,
      zZbwB: leida ?? this.zZbwB,
      b5yrQ9: origen ?? this.b5yrQ9,
      moLEU: fecha ?? this.moLEU,
      b82qb: rowid ?? this.b82qb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (aN.present) {
      map['id'] = Variable<String>(aN.value);
    }
    if (ljk5Nd.present) {
      map['titulo'] = Variable<String>(ljk5Nd.value);
    }
    if (mnrOxtx.present) {
      map['mensaje'] = Variable<String>(mnrOxtx.value);
    }
    if (jdRb.present) {
      map['tipo'] = Variable<String>(jdRb.value);
    }
    if (zZbwB.present) {
      map['leida'] = Variable<bool>(zZbwB.value);
    }
    if (b5yrQ9.present) {
      map['origen'] = Variable<String>(b5yrQ9.value);
    }
    if (moLEU.present) {
      map['fecha'] = Variable<DateTime>(moLEU.value);
    }
    if (b82qb.present) {
      map['rowid'] = Variable<int>(b82qb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsTableCompanion(')
          ..write('id: $aN, ')
          ..write('titulo: $ljk5Nd, ')
          ..write('mensaje: $mnrOxtx, ')
          ..write('tipo: $jdRb, ')
          ..write('leida: $zZbwB, ')
          ..write('origen: $b5yrQ9, ')
          ..write('fecha: $moLEU, ')
          ..write('rowid: $b82qb')
          ..write(')'))
        .toString();
  }
}

class VoEzDvET6spVkF39b0bk extends SyncQueueTable
    with TableInfo<VoEzDvET6spVkF39b0bk, NArNwNTM7Tr2ljhuMP> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _zCE9Q;
  VoEzDvET6spVkF39b0bk(this.attachedDatabase, [this._zCE9Q]);
  static const VerificationMeta _d6ZA2t = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _e1g9fESk5eW = const VerificationMeta(
    'entidad',
  );
  @override
  late final GeneratedColumn<String> entidad = GeneratedColumn<String>(
    'entidad',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yDqWTTdXKOBsq = const VerificationMeta(
    'entidadId',
  );
  @override
  late final GeneratedColumn<String> entidadId = GeneratedColumn<String>(
    'entidad_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nIm3rnKh4U = const VerificationMeta('accion');
  @override
  late final GeneratedColumn<String> accion = GeneratedColumn<String>(
    'accion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  payload =
      GeneratedColumn<String>(
        'payload',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, dynamic>?>(
        VoEzDvET6spVkF39b0bk.eURylWApZIsZAh8ESL,
      );
  static const VerificationMeta _rCkPfXRZiwWfw = const VerificationMeta(
    'procesado',
  );
  @override
  late final GeneratedColumn<bool> procesado = GeneratedColumn<bool>(
    'procesado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("procesado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _kumkmjUJcGu4u = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entidad,
    entidadId,
    accion,
    payload,
    procesado,
    createdAt,
  ];
  @override
  String get aliasedName => _zCE9Q ?? actualTableName;
  @override
  String get actualTableName => jTd8f;
  static const String jTd8f = 'sync_queue_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NArNwNTM7Tr2ljhuMP> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_d6ZA2t, id.isAcceptableOrUnknown(data['id']!, _d6ZA2t));
    }
    if (data.containsKey('entidad')) {
      context.handle(
        _e1g9fESk5eW,
        entidad.isAcceptableOrUnknown(data['entidad']!, _e1g9fESk5eW),
      );
    } else if (isInserting) {
      context.missing(_e1g9fESk5eW);
    }
    if (data.containsKey('entidad_id')) {
      context.handle(
        _yDqWTTdXKOBsq,
        entidadId.isAcceptableOrUnknown(data['entidad_id']!, _yDqWTTdXKOBsq),
      );
    } else if (isInserting) {
      context.missing(_yDqWTTdXKOBsq);
    }
    if (data.containsKey('accion')) {
      context.handle(
        _nIm3rnKh4U,
        accion.isAcceptableOrUnknown(data['accion']!, _nIm3rnKh4U),
      );
    } else if (isInserting) {
      context.missing(_nIm3rnKh4U);
    }
    if (data.containsKey('procesado')) {
      context.handle(
        _rCkPfXRZiwWfw,
        procesado.isAcceptableOrUnknown(data['procesado']!, _rCkPfXRZiwWfw),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _kumkmjUJcGu4u,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _kumkmjUJcGu4u),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NArNwNTM7Tr2ljhuMP map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NArNwNTM7Tr2ljhuMP(
      bO: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tz8xnmY: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entidad'],
      )!,
      sBrJaPsHz: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entidad_id'],
      )!,
      wqtiZm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accion'],
      )!,
      fhLBlQE: VoEzDvET6spVkF39b0bk.eURylWApZIsZAh8ESL.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}payload'],
        ),
      ),
      n4ZZ1iSBa: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}procesado'],
      )!,
      fLab5Jn2T: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  VoEzDvET6spVkF39b0bk createAlias(String alias) {
    return VoEzDvET6spVkF39b0bk(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> lYAYL5bPC2LsMC29l =
      const SyncPayloadTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> eURylWApZIsZAh8ESL =
      NullAwareTypeConverter.wrap(lYAYL5bPC2LsMC29l);
}

class NArNwNTM7Tr2ljhuMP extends DataClass
    implements Insertable<NArNwNTM7Tr2ljhuMP> {
  final int bO;
  final String tz8xnmY;
  final String sBrJaPsHz;
  final String wqtiZm;
  final Map<String, dynamic>? fhLBlQE;
  final bool n4ZZ1iSBa;
  final DateTime fLab5Jn2T;
  const NArNwNTM7Tr2ljhuMP({
    required this.bO,
    required this.tz8xnmY,
    required this.sBrJaPsHz,
    required this.wqtiZm,
    this.fhLBlQE,
    required this.n4ZZ1iSBa,
    required this.fLab5Jn2T,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(bO);
    map['entidad'] = Variable<String>(tz8xnmY);
    map['entidad_id'] = Variable<String>(sBrJaPsHz);
    map['accion'] = Variable<String>(wqtiZm);
    if (!nullToAbsent || fhLBlQE != null) {
      map['payload'] = Variable<String>(
        VoEzDvET6spVkF39b0bk.eURylWApZIsZAh8ESL.toSql(fhLBlQE),
      );
    }
    map['procesado'] = Variable<bool>(n4ZZ1iSBa);
    map['created_at'] = Variable<DateTime>(fLab5Jn2T);
    return map;
  }

  SrEEFVxhxqZAGYVOYcaDbjs hSRSwT3rws3(bool nullToAbsent) {
    return SrEEFVxhxqZAGYVOYcaDbjs(
      dy: Value(bO),
      jz6JiPB: Value(tz8xnmY),
      g8u3OR9sY: Value(sBrJaPsHz),
      v7ws6e: Value(wqtiZm),
      j9qrlAp: fhLBlQE == null && nullToAbsent
          ? const Value.absent()
          : Value(fhLBlQE),
      sKt6xl9c1: Value(n4ZZ1iSBa),
      toSavqXbg: Value(fLab5Jn2T),
    );
  }

  factory NArNwNTM7Tr2ljhuMP.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NArNwNTM7Tr2ljhuMP(
      bO: serializer.fromJson<int>(json['id']),
      tz8xnmY: serializer.fromJson<String>(json['entidad']),
      sBrJaPsHz: serializer.fromJson<String>(json['entidadId']),
      wqtiZm: serializer.fromJson<String>(json['accion']),
      fhLBlQE: serializer.fromJson<Map<String, dynamic>?>(json['payload']),
      n4ZZ1iSBa: serializer.fromJson<bool>(json['procesado']),
      fLab5Jn2T: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(bO),
      'entidad': serializer.toJson<String>(tz8xnmY),
      'entidadId': serializer.toJson<String>(sBrJaPsHz),
      'accion': serializer.toJson<String>(wqtiZm),
      'payload': serializer.toJson<Map<String, dynamic>?>(fhLBlQE),
      'procesado': serializer.toJson<bool>(n4ZZ1iSBa),
      'createdAt': serializer.toJson<DateTime>(fLab5Jn2T),
    };
  }

  NArNwNTM7Tr2ljhuMP uUrEnkCh({
    int? id,
    String? entidad,
    String? entidadId,
    String? accion,
    Value<Map<String, dynamic>?> payload = const Value.absent(),
    bool? procesado,
    DateTime? createdAt,
  }) => NArNwNTM7Tr2ljhuMP(
    bO: id ?? this.bO,
    tz8xnmY: entidad ?? this.tz8xnmY,
    sBrJaPsHz: entidadId ?? this.sBrJaPsHz,
    wqtiZm: accion ?? this.wqtiZm,
    fhLBlQE: payload.present ? payload.value : this.fhLBlQE,
    n4ZZ1iSBa: procesado ?? this.n4ZZ1iSBa,
    fLab5Jn2T: createdAt ?? this.fLab5Jn2T,
  );
  NArNwNTM7Tr2ljhuMP a8J4QaEWyyDsyY1rT(SrEEFVxhxqZAGYVOYcaDbjs data) {
    return NArNwNTM7Tr2ljhuMP(
      bO: data.dy.present ? data.dy.value : this.bO,
      tz8xnmY: data.jz6JiPB.present ? data.jz6JiPB.value : this.tz8xnmY,
      sBrJaPsHz: data.g8u3OR9sY.present ? data.g8u3OR9sY.value : this.sBrJaPsHz,
      wqtiZm: data.v7ws6e.present ? data.v7ws6e.value : this.wqtiZm,
      fhLBlQE: data.j9qrlAp.present ? data.j9qrlAp.value : this.fhLBlQE,
      n4ZZ1iSBa: data.sKt6xl9c1.present ? data.sKt6xl9c1.value : this.n4ZZ1iSBa,
      fLab5Jn2T: data.toSavqXbg.present ? data.toSavqXbg.value : this.fLab5Jn2T,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableData(')
          ..write('id: $bO, ')
          ..write('entidad: $tz8xnmY, ')
          ..write('entidadId: $sBrJaPsHz, ')
          ..write('accion: $wqtiZm, ')
          ..write('payload: $fhLBlQE, ')
          ..write('procesado: $n4ZZ1iSBa, ')
          ..write('createdAt: $fLab5Jn2T')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    bO,
    tz8xnmY,
    sBrJaPsHz,
    wqtiZm,
    fhLBlQE,
    n4ZZ1iSBa,
    fLab5Jn2T,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NArNwNTM7Tr2ljhuMP &&
          other.bO == this.bO &&
          other.tz8xnmY == this.tz8xnmY &&
          other.sBrJaPsHz == this.sBrJaPsHz &&
          other.wqtiZm == this.wqtiZm &&
          other.fhLBlQE == this.fhLBlQE &&
          other.n4ZZ1iSBa == this.n4ZZ1iSBa &&
          other.fLab5Jn2T == this.fLab5Jn2T);
}

class SrEEFVxhxqZAGYVOYcaDbjs extends UpdateCompanion<NArNwNTM7Tr2ljhuMP> {
  final Value<int> dy;
  final Value<String> jz6JiPB;
  final Value<String> g8u3OR9sY;
  final Value<String> v7ws6e;
  final Value<Map<String, dynamic>?> j9qrlAp;
  final Value<bool> sKt6xl9c1;
  final Value<DateTime> toSavqXbg;
  const SrEEFVxhxqZAGYVOYcaDbjs({
    this.dy = const Value.absent(),
    this.jz6JiPB = const Value.absent(),
    this.g8u3OR9sY = const Value.absent(),
    this.v7ws6e = const Value.absent(),
    this.j9qrlAp = const Value.absent(),
    this.sKt6xl9c1 = const Value.absent(),
    this.toSavqXbg = const Value.absent(),
  });
  SrEEFVxhxqZAGYVOYcaDbjs.insert({
    this.dy = const Value.absent(),
    required String entidad,
    required String entidadId,
    required String accion,
    this.j9qrlAp = const Value.absent(),
    this.sKt6xl9c1 = const Value.absent(),
    this.toSavqXbg = const Value.absent(),
  }) : jz6JiPB = Value(entidad),
       g8u3OR9sY = Value(entidadId),
       v7ws6e = Value(accion);
  static Insertable<NArNwNTM7Tr2ljhuMP> loSb9M({
    Expression<int>? id,
    Expression<String>? entidad,
    Expression<String>? entidadId,
    Expression<String>? accion,
    Expression<String>? payload,
    Expression<bool>? procesado,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entidad != null) 'entidad': entidad,
      if (entidadId != null) 'entidad_id': entidadId,
      if (accion != null) 'accion': accion,
      if (payload != null) 'payload': payload,
      if (procesado != null) 'procesado': procesado,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SrEEFVxhxqZAGYVOYcaDbjs ksMp58W5({
    Value<int>? id,
    Value<String>? entidad,
    Value<String>? entidadId,
    Value<String>? accion,
    Value<Map<String, dynamic>?>? payload,
    Value<bool>? procesado,
    Value<DateTime>? createdAt,
  }) {
    return SrEEFVxhxqZAGYVOYcaDbjs(
      dy: id ?? this.dy,
      jz6JiPB: entidad ?? this.jz6JiPB,
      g8u3OR9sY: entidadId ?? this.g8u3OR9sY,
      v7ws6e: accion ?? this.v7ws6e,
      j9qrlAp: payload ?? this.j9qrlAp,
      sKt6xl9c1: procesado ?? this.sKt6xl9c1,
      toSavqXbg: createdAt ?? this.toSavqXbg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dy.present) {
      map['id'] = Variable<int>(dy.value);
    }
    if (jz6JiPB.present) {
      map['entidad'] = Variable<String>(jz6JiPB.value);
    }
    if (g8u3OR9sY.present) {
      map['entidad_id'] = Variable<String>(g8u3OR9sY.value);
    }
    if (v7ws6e.present) {
      map['accion'] = Variable<String>(v7ws6e.value);
    }
    if (j9qrlAp.present) {
      map['payload'] = Variable<String>(
        VoEzDvET6spVkF39b0bk.eURylWApZIsZAh8ESL.toSql(j9qrlAp.value),
      );
    }
    if (sKt6xl9c1.present) {
      map['procesado'] = Variable<bool>(sKt6xl9c1.value);
    }
    if (toSavqXbg.present) {
      map['created_at'] = Variable<DateTime>(toSavqXbg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableCompanion(')
          ..write('id: $dy, ')
          ..write('entidad: $jz6JiPB, ')
          ..write('entidadId: $g8u3OR9sY, ')
          ..write('accion: $v7ws6e, ')
          ..write('payload: $j9qrlAp, ')
          ..write('procesado: $sKt6xl9c1, ')
          ..write('createdAt: $toSavqXbg')
          ..write(')'))
        .toString();
  }
}

class J62cINCwmlQnn32ri extends TareasTable
    with TableInfo<J62cINCwmlQnn32ri, AZne3qKStPEIrwr> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _tcFrj;
  J62cINCwmlQnn32ri(this.attachedDatabase, [this._tcFrj]);
  static const VerificationMeta _cecR2F = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ckaejDeOnWHp = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isYgXuHRNZA = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
    'group_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aOt3nIKdxOHJO = const VerificationMeta(
    'reporteId',
  );
  @override
  late final GeneratedColumn<String> reporteId = GeneratedColumn<String>(
    'reporte_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _y2ffWiiKFl = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yihYAYfAROOg94d = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _xGqxoB0eNf8sw = const VerificationMeta(
    'creadoPor',
  );
  @override
  late final GeneratedColumn<String> creadoPor = GeneratedColumn<String>(
    'creado_por',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iBLiyu2tx9Ri5 = const VerificationMeta(
    'asignadoA',
  );
  @override
  late final GeneratedColumn<String> asignadoA = GeneratedColumn<String>(
    'asignado_a',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wv0oupcpIq = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    groupId,
    reporteId,
    titulo,
    descripcion,
    creadoPor,
    asignadoA,
    estado,
  ];
  @override
  String get aliasedName => _tcFrj ?? actualTableName;
  @override
  String get actualTableName => jeEjV;
  static const String jeEjV = 'tareas_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AZne3qKStPEIrwr> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_cecR2F, id.isAcceptableOrUnknown(data['id']!, _cecR2F));
    } else if (isInserting) {
      context.missing(_cecR2F);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _ckaejDeOnWHp,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _ckaejDeOnWHp),
      );
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _isYgXuHRNZA,
        groupId.isAcceptableOrUnknown(data['group_id']!, _isYgXuHRNZA),
      );
    }
    if (data.containsKey('reporte_id')) {
      context.handle(
        _aOt3nIKdxOHJO,
        reporteId.isAcceptableOrUnknown(data['reporte_id']!, _aOt3nIKdxOHJO),
      );
    } else if (isInserting) {
      context.missing(_aOt3nIKdxOHJO);
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _y2ffWiiKFl,
        titulo.isAcceptableOrUnknown(data['titulo']!, _y2ffWiiKFl),
      );
    } else if (isInserting) {
      context.missing(_y2ffWiiKFl);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _yihYAYfAROOg94d,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _yihYAYfAROOg94d,
        ),
      );
    }
    if (data.containsKey('creado_por')) {
      context.handle(
        _xGqxoB0eNf8sw,
        creadoPor.isAcceptableOrUnknown(data['creado_por']!, _xGqxoB0eNf8sw),
      );
    }
    if (data.containsKey('asignado_a')) {
      context.handle(
        _iBLiyu2tx9Ri5,
        asignadoA.isAcceptableOrUnknown(data['asignado_a']!, _iBLiyu2tx9Ri5),
      );
    } else if (isInserting) {
      context.missing(_iBLiyu2tx9Ri5);
    }
    if (data.containsKey('estado')) {
      context.handle(
        _wv0oupcpIq,
        estado.isAcceptableOrUnknown(data['estado']!, _wv0oupcpIq),
      );
    } else if (isInserting) {
      context.missing(_wv0oupcpIq);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AZne3qKStPEIrwr map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AZne3qKStPEIrwr(
      im: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      wQJqvR0H: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      qyTmQyB: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_id'],
      ),
      ohkkpa8rU: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reporte_id'],
      )!,
      r1SV6u: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      kHlx20PX2SB: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      mM2gIX7V3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creado_por'],
      ),
      gh1t7zpkL: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asignado_a'],
      )!,
      dEEBGs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
    );
  }

  @override
  J62cINCwmlQnn32ri createAlias(String alias) {
    return J62cINCwmlQnn32ri(attachedDatabase, alias);
  }
}

class AZne3qKStPEIrwr extends DataClass implements Insertable<AZne3qKStPEIrwr> {
  final String im;
  final String? wQJqvR0H;
  final String? qyTmQyB;
  final String ohkkpa8rU;
  final String r1SV6u;
  final String kHlx20PX2SB;
  final String? mM2gIX7V3;
  final String gh1t7zpkL;
  final String dEEBGs;
  const AZne3qKStPEIrwr({
    required this.im,
    this.wQJqvR0H,
    this.qyTmQyB,
    required this.ohkkpa8rU,
    required this.r1SV6u,
    required this.kHlx20PX2SB,
    this.mM2gIX7V3,
    required this.gh1t7zpkL,
    required this.dEEBGs,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(im);
    if (!nullToAbsent || wQJqvR0H != null) {
      map['remote_id'] = Variable<String>(wQJqvR0H);
    }
    if (!nullToAbsent || qyTmQyB != null) {
      map['group_id'] = Variable<String>(qyTmQyB);
    }
    map['reporte_id'] = Variable<String>(ohkkpa8rU);
    map['titulo'] = Variable<String>(r1SV6u);
    map['descripcion'] = Variable<String>(kHlx20PX2SB);
    if (!nullToAbsent || mM2gIX7V3 != null) {
      map['creado_por'] = Variable<String>(mM2gIX7V3);
    }
    map['asignado_a'] = Variable<String>(gh1t7zpkL);
    map['estado'] = Variable<String>(dEEBGs);
    return map;
  }

  OwsvOrFusdhz7tOUKhJP dPw5LgxeCv8(bool nullToAbsent) {
    return OwsvOrFusdhz7tOUKhJP(
      vN: Value(im),
      rN7JO0qb: wQJqvR0H == null && nullToAbsent
          ? const Value.absent()
          : Value(wQJqvR0H),
      kiENrzh: qyTmQyB == null && nullToAbsent
          ? const Value.absent()
          : Value(qyTmQyB),
      aeirywxyG: Value(ohkkpa8rU),
      ynDuUW: Value(r1SV6u),
      lOp8NQT26oW: Value(kHlx20PX2SB),
      x542jWBgN: mM2gIX7V3 == null && nullToAbsent
          ? const Value.absent()
          : Value(mM2gIX7V3),
      z9uTXhbFC: Value(gh1t7zpkL),
      tJjuIr: Value(dEEBGs),
    );
  }

  factory AZne3qKStPEIrwr.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AZne3qKStPEIrwr(
      im: serializer.fromJson<String>(json['id']),
      wQJqvR0H: serializer.fromJson<String?>(json['remoteId']),
      qyTmQyB: serializer.fromJson<String?>(json['groupId']),
      ohkkpa8rU: serializer.fromJson<String>(json['reporteId']),
      r1SV6u: serializer.fromJson<String>(json['titulo']),
      kHlx20PX2SB: serializer.fromJson<String>(json['descripcion']),
      mM2gIX7V3: serializer.fromJson<String?>(json['creadoPor']),
      gh1t7zpkL: serializer.fromJson<String>(json['asignadoA']),
      dEEBGs: serializer.fromJson<String>(json['estado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(im),
      'remoteId': serializer.toJson<String?>(wQJqvR0H),
      'groupId': serializer.toJson<String?>(qyTmQyB),
      'reporteId': serializer.toJson<String>(ohkkpa8rU),
      'titulo': serializer.toJson<String>(r1SV6u),
      'descripcion': serializer.toJson<String>(kHlx20PX2SB),
      'creadoPor': serializer.toJson<String?>(mM2gIX7V3),
      'asignadoA': serializer.toJson<String>(gh1t7zpkL),
      'estado': serializer.toJson<String>(dEEBGs),
    };
  }

  AZne3qKStPEIrwr fSGHVcWg({
    String? id,
    Value<String?> remoteId = const Value.absent(),
    Value<String?> groupId = const Value.absent(),
    String? reporteId,
    String? titulo,
    String? descripcion,
    Value<String?> creadoPor = const Value.absent(),
    String? asignadoA,
    String? estado,
  }) => AZne3qKStPEIrwr(
    im: id ?? this.im,
    wQJqvR0H: remoteId.present ? remoteId.value : this.wQJqvR0H,
    qyTmQyB: groupId.present ? groupId.value : this.qyTmQyB,
    ohkkpa8rU: reporteId ?? this.ohkkpa8rU,
    r1SV6u: titulo ?? this.r1SV6u,
    kHlx20PX2SB: descripcion ?? this.kHlx20PX2SB,
    mM2gIX7V3: creadoPor.present ? creadoPor.value : this.mM2gIX7V3,
    gh1t7zpkL: asignadoA ?? this.gh1t7zpkL,
    dEEBGs: estado ?? this.dEEBGs,
  );
  AZne3qKStPEIrwr oWGk7gdkrwHSgsshU(OwsvOrFusdhz7tOUKhJP data) {
    return AZne3qKStPEIrwr(
      im: data.vN.present ? data.vN.value : this.im,
      wQJqvR0H: data.rN7JO0qb.present ? data.rN7JO0qb.value : this.wQJqvR0H,
      qyTmQyB: data.kiENrzh.present ? data.kiENrzh.value : this.qyTmQyB,
      ohkkpa8rU: data.aeirywxyG.present ? data.aeirywxyG.value : this.ohkkpa8rU,
      r1SV6u: data.ynDuUW.present ? data.ynDuUW.value : this.r1SV6u,
      kHlx20PX2SB: data.lOp8NQT26oW.present
          ? data.lOp8NQT26oW.value
          : this.kHlx20PX2SB,
      mM2gIX7V3: data.x542jWBgN.present ? data.x542jWBgN.value : this.mM2gIX7V3,
      gh1t7zpkL: data.z9uTXhbFC.present ? data.z9uTXhbFC.value : this.gh1t7zpkL,
      dEEBGs: data.tJjuIr.present ? data.tJjuIr.value : this.dEEBGs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TareasTableData(')
          ..write('id: $im, ')
          ..write('remoteId: $wQJqvR0H, ')
          ..write('groupId: $qyTmQyB, ')
          ..write('reporteId: $ohkkpa8rU, ')
          ..write('titulo: $r1SV6u, ')
          ..write('descripcion: $kHlx20PX2SB, ')
          ..write('creadoPor: $mM2gIX7V3, ')
          ..write('asignadoA: $gh1t7zpkL, ')
          ..write('estado: $dEEBGs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    im,
    wQJqvR0H,
    qyTmQyB,
    ohkkpa8rU,
    r1SV6u,
    kHlx20PX2SB,
    mM2gIX7V3,
    gh1t7zpkL,
    dEEBGs,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AZne3qKStPEIrwr &&
          other.im == this.im &&
          other.wQJqvR0H == this.wQJqvR0H &&
          other.qyTmQyB == this.qyTmQyB &&
          other.ohkkpa8rU == this.ohkkpa8rU &&
          other.r1SV6u == this.r1SV6u &&
          other.kHlx20PX2SB == this.kHlx20PX2SB &&
          other.mM2gIX7V3 == this.mM2gIX7V3 &&
          other.gh1t7zpkL == this.gh1t7zpkL &&
          other.dEEBGs == this.dEEBGs);
}

class OwsvOrFusdhz7tOUKhJP extends UpdateCompanion<AZne3qKStPEIrwr> {
  final Value<String> vN;
  final Value<String?> rN7JO0qb;
  final Value<String?> kiENrzh;
  final Value<String> aeirywxyG;
  final Value<String> ynDuUW;
  final Value<String> lOp8NQT26oW;
  final Value<String?> x542jWBgN;
  final Value<String> z9uTXhbFC;
  final Value<String> tJjuIr;
  final Value<int> rLjxm;
  const OwsvOrFusdhz7tOUKhJP({
    this.vN = const Value.absent(),
    this.rN7JO0qb = const Value.absent(),
    this.kiENrzh = const Value.absent(),
    this.aeirywxyG = const Value.absent(),
    this.ynDuUW = const Value.absent(),
    this.lOp8NQT26oW = const Value.absent(),
    this.x542jWBgN = const Value.absent(),
    this.z9uTXhbFC = const Value.absent(),
    this.tJjuIr = const Value.absent(),
    this.rLjxm = const Value.absent(),
  });
  OwsvOrFusdhz7tOUKhJP.insert({
    required String id,
    this.rN7JO0qb = const Value.absent(),
    this.kiENrzh = const Value.absent(),
    required String reporteId,
    required String titulo,
    this.lOp8NQT26oW = const Value.absent(),
    this.x542jWBgN = const Value.absent(),
    required String asignadoA,
    required String estado,
    this.rLjxm = const Value.absent(),
  }) : vN = Value(id),
       aeirywxyG = Value(reporteId),
       ynDuUW = Value(titulo),
       z9uTXhbFC = Value(asignadoA),
       tJjuIr = Value(estado);
  static Insertable<AZne3qKStPEIrwr> eZm6o2({
    Expression<String>? id,
    Expression<String>? remoteId,
    Expression<String>? groupId,
    Expression<String>? reporteId,
    Expression<String>? titulo,
    Expression<String>? descripcion,
    Expression<String>? creadoPor,
    Expression<String>? asignadoA,
    Expression<String>? estado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (groupId != null) 'group_id': groupId,
      if (reporteId != null) 'reporte_id': reporteId,
      if (titulo != null) 'titulo': titulo,
      if (descripcion != null) 'descripcion': descripcion,
      if (creadoPor != null) 'creado_por': creadoPor,
      if (asignadoA != null) 'asignado_a': asignadoA,
      if (estado != null) 'estado': estado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OwsvOrFusdhz7tOUKhJP cpDRm0A2({
    Value<String>? id,
    Value<String?>? remoteId,
    Value<String?>? groupId,
    Value<String>? reporteId,
    Value<String>? titulo,
    Value<String>? descripcion,
    Value<String?>? creadoPor,
    Value<String>? asignadoA,
    Value<String>? estado,
    Value<int>? rowid,
  }) {
    return OwsvOrFusdhz7tOUKhJP(
      vN: id ?? this.vN,
      rN7JO0qb: remoteId ?? this.rN7JO0qb,
      kiENrzh: groupId ?? this.kiENrzh,
      aeirywxyG: reporteId ?? this.aeirywxyG,
      ynDuUW: titulo ?? this.ynDuUW,
      lOp8NQT26oW: descripcion ?? this.lOp8NQT26oW,
      x542jWBgN: creadoPor ?? this.x542jWBgN,
      z9uTXhbFC: asignadoA ?? this.z9uTXhbFC,
      tJjuIr: estado ?? this.tJjuIr,
      rLjxm: rowid ?? this.rLjxm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (vN.present) {
      map['id'] = Variable<String>(vN.value);
    }
    if (rN7JO0qb.present) {
      map['remote_id'] = Variable<String>(rN7JO0qb.value);
    }
    if (kiENrzh.present) {
      map['group_id'] = Variable<String>(kiENrzh.value);
    }
    if (aeirywxyG.present) {
      map['reporte_id'] = Variable<String>(aeirywxyG.value);
    }
    if (ynDuUW.present) {
      map['titulo'] = Variable<String>(ynDuUW.value);
    }
    if (lOp8NQT26oW.present) {
      map['descripcion'] = Variable<String>(lOp8NQT26oW.value);
    }
    if (x542jWBgN.present) {
      map['creado_por'] = Variable<String>(x542jWBgN.value);
    }
    if (z9uTXhbFC.present) {
      map['asignado_a'] = Variable<String>(z9uTXhbFC.value);
    }
    if (tJjuIr.present) {
      map['estado'] = Variable<String>(tJjuIr.value);
    }
    if (rLjxm.present) {
      map['rowid'] = Variable<int>(rLjxm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TareasTableCompanion(')
          ..write('id: $vN, ')
          ..write('remoteId: $rN7JO0qb, ')
          ..write('groupId: $kiENrzh, ')
          ..write('reporteId: $aeirywxyG, ')
          ..write('titulo: $ynDuUW, ')
          ..write('descripcion: $lOp8NQT26oW, ')
          ..write('creadoPor: $x542jWBgN, ')
          ..write('asignadoA: $z9uTXhbFC, ')
          ..write('estado: $tJjuIr, ')
          ..write('rowid: $rLjxm')
          ..write(')'))
        .toString();
  }
}

class H3NxUrmIatWHjGU32octXOFRSTp extends TareaComentariosTable
    with TableInfo<H3NxUrmIatWHjGU32octXOFRSTp, PfsdSEuE2JF8CtLF5W1e1XWcI> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _aKMym;
  H3NxUrmIatWHjGU32octXOFRSTp(this.attachedDatabase, [this._aKMym]);
  static const VerificationMeta _jycuHC = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tiaL2aVD8F1 = const VerificationMeta(
    'tareaId',
  );
  @override
  late final GeneratedColumn<String> tareaId = GeneratedColumn<String>(
    'tarea_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yOLyEH5Dwfm = const VerificationMeta(
    'autorId',
  );
  @override
  late final GeneratedColumn<String> autorId = GeneratedColumn<String>(
    'autor_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _htPGUOwk9zf = const VerificationMeta(
    'mensaje',
  );
  @override
  late final GeneratedColumn<String> mensaje = GeneratedColumn<String>(
    'mensaje',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aJXdNUe6oIex = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tareaId,
    autorId,
    mensaje,
    creadoEn,
  ];
  @override
  String get aliasedName => _aKMym ?? actualTableName;
  @override
  String get actualTableName => dCyty;
  static const String dCyty = 'tarea_comentarios_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PfsdSEuE2JF8CtLF5W1e1XWcI> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_jycuHC, id.isAcceptableOrUnknown(data['id']!, _jycuHC));
    } else if (isInserting) {
      context.missing(_jycuHC);
    }
    if (data.containsKey('tarea_id')) {
      context.handle(
        _tiaL2aVD8F1,
        tareaId.isAcceptableOrUnknown(data['tarea_id']!, _tiaL2aVD8F1),
      );
    } else if (isInserting) {
      context.missing(_tiaL2aVD8F1);
    }
    if (data.containsKey('autor_id')) {
      context.handle(
        _yOLyEH5Dwfm,
        autorId.isAcceptableOrUnknown(data['autor_id']!, _yOLyEH5Dwfm),
      );
    } else if (isInserting) {
      context.missing(_yOLyEH5Dwfm);
    }
    if (data.containsKey('mensaje')) {
      context.handle(
        _htPGUOwk9zf,
        mensaje.isAcceptableOrUnknown(data['mensaje']!, _htPGUOwk9zf),
      );
    } else if (isInserting) {
      context.missing(_htPGUOwk9zf);
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _aJXdNUe6oIex,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _aJXdNUe6oIex),
      );
    } else if (isInserting) {
      context.missing(_aJXdNUe6oIex);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PfsdSEuE2JF8CtLF5W1e1XWcI map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PfsdSEuE2JF8CtLF5W1e1XWcI(
      gU: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      iqe8oGs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tarea_id'],
      )!,
      wlGHboV: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}autor_id'],
      )!,
      dCBTth4: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mensaje'],
      )!,
      vE15dpcm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  H3NxUrmIatWHjGU32octXOFRSTp createAlias(String alias) {
    return H3NxUrmIatWHjGU32octXOFRSTp(attachedDatabase, alias);
  }
}

class PfsdSEuE2JF8CtLF5W1e1XWcI extends DataClass
    implements Insertable<PfsdSEuE2JF8CtLF5W1e1XWcI> {
  final String gU;
  final String iqe8oGs;
  final String wlGHboV;
  final String dCBTth4;
  final DateTime vE15dpcm;
  const PfsdSEuE2JF8CtLF5W1e1XWcI({
    required this.gU,
    required this.iqe8oGs,
    required this.wlGHboV,
    required this.dCBTth4,
    required this.vE15dpcm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(gU);
    map['tarea_id'] = Variable<String>(iqe8oGs);
    map['autor_id'] = Variable<String>(wlGHboV);
    map['mensaje'] = Variable<String>(dCBTth4);
    map['creado_en'] = Variable<DateTime>(vE15dpcm);
    return map;
  }

  G4ZLuhxuHaVA2A7emAJSd9pokMajYj de3gw2mdvxe(bool nullToAbsent) {
    return G4ZLuhxuHaVA2A7emAJSd9pokMajYj(
      dc: Value(gU),
      zQBZZlP: Value(iqe8oGs),
      t9Zc8W4: Value(wlGHboV),
      eYwLAmk: Value(dCBTth4),
      h5ANAMwE: Value(vE15dpcm),
    );
  }

  factory PfsdSEuE2JF8CtLF5W1e1XWcI.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PfsdSEuE2JF8CtLF5W1e1XWcI(
      gU: serializer.fromJson<String>(json['id']),
      iqe8oGs: serializer.fromJson<String>(json['tareaId']),
      wlGHboV: serializer.fromJson<String>(json['autorId']),
      dCBTth4: serializer.fromJson<String>(json['mensaje']),
      vE15dpcm: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(gU),
      'tareaId': serializer.toJson<String>(iqe8oGs),
      'autorId': serializer.toJson<String>(wlGHboV),
      'mensaje': serializer.toJson<String>(dCBTth4),
      'creadoEn': serializer.toJson<DateTime>(vE15dpcm),
    };
  }

  PfsdSEuE2JF8CtLF5W1e1XWcI fPDltanl({
    String? id,
    String? tareaId,
    String? autorId,
    String? mensaje,
    DateTime? creadoEn,
  }) => PfsdSEuE2JF8CtLF5W1e1XWcI(
    gU: id ?? this.gU,
    iqe8oGs: tareaId ?? this.iqe8oGs,
    wlGHboV: autorId ?? this.wlGHboV,
    dCBTth4: mensaje ?? this.dCBTth4,
    vE15dpcm: creadoEn ?? this.vE15dpcm,
  );
  PfsdSEuE2JF8CtLF5W1e1XWcI s0Qcpuy8SZExx5P4f(
    G4ZLuhxuHaVA2A7emAJSd9pokMajYj data,
  ) {
    return PfsdSEuE2JF8CtLF5W1e1XWcI(
      gU: data.dc.present ? data.dc.value : this.gU,
      iqe8oGs: data.zQBZZlP.present ? data.zQBZZlP.value : this.iqe8oGs,
      wlGHboV: data.t9Zc8W4.present ? data.t9Zc8W4.value : this.wlGHboV,
      dCBTth4: data.eYwLAmk.present ? data.eYwLAmk.value : this.dCBTth4,
      vE15dpcm: data.h5ANAMwE.present ? data.h5ANAMwE.value : this.vE15dpcm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TareaComentariosTableData(')
          ..write('id: $gU, ')
          ..write('tareaId: $iqe8oGs, ')
          ..write('autorId: $wlGHboV, ')
          ..write('mensaje: $dCBTth4, ')
          ..write('creadoEn: $vE15dpcm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(gU, iqe8oGs, wlGHboV, dCBTth4, vE15dpcm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PfsdSEuE2JF8CtLF5W1e1XWcI &&
          other.gU == this.gU &&
          other.iqe8oGs == this.iqe8oGs &&
          other.wlGHboV == this.wlGHboV &&
          other.dCBTth4 == this.dCBTth4 &&
          other.vE15dpcm == this.vE15dpcm);
}

class G4ZLuhxuHaVA2A7emAJSd9pokMajYj
    extends UpdateCompanion<PfsdSEuE2JF8CtLF5W1e1XWcI> {
  final Value<String> dc;
  final Value<String> zQBZZlP;
  final Value<String> t9Zc8W4;
  final Value<String> eYwLAmk;
  final Value<DateTime> h5ANAMwE;
  final Value<int> ea0zu;
  const G4ZLuhxuHaVA2A7emAJSd9pokMajYj({
    this.dc = const Value.absent(),
    this.zQBZZlP = const Value.absent(),
    this.t9Zc8W4 = const Value.absent(),
    this.eYwLAmk = const Value.absent(),
    this.h5ANAMwE = const Value.absent(),
    this.ea0zu = const Value.absent(),
  });
  G4ZLuhxuHaVA2A7emAJSd9pokMajYj.insert({
    required String id,
    required String tareaId,
    required String autorId,
    required String mensaje,
    required DateTime creadoEn,
    this.ea0zu = const Value.absent(),
  }) : dc = Value(id),
       zQBZZlP = Value(tareaId),
       t9Zc8W4 = Value(autorId),
       eYwLAmk = Value(mensaje),
       h5ANAMwE = Value(creadoEn);
  static Insertable<PfsdSEuE2JF8CtLF5W1e1XWcI> o16sYt({
    Expression<String>? id,
    Expression<String>? tareaId,
    Expression<String>? autorId,
    Expression<String>? mensaje,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tareaId != null) 'tarea_id': tareaId,
      if (autorId != null) 'autor_id': autorId,
      if (mensaje != null) 'mensaje': mensaje,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  G4ZLuhxuHaVA2A7emAJSd9pokMajYj tfKxBinG({
    Value<String>? id,
    Value<String>? tareaId,
    Value<String>? autorId,
    Value<String>? mensaje,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return G4ZLuhxuHaVA2A7emAJSd9pokMajYj(
      dc: id ?? this.dc,
      zQBZZlP: tareaId ?? this.zQBZZlP,
      t9Zc8W4: autorId ?? this.t9Zc8W4,
      eYwLAmk: mensaje ?? this.eYwLAmk,
      h5ANAMwE: creadoEn ?? this.h5ANAMwE,
      ea0zu: rowid ?? this.ea0zu,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dc.present) {
      map['id'] = Variable<String>(dc.value);
    }
    if (zQBZZlP.present) {
      map['tarea_id'] = Variable<String>(zQBZZlP.value);
    }
    if (t9Zc8W4.present) {
      map['autor_id'] = Variable<String>(t9Zc8W4.value);
    }
    if (eYwLAmk.present) {
      map['mensaje'] = Variable<String>(eYwLAmk.value);
    }
    if (h5ANAMwE.present) {
      map['creado_en'] = Variable<DateTime>(h5ANAMwE.value);
    }
    if (ea0zu.present) {
      map['rowid'] = Variable<int>(ea0zu.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TareaComentariosTableCompanion(')
          ..write('id: $dc, ')
          ..write('tareaId: $zQBZZlP, ')
          ..write('autorId: $t9Zc8W4, ')
          ..write('mensaje: $eYwLAmk, ')
          ..write('creadoEn: $h5ANAMwE, ')
          ..write('rowid: $ea0zu')
          ..write(')'))
        .toString();
  }
}

class TdpibLkvaSVlNdhYP94EMgY2 extends TareaAdjuntosTable
    with TableInfo<TdpibLkvaSVlNdhYP94EMgY2, Rot0adVvP5dwb2j4cDof6l> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _o97Ke;
  TdpibLkvaSVlNdhYP94EMgY2(this.attachedDatabase, [this._o97Ke]);
  static const VerificationMeta _c3055u = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pRU1EpZpYoa = const VerificationMeta(
    'tareaId',
  );
  @override
  late final GeneratedColumn<String> tareaId = GeneratedColumn<String>(
    'tarea_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shqpUYya = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _a75KbzHbHl = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iwAmSl4mpE8yp = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pMllJzkq99e2 = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _djXh5VLT6EK42 = const VerificationMeta(
    'remoteUrl',
  );
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
    'remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ivDT8bczsoti = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tareaId,
    tipo,
    nombre,
    localPath,
    mimeType,
    remoteUrl,
    creadoEn,
  ];
  @override
  String get aliasedName => _o97Ke ?? actualTableName;
  @override
  String get actualTableName => uMnBG;
  static const String uMnBG = 'tarea_adjuntos_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Rot0adVvP5dwb2j4cDof6l> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_c3055u, id.isAcceptableOrUnknown(data['id']!, _c3055u));
    } else if (isInserting) {
      context.missing(_c3055u);
    }
    if (data.containsKey('tarea_id')) {
      context.handle(
        _pRU1EpZpYoa,
        tareaId.isAcceptableOrUnknown(data['tarea_id']!, _pRU1EpZpYoa),
      );
    } else if (isInserting) {
      context.missing(_pRU1EpZpYoa);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _shqpUYya,
        tipo.isAcceptableOrUnknown(data['tipo']!, _shqpUYya),
      );
    } else if (isInserting) {
      context.missing(_shqpUYya);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _a75KbzHbHl,
        nombre.isAcceptableOrUnknown(data['nombre']!, _a75KbzHbHl),
      );
    } else if (isInserting) {
      context.missing(_a75KbzHbHl);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _iwAmSl4mpE8yp,
        localPath.isAcceptableOrUnknown(data['local_path']!, _iwAmSl4mpE8yp),
      );
    } else if (isInserting) {
      context.missing(_iwAmSl4mpE8yp);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _pMllJzkq99e2,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _pMllJzkq99e2),
      );
    }
    if (data.containsKey('remote_url')) {
      context.handle(
        _djXh5VLT6EK42,
        remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _djXh5VLT6EK42),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _ivDT8bczsoti,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _ivDT8bczsoti),
      );
    } else if (isInserting) {
      context.missing(_ivDT8bczsoti);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rot0adVvP5dwb2j4cDof6l map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rot0adVvP5dwb2j4cDof6l(
      bD: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      uHHdHYU: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tarea_id'],
      )!,
      bJjB: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      bU7gaa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      uCI0oZ05u: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      nu37jWl2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      ),
      nYb2TcCaM: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_url'],
      ),
      lvogrTK5: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  TdpibLkvaSVlNdhYP94EMgY2 createAlias(String alias) {
    return TdpibLkvaSVlNdhYP94EMgY2(attachedDatabase, alias);
  }
}

class Rot0adVvP5dwb2j4cDof6l extends DataClass
    implements Insertable<Rot0adVvP5dwb2j4cDof6l> {
  final String bD;
  final String uHHdHYU;

  /// 'foto' o 'documento'
  final String bJjB;
  final String bU7gaa;
  final String uCI0oZ05u;
  final String? nu37jWl2;
  final String? nYb2TcCaM;
  final DateTime lvogrTK5;
  const Rot0adVvP5dwb2j4cDof6l({
    required this.bD,
    required this.uHHdHYU,
    required this.bJjB,
    required this.bU7gaa,
    required this.uCI0oZ05u,
    this.nu37jWl2,
    this.nYb2TcCaM,
    required this.lvogrTK5,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(bD);
    map['tarea_id'] = Variable<String>(uHHdHYU);
    map['tipo'] = Variable<String>(bJjB);
    map['nombre'] = Variable<String>(bU7gaa);
    map['local_path'] = Variable<String>(uCI0oZ05u);
    if (!nullToAbsent || nu37jWl2 != null) {
      map['mime_type'] = Variable<String>(nu37jWl2);
    }
    if (!nullToAbsent || nYb2TcCaM != null) {
      map['remote_url'] = Variable<String>(nYb2TcCaM);
    }
    map['creado_en'] = Variable<DateTime>(lvogrTK5);
    return map;
  }

  QlrnTCYlJIu0qdevCWFMOwRPuhb m5jvWT98nJX(bool nullToAbsent) {
    return QlrnTCYlJIu0qdevCWFMOwRPuhb(
      cC: Value(bD),
      x35Hv88: Value(uHHdHYU),
      hXAX: Value(bJjB),
      cSDgEc: Value(bU7gaa),
      tOyOIzLZx: Value(uCI0oZ05u),
      wvT2cjKQ: nu37jWl2 == null && nullToAbsent
          ? const Value.absent()
          : Value(nu37jWl2),
      r4cZYBdDG: nYb2TcCaM == null && nullToAbsent
          ? const Value.absent()
          : Value(nYb2TcCaM),
      kq5gx0Ow: Value(lvogrTK5),
    );
  }

  factory Rot0adVvP5dwb2j4cDof6l.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rot0adVvP5dwb2j4cDof6l(
      bD: serializer.fromJson<String>(json['id']),
      uHHdHYU: serializer.fromJson<String>(json['tareaId']),
      bJjB: serializer.fromJson<String>(json['tipo']),
      bU7gaa: serializer.fromJson<String>(json['nombre']),
      uCI0oZ05u: serializer.fromJson<String>(json['localPath']),
      nu37jWl2: serializer.fromJson<String?>(json['mimeType']),
      nYb2TcCaM: serializer.fromJson<String?>(json['remoteUrl']),
      lvogrTK5: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(bD),
      'tareaId': serializer.toJson<String>(uHHdHYU),
      'tipo': serializer.toJson<String>(bJjB),
      'nombre': serializer.toJson<String>(bU7gaa),
      'localPath': serializer.toJson<String>(uCI0oZ05u),
      'mimeType': serializer.toJson<String?>(nu37jWl2),
      'remoteUrl': serializer.toJson<String?>(nYb2TcCaM),
      'creadoEn': serializer.toJson<DateTime>(lvogrTK5),
    };
  }

  Rot0adVvP5dwb2j4cDof6l pqs0Nqb1({
    String? id,
    String? tareaId,
    String? tipo,
    String? nombre,
    String? localPath,
    Value<String?> mimeType = const Value.absent(),
    Value<String?> remoteUrl = const Value.absent(),
    DateTime? creadoEn,
  }) => Rot0adVvP5dwb2j4cDof6l(
    bD: id ?? this.bD,
    uHHdHYU: tareaId ?? this.uHHdHYU,
    bJjB: tipo ?? this.bJjB,
    bU7gaa: nombre ?? this.bU7gaa,
    uCI0oZ05u: localPath ?? this.uCI0oZ05u,
    nu37jWl2: mimeType.present ? mimeType.value : this.nu37jWl2,
    nYb2TcCaM: remoteUrl.present ? remoteUrl.value : this.nYb2TcCaM,
    lvogrTK5: creadoEn ?? this.lvogrTK5,
  );
  Rot0adVvP5dwb2j4cDof6l hmh3JmK8La3xvtHTX(QlrnTCYlJIu0qdevCWFMOwRPuhb data) {
    return Rot0adVvP5dwb2j4cDof6l(
      bD: data.cC.present ? data.cC.value : this.bD,
      uHHdHYU: data.x35Hv88.present ? data.x35Hv88.value : this.uHHdHYU,
      bJjB: data.hXAX.present ? data.hXAX.value : this.bJjB,
      bU7gaa: data.cSDgEc.present ? data.cSDgEc.value : this.bU7gaa,
      uCI0oZ05u: data.tOyOIzLZx.present ? data.tOyOIzLZx.value : this.uCI0oZ05u,
      nu37jWl2: data.wvT2cjKQ.present ? data.wvT2cjKQ.value : this.nu37jWl2,
      nYb2TcCaM: data.r4cZYBdDG.present ? data.r4cZYBdDG.value : this.nYb2TcCaM,
      lvogrTK5: data.kq5gx0Ow.present ? data.kq5gx0Ow.value : this.lvogrTK5,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TareaAdjuntosTableData(')
          ..write('id: $bD, ')
          ..write('tareaId: $uHHdHYU, ')
          ..write('tipo: $bJjB, ')
          ..write('nombre: $bU7gaa, ')
          ..write('localPath: $uCI0oZ05u, ')
          ..write('mimeType: $nu37jWl2, ')
          ..write('remoteUrl: $nYb2TcCaM, ')
          ..write('creadoEn: $lvogrTK5')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    bD,
    uHHdHYU,
    bJjB,
    bU7gaa,
    uCI0oZ05u,
    nu37jWl2,
    nYb2TcCaM,
    lvogrTK5,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rot0adVvP5dwb2j4cDof6l &&
          other.bD == this.bD &&
          other.uHHdHYU == this.uHHdHYU &&
          other.bJjB == this.bJjB &&
          other.bU7gaa == this.bU7gaa &&
          other.uCI0oZ05u == this.uCI0oZ05u &&
          other.nu37jWl2 == this.nu37jWl2 &&
          other.nYb2TcCaM == this.nYb2TcCaM &&
          other.lvogrTK5 == this.lvogrTK5);
}

class QlrnTCYlJIu0qdevCWFMOwRPuhb
    extends UpdateCompanion<Rot0adVvP5dwb2j4cDof6l> {
  final Value<String> cC;
  final Value<String> x35Hv88;
  final Value<String> hXAX;
  final Value<String> cSDgEc;
  final Value<String> tOyOIzLZx;
  final Value<String?> wvT2cjKQ;
  final Value<String?> r4cZYBdDG;
  final Value<DateTime> kq5gx0Ow;
  final Value<int> tlaHb;
  const QlrnTCYlJIu0qdevCWFMOwRPuhb({
    this.cC = const Value.absent(),
    this.x35Hv88 = const Value.absent(),
    this.hXAX = const Value.absent(),
    this.cSDgEc = const Value.absent(),
    this.tOyOIzLZx = const Value.absent(),
    this.wvT2cjKQ = const Value.absent(),
    this.r4cZYBdDG = const Value.absent(),
    this.kq5gx0Ow = const Value.absent(),
    this.tlaHb = const Value.absent(),
  });
  QlrnTCYlJIu0qdevCWFMOwRPuhb.insert({
    required String id,
    required String tareaId,
    required String tipo,
    required String nombre,
    required String localPath,
    this.wvT2cjKQ = const Value.absent(),
    this.r4cZYBdDG = const Value.absent(),
    required DateTime creadoEn,
    this.tlaHb = const Value.absent(),
  }) : cC = Value(id),
       x35Hv88 = Value(tareaId),
       hXAX = Value(tipo),
       cSDgEc = Value(nombre),
       tOyOIzLZx = Value(localPath),
       kq5gx0Ow = Value(creadoEn);
  static Insertable<Rot0adVvP5dwb2j4cDof6l> ufP57S({
    Expression<String>? id,
    Expression<String>? tareaId,
    Expression<String>? tipo,
    Expression<String>? nombre,
    Expression<String>? localPath,
    Expression<String>? mimeType,
    Expression<String>? remoteUrl,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tareaId != null) 'tarea_id': tareaId,
      if (tipo != null) 'tipo': tipo,
      if (nombre != null) 'nombre': nombre,
      if (localPath != null) 'local_path': localPath,
      if (mimeType != null) 'mime_type': mimeType,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QlrnTCYlJIu0qdevCWFMOwRPuhb hRdgikGO({
    Value<String>? id,
    Value<String>? tareaId,
    Value<String>? tipo,
    Value<String>? nombre,
    Value<String>? localPath,
    Value<String?>? mimeType,
    Value<String?>? remoteUrl,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return QlrnTCYlJIu0qdevCWFMOwRPuhb(
      cC: id ?? this.cC,
      x35Hv88: tareaId ?? this.x35Hv88,
      hXAX: tipo ?? this.hXAX,
      cSDgEc: nombre ?? this.cSDgEc,
      tOyOIzLZx: localPath ?? this.tOyOIzLZx,
      wvT2cjKQ: mimeType ?? this.wvT2cjKQ,
      r4cZYBdDG: remoteUrl ?? this.r4cZYBdDG,
      kq5gx0Ow: creadoEn ?? this.kq5gx0Ow,
      tlaHb: rowid ?? this.tlaHb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cC.present) {
      map['id'] = Variable<String>(cC.value);
    }
    if (x35Hv88.present) {
      map['tarea_id'] = Variable<String>(x35Hv88.value);
    }
    if (hXAX.present) {
      map['tipo'] = Variable<String>(hXAX.value);
    }
    if (cSDgEc.present) {
      map['nombre'] = Variable<String>(cSDgEc.value);
    }
    if (tOyOIzLZx.present) {
      map['local_path'] = Variable<String>(tOyOIzLZx.value);
    }
    if (wvT2cjKQ.present) {
      map['mime_type'] = Variable<String>(wvT2cjKQ.value);
    }
    if (r4cZYBdDG.present) {
      map['remote_url'] = Variable<String>(r4cZYBdDG.value);
    }
    if (kq5gx0Ow.present) {
      map['creado_en'] = Variable<DateTime>(kq5gx0Ow.value);
    }
    if (tlaHb.present) {
      map['rowid'] = Variable<int>(tlaHb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TareaAdjuntosTableCompanion(')
          ..write('id: $cC, ')
          ..write('tareaId: $x35Hv88, ')
          ..write('tipo: $hXAX, ')
          ..write('nombre: $cSDgEc, ')
          ..write('localPath: $tOyOIzLZx, ')
          ..write('mimeType: $wvT2cjKQ, ')
          ..write('remoteUrl: $r4cZYBdDG, ')
          ..write('creadoEn: $kq5gx0Ow, ')
          ..write('rowid: $tlaHb')
          ..write(')'))
        .toString();
  }
}

class OZOvvqDyixK8vCrBMu7 extends ReportesTable
    with TableInfo<OZOvvqDyixK8vCrBMu7, S3xRBVOlVfAQliETU> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _tC3ha;
  OZOvvqDyixK8vCrBMu7(this.attachedDatabase, [this._tC3ha]);
  static const VerificationMeta _i3fUtv = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uaTpnqfZWu = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lQmbOu4rDfVMUum = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yVcXRLTiguLK1 = const VerificationMeta(
    'categoria',
  );
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wA12umMY = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mJO3rsTH2z = const VerificationMeta('activo');
  @override
  late final GeneratedColumn<String> activo = GeneratedColumn<String>(
    'activo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vyCcNW8gAY4kY = const VerificationMeta(
    'ubicacion',
  );
  @override
  late final GeneratedColumn<String> ubicacion = GeneratedColumn<String>(
    'ubicacion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sqoocUoIqcEfJ = const VerificationMeta(
    'creadoPor',
  );
  @override
  late final GeneratedColumn<String> creadoPor = GeneratedColumn<String>(
    'creado_por',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iiTDkg5DGX0i = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wdffLvd0vt = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _d7vceXBnC41xc8XI = const VerificationMeta(
    'glpiTicketId',
  );
  @override
  late final GeneratedColumn<String> glpiTicketId = GeneratedColumn<String>(
    'glpi_ticket_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ntN9VMMrghjv = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    titulo,
    descripcion,
    categoria,
    area,
    activo,
    ubicacion,
    creadoPor,
    creadoEn,
    estado,
    glpiTicketId,
    metadata,
  ];
  @override
  String get aliasedName => _tC3ha ?? actualTableName;
  @override
  String get actualTableName => mIrLS;
  static const String mIrLS = 'reportes_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<S3xRBVOlVfAQliETU> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_i3fUtv, id.isAcceptableOrUnknown(data['id']!, _i3fUtv));
    } else if (isInserting) {
      context.missing(_i3fUtv);
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _uaTpnqfZWu,
        titulo.isAcceptableOrUnknown(data['titulo']!, _uaTpnqfZWu),
      );
    } else if (isInserting) {
      context.missing(_uaTpnqfZWu);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _lQmbOu4rDfVMUum,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _lQmbOu4rDfVMUum,
        ),
      );
    } else if (isInserting) {
      context.missing(_lQmbOu4rDfVMUum);
    }
    if (data.containsKey('categoria')) {
      context.handle(
        _yVcXRLTiguLK1,
        categoria.isAcceptableOrUnknown(data['categoria']!, _yVcXRLTiguLK1),
      );
    } else if (isInserting) {
      context.missing(_yVcXRLTiguLK1);
    }
    if (data.containsKey('area')) {
      context.handle(
        _wA12umMY,
        area.isAcceptableOrUnknown(data['area']!, _wA12umMY),
      );
    } else if (isInserting) {
      context.missing(_wA12umMY);
    }
    if (data.containsKey('activo')) {
      context.handle(
        _mJO3rsTH2z,
        activo.isAcceptableOrUnknown(data['activo']!, _mJO3rsTH2z),
      );
    }
    if (data.containsKey('ubicacion')) {
      context.handle(
        _vyCcNW8gAY4kY,
        ubicacion.isAcceptableOrUnknown(data['ubicacion']!, _vyCcNW8gAY4kY),
      );
    }
    if (data.containsKey('creado_por')) {
      context.handle(
        _sqoocUoIqcEfJ,
        creadoPor.isAcceptableOrUnknown(data['creado_por']!, _sqoocUoIqcEfJ),
      );
    } else if (isInserting) {
      context.missing(_sqoocUoIqcEfJ);
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _iiTDkg5DGX0i,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _iiTDkg5DGX0i),
      );
    } else if (isInserting) {
      context.missing(_iiTDkg5DGX0i);
    }
    if (data.containsKey('estado')) {
      context.handle(
        _wdffLvd0vt,
        estado.isAcceptableOrUnknown(data['estado']!, _wdffLvd0vt),
      );
    } else if (isInserting) {
      context.missing(_wdffLvd0vt);
    }
    if (data.containsKey('glpi_ticket_id')) {
      context.handle(
        _d7vceXBnC41xc8XI,
        glpiTicketId.isAcceptableOrUnknown(
          data['glpi_ticket_id']!,
          _d7vceXBnC41xc8XI,
        ),
      );
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _ntN9VMMrghjv,
        metadata.isAcceptableOrUnknown(data['metadata']!, _ntN9VMMrghjv),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  S3xRBVOlVfAQliETU map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return S3xRBVOlVfAQliETU(
      nx: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      eSQzqp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      plaYFlFJCxg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      stjU9X1b0: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria'],
      )!,
      veGo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      )!,
      pqL3rx: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activo'],
      ),
      fxELBjh8A: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ubicacion'],
      ),
      kXOJWalAe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creado_por'],
      )!,
      xgkgTziM: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
      nTzX77: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      sQVQvBq0KXnz: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}glpi_ticket_id'],
      ),
      j7eK0cVO: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
    );
  }

  @override
  OZOvvqDyixK8vCrBMu7 createAlias(String alias) {
    return OZOvvqDyixK8vCrBMu7(attachedDatabase, alias);
  }
}

class S3xRBVOlVfAQliETU extends DataClass
    implements Insertable<S3xRBVOlVfAQliETU> {
  final String nx;
  final String eSQzqp;
  final String plaYFlFJCxg;
  final String stjU9X1b0;
  final String veGo;
  final String? pqL3rx;
  final String? fxELBjh8A;
  final String kXOJWalAe;
  final DateTime xgkgTziM;
  final String nTzX77;
  final String? sQVQvBq0KXnz;
  final String? j7eK0cVO;
  const S3xRBVOlVfAQliETU({
    required this.nx,
    required this.eSQzqp,
    required this.plaYFlFJCxg,
    required this.stjU9X1b0,
    required this.veGo,
    this.pqL3rx,
    this.fxELBjh8A,
    required this.kXOJWalAe,
    required this.xgkgTziM,
    required this.nTzX77,
    this.sQVQvBq0KXnz,
    this.j7eK0cVO,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(nx);
    map['titulo'] = Variable<String>(eSQzqp);
    map['descripcion'] = Variable<String>(plaYFlFJCxg);
    map['categoria'] = Variable<String>(stjU9X1b0);
    map['area'] = Variable<String>(veGo);
    if (!nullToAbsent || pqL3rx != null) {
      map['activo'] = Variable<String>(pqL3rx);
    }
    if (!nullToAbsent || fxELBjh8A != null) {
      map['ubicacion'] = Variable<String>(fxELBjh8A);
    }
    map['creado_por'] = Variable<String>(kXOJWalAe);
    map['creado_en'] = Variable<DateTime>(xgkgTziM);
    map['estado'] = Variable<String>(nTzX77);
    if (!nullToAbsent || sQVQvBq0KXnz != null) {
      map['glpi_ticket_id'] = Variable<String>(sQVQvBq0KXnz);
    }
    if (!nullToAbsent || j7eK0cVO != null) {
      map['metadata'] = Variable<String>(j7eK0cVO);
    }
    return map;
  }

  HX2XOaxsqSn5sDql3bDAkn iycvKcFTEuX(bool nullToAbsent) {
    return HX2XOaxsqSn5sDql3bDAkn(
      wv: Value(nx),
      fwUC6v: Value(eSQzqp),
      yQ3xXO7Rua8: Value(plaYFlFJCxg),
      bsWB13P0F: Value(stjU9X1b0),
      pAUt: Value(veGo),
      hqptn4: pqL3rx == null && nullToAbsent
          ? const Value.absent()
          : Value(pqL3rx),
      v4bMkOtju: fxELBjh8A == null && nullToAbsent
          ? const Value.absent()
          : Value(fxELBjh8A),
      r8Zq7Nq7S: Value(kXOJWalAe),
      kIW1poxd: Value(xgkgTziM),
      cgnYnB: Value(nTzX77),
      d6UYuTd488y5: sQVQvBq0KXnz == null && nullToAbsent
          ? const Value.absent()
          : Value(sQVQvBq0KXnz),
      leyqxQiP: j7eK0cVO == null && nullToAbsent
          ? const Value.absent()
          : Value(j7eK0cVO),
    );
  }

  factory S3xRBVOlVfAQliETU.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return S3xRBVOlVfAQliETU(
      nx: serializer.fromJson<String>(json['id']),
      eSQzqp: serializer.fromJson<String>(json['titulo']),
      plaYFlFJCxg: serializer.fromJson<String>(json['descripcion']),
      stjU9X1b0: serializer.fromJson<String>(json['categoria']),
      veGo: serializer.fromJson<String>(json['area']),
      pqL3rx: serializer.fromJson<String?>(json['activo']),
      fxELBjh8A: serializer.fromJson<String?>(json['ubicacion']),
      kXOJWalAe: serializer.fromJson<String>(json['creadoPor']),
      xgkgTziM: serializer.fromJson<DateTime>(json['creadoEn']),
      nTzX77: serializer.fromJson<String>(json['estado']),
      sQVQvBq0KXnz: serializer.fromJson<String?>(json['glpiTicketId']),
      j7eK0cVO: serializer.fromJson<String?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(nx),
      'titulo': serializer.toJson<String>(eSQzqp),
      'descripcion': serializer.toJson<String>(plaYFlFJCxg),
      'categoria': serializer.toJson<String>(stjU9X1b0),
      'area': serializer.toJson<String>(veGo),
      'activo': serializer.toJson<String?>(pqL3rx),
      'ubicacion': serializer.toJson<String?>(fxELBjh8A),
      'creadoPor': serializer.toJson<String>(kXOJWalAe),
      'creadoEn': serializer.toJson<DateTime>(xgkgTziM),
      'estado': serializer.toJson<String>(nTzX77),
      'glpiTicketId': serializer.toJson<String?>(sQVQvBq0KXnz),
      'metadata': serializer.toJson<String?>(j7eK0cVO),
    };
  }

  S3xRBVOlVfAQliETU f9XyNqfv({
    String? id,
    String? titulo,
    String? descripcion,
    String? categoria,
    String? area,
    Value<String?> activo = const Value.absent(),
    Value<String?> ubicacion = const Value.absent(),
    String? creadoPor,
    DateTime? creadoEn,
    String? estado,
    Value<String?> glpiTicketId = const Value.absent(),
    Value<String?> metadata = const Value.absent(),
  }) => S3xRBVOlVfAQliETU(
    nx: id ?? this.nx,
    eSQzqp: titulo ?? this.eSQzqp,
    plaYFlFJCxg: descripcion ?? this.plaYFlFJCxg,
    stjU9X1b0: categoria ?? this.stjU9X1b0,
    veGo: area ?? this.veGo,
    pqL3rx: activo.present ? activo.value : this.pqL3rx,
    fxELBjh8A: ubicacion.present ? ubicacion.value : this.fxELBjh8A,
    kXOJWalAe: creadoPor ?? this.kXOJWalAe,
    xgkgTziM: creadoEn ?? this.xgkgTziM,
    nTzX77: estado ?? this.nTzX77,
    sQVQvBq0KXnz: glpiTicketId.present ? glpiTicketId.value : this.sQVQvBq0KXnz,
    j7eK0cVO: metadata.present ? metadata.value : this.j7eK0cVO,
  );
  S3xRBVOlVfAQliETU ffj8LSco7uFRh5a2y(HX2XOaxsqSn5sDql3bDAkn data) {
    return S3xRBVOlVfAQliETU(
      nx: data.wv.present ? data.wv.value : this.nx,
      eSQzqp: data.fwUC6v.present ? data.fwUC6v.value : this.eSQzqp,
      plaYFlFJCxg: data.yQ3xXO7Rua8.present
          ? data.yQ3xXO7Rua8.value
          : this.plaYFlFJCxg,
      stjU9X1b0: data.bsWB13P0F.present ? data.bsWB13P0F.value : this.stjU9X1b0,
      veGo: data.pAUt.present ? data.pAUt.value : this.veGo,
      pqL3rx: data.hqptn4.present ? data.hqptn4.value : this.pqL3rx,
      fxELBjh8A: data.v4bMkOtju.present ? data.v4bMkOtju.value : this.fxELBjh8A,
      kXOJWalAe: data.r8Zq7Nq7S.present ? data.r8Zq7Nq7S.value : this.kXOJWalAe,
      xgkgTziM: data.kIW1poxd.present ? data.kIW1poxd.value : this.xgkgTziM,
      nTzX77: data.cgnYnB.present ? data.cgnYnB.value : this.nTzX77,
      sQVQvBq0KXnz: data.d6UYuTd488y5.present
          ? data.d6UYuTd488y5.value
          : this.sQVQvBq0KXnz,
      j7eK0cVO: data.leyqxQiP.present ? data.leyqxQiP.value : this.j7eK0cVO,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReportesTableData(')
          ..write('id: $nx, ')
          ..write('titulo: $eSQzqp, ')
          ..write('descripcion: $plaYFlFJCxg, ')
          ..write('categoria: $stjU9X1b0, ')
          ..write('area: $veGo, ')
          ..write('activo: $pqL3rx, ')
          ..write('ubicacion: $fxELBjh8A, ')
          ..write('creadoPor: $kXOJWalAe, ')
          ..write('creadoEn: $xgkgTziM, ')
          ..write('estado: $nTzX77, ')
          ..write('glpiTicketId: $sQVQvBq0KXnz, ')
          ..write('metadata: $j7eK0cVO')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    nx,
    eSQzqp,
    plaYFlFJCxg,
    stjU9X1b0,
    veGo,
    pqL3rx,
    fxELBjh8A,
    kXOJWalAe,
    xgkgTziM,
    nTzX77,
    sQVQvBq0KXnz,
    j7eK0cVO,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is S3xRBVOlVfAQliETU &&
          other.nx == this.nx &&
          other.eSQzqp == this.eSQzqp &&
          other.plaYFlFJCxg == this.plaYFlFJCxg &&
          other.stjU9X1b0 == this.stjU9X1b0 &&
          other.veGo == this.veGo &&
          other.pqL3rx == this.pqL3rx &&
          other.fxELBjh8A == this.fxELBjh8A &&
          other.kXOJWalAe == this.kXOJWalAe &&
          other.xgkgTziM == this.xgkgTziM &&
          other.nTzX77 == this.nTzX77 &&
          other.sQVQvBq0KXnz == this.sQVQvBq0KXnz &&
          other.j7eK0cVO == this.j7eK0cVO);
}

class HX2XOaxsqSn5sDql3bDAkn extends UpdateCompanion<S3xRBVOlVfAQliETU> {
  final Value<String> wv;
  final Value<String> fwUC6v;
  final Value<String> yQ3xXO7Rua8;
  final Value<String> bsWB13P0F;
  final Value<String> pAUt;
  final Value<String?> hqptn4;
  final Value<String?> v4bMkOtju;
  final Value<String> r8Zq7Nq7S;
  final Value<DateTime> kIW1poxd;
  final Value<String> cgnYnB;
  final Value<String?> d6UYuTd488y5;
  final Value<String?> leyqxQiP;
  final Value<int> cGghm;
  const HX2XOaxsqSn5sDql3bDAkn({
    this.wv = const Value.absent(),
    this.fwUC6v = const Value.absent(),
    this.yQ3xXO7Rua8 = const Value.absent(),
    this.bsWB13P0F = const Value.absent(),
    this.pAUt = const Value.absent(),
    this.hqptn4 = const Value.absent(),
    this.v4bMkOtju = const Value.absent(),
    this.r8Zq7Nq7S = const Value.absent(),
    this.kIW1poxd = const Value.absent(),
    this.cgnYnB = const Value.absent(),
    this.d6UYuTd488y5 = const Value.absent(),
    this.leyqxQiP = const Value.absent(),
    this.cGghm = const Value.absent(),
  });
  HX2XOaxsqSn5sDql3bDAkn.insert({
    required String id,
    required String titulo,
    required String descripcion,
    required String categoria,
    required String area,
    this.hqptn4 = const Value.absent(),
    this.v4bMkOtju = const Value.absent(),
    required String creadoPor,
    required DateTime creadoEn,
    required String estado,
    this.d6UYuTd488y5 = const Value.absent(),
    this.leyqxQiP = const Value.absent(),
    this.cGghm = const Value.absent(),
  }) : wv = Value(id),
       fwUC6v = Value(titulo),
       yQ3xXO7Rua8 = Value(descripcion),
       bsWB13P0F = Value(categoria),
       pAUt = Value(area),
       r8Zq7Nq7S = Value(creadoPor),
       kIW1poxd = Value(creadoEn),
       cgnYnB = Value(estado);
  static Insertable<S3xRBVOlVfAQliETU> hv0lId({
    Expression<String>? id,
    Expression<String>? titulo,
    Expression<String>? descripcion,
    Expression<String>? categoria,
    Expression<String>? area,
    Expression<String>? activo,
    Expression<String>? ubicacion,
    Expression<String>? creadoPor,
    Expression<DateTime>? creadoEn,
    Expression<String>? estado,
    Expression<String>? glpiTicketId,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titulo != null) 'titulo': titulo,
      if (descripcion != null) 'descripcion': descripcion,
      if (categoria != null) 'categoria': categoria,
      if (area != null) 'area': area,
      if (activo != null) 'activo': activo,
      if (ubicacion != null) 'ubicacion': ubicacion,
      if (creadoPor != null) 'creado_por': creadoPor,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (estado != null) 'estado': estado,
      if (glpiTicketId != null) 'glpi_ticket_id': glpiTicketId,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HX2XOaxsqSn5sDql3bDAkn hXosAHt9({
    Value<String>? id,
    Value<String>? titulo,
    Value<String>? descripcion,
    Value<String>? categoria,
    Value<String>? area,
    Value<String?>? activo,
    Value<String?>? ubicacion,
    Value<String>? creadoPor,
    Value<DateTime>? creadoEn,
    Value<String>? estado,
    Value<String?>? glpiTicketId,
    Value<String?>? metadata,
    Value<int>? rowid,
  }) {
    return HX2XOaxsqSn5sDql3bDAkn(
      wv: id ?? this.wv,
      fwUC6v: titulo ?? this.fwUC6v,
      yQ3xXO7Rua8: descripcion ?? this.yQ3xXO7Rua8,
      bsWB13P0F: categoria ?? this.bsWB13P0F,
      pAUt: area ?? this.pAUt,
      hqptn4: activo ?? this.hqptn4,
      v4bMkOtju: ubicacion ?? this.v4bMkOtju,
      r8Zq7Nq7S: creadoPor ?? this.r8Zq7Nq7S,
      kIW1poxd: creadoEn ?? this.kIW1poxd,
      cgnYnB: estado ?? this.cgnYnB,
      d6UYuTd488y5: glpiTicketId ?? this.d6UYuTd488y5,
      leyqxQiP: metadata ?? this.leyqxQiP,
      cGghm: rowid ?? this.cGghm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wv.present) {
      map['id'] = Variable<String>(wv.value);
    }
    if (fwUC6v.present) {
      map['titulo'] = Variable<String>(fwUC6v.value);
    }
    if (yQ3xXO7Rua8.present) {
      map['descripcion'] = Variable<String>(yQ3xXO7Rua8.value);
    }
    if (bsWB13P0F.present) {
      map['categoria'] = Variable<String>(bsWB13P0F.value);
    }
    if (pAUt.present) {
      map['area'] = Variable<String>(pAUt.value);
    }
    if (hqptn4.present) {
      map['activo'] = Variable<String>(hqptn4.value);
    }
    if (v4bMkOtju.present) {
      map['ubicacion'] = Variable<String>(v4bMkOtju.value);
    }
    if (r8Zq7Nq7S.present) {
      map['creado_por'] = Variable<String>(r8Zq7Nq7S.value);
    }
    if (kIW1poxd.present) {
      map['creado_en'] = Variable<DateTime>(kIW1poxd.value);
    }
    if (cgnYnB.present) {
      map['estado'] = Variable<String>(cgnYnB.value);
    }
    if (d6UYuTd488y5.present) {
      map['glpi_ticket_id'] = Variable<String>(d6UYuTd488y5.value);
    }
    if (leyqxQiP.present) {
      map['metadata'] = Variable<String>(leyqxQiP.value);
    }
    if (cGghm.present) {
      map['rowid'] = Variable<int>(cGghm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportesTableCompanion(')
          ..write('id: $wv, ')
          ..write('titulo: $fwUC6v, ')
          ..write('descripcion: $yQ3xXO7Rua8, ')
          ..write('categoria: $bsWB13P0F, ')
          ..write('area: $pAUt, ')
          ..write('activo: $hqptn4, ')
          ..write('ubicacion: $v4bMkOtju, ')
          ..write('creadoPor: $r8Zq7Nq7S, ')
          ..write('creadoEn: $kIW1poxd, ')
          ..write('estado: $cgnYnB, ')
          ..write('glpiTicketId: $d6UYuTd488y5, ')
          ..write('metadata: $leyqxQiP, ')
          ..write('rowid: $cGghm')
          ..write(')'))
        .toString();
  }
}

class BoBcnkhdbLdMOgKtsin3TNgWX7CJA extends ReporteComentariosTable
    with TableInfo<BoBcnkhdbLdMOgKtsin3TNgWX7CJA, ARpUcXEcU4toxru8LMyBl7DV8Cd> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _qyaoV;
  BoBcnkhdbLdMOgKtsin3TNgWX7CJA(this.attachedDatabase, [this._qyaoV]);
  static const VerificationMeta _kolfjx = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lwj7tBMB5vdNl = const VerificationMeta(
    'reporteId',
  );
  @override
  late final GeneratedColumn<String> reporteId = GeneratedColumn<String>(
    'reporte_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eFvu2Ftd5yy = const VerificationMeta(
    'autorId',
  );
  @override
  late final GeneratedColumn<String> autorId = GeneratedColumn<String>(
    'autor_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _zlQPsEuLUMr = const VerificationMeta(
    'mensaje',
  );
  @override
  late final GeneratedColumn<String> mensaje = GeneratedColumn<String>(
    'mensaje',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nWL2Kh4RggTO = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reporteId,
    autorId,
    mensaje,
    creadoEn,
  ];
  @override
  String get aliasedName => _qyaoV ?? actualTableName;
  @override
  String get actualTableName => b8oXv;
  static const String b8oXv = 'reporte_comentarios_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ARpUcXEcU4toxru8LMyBl7DV8Cd> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_kolfjx, id.isAcceptableOrUnknown(data['id']!, _kolfjx));
    } else if (isInserting) {
      context.missing(_kolfjx);
    }
    if (data.containsKey('reporte_id')) {
      context.handle(
        _lwj7tBMB5vdNl,
        reporteId.isAcceptableOrUnknown(data['reporte_id']!, _lwj7tBMB5vdNl),
      );
    } else if (isInserting) {
      context.missing(_lwj7tBMB5vdNl);
    }
    if (data.containsKey('autor_id')) {
      context.handle(
        _eFvu2Ftd5yy,
        autorId.isAcceptableOrUnknown(data['autor_id']!, _eFvu2Ftd5yy),
      );
    } else if (isInserting) {
      context.missing(_eFvu2Ftd5yy);
    }
    if (data.containsKey('mensaje')) {
      context.handle(
        _zlQPsEuLUMr,
        mensaje.isAcceptableOrUnknown(data['mensaje']!, _zlQPsEuLUMr),
      );
    } else if (isInserting) {
      context.missing(_zlQPsEuLUMr);
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _nWL2Kh4RggTO,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _nWL2Kh4RggTO),
      );
    } else if (isInserting) {
      context.missing(_nWL2Kh4RggTO);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ARpUcXEcU4toxru8LMyBl7DV8Cd map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ARpUcXEcU4toxru8LMyBl7DV8Cd(
      l1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      aSQn8lD1x: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reporte_id'],
      )!,
      p7ebMBe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}autor_id'],
      )!,
      a3tNLNJ: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mensaje'],
      )!,
      lILfrcKI: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  BoBcnkhdbLdMOgKtsin3TNgWX7CJA createAlias(String alias) {
    return BoBcnkhdbLdMOgKtsin3TNgWX7CJA(attachedDatabase, alias);
  }
}

class ARpUcXEcU4toxru8LMyBl7DV8Cd extends DataClass
    implements Insertable<ARpUcXEcU4toxru8LMyBl7DV8Cd> {
  final String l1;
  final String aSQn8lD1x;
  final String p7ebMBe;
  final String a3tNLNJ;
  final DateTime lILfrcKI;
  const ARpUcXEcU4toxru8LMyBl7DV8Cd({
    required this.l1,
    required this.aSQn8lD1x,
    required this.p7ebMBe,
    required this.a3tNLNJ,
    required this.lILfrcKI,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(l1);
    map['reporte_id'] = Variable<String>(aSQn8lD1x);
    map['autor_id'] = Variable<String>(p7ebMBe);
    map['mensaje'] = Variable<String>(a3tNLNJ);
    map['creado_en'] = Variable<DateTime>(lILfrcKI);
    return map;
  }

  MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB ciSD2AEfHP5(bool nullToAbsent) {
    return MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB(
      vH: Value(l1),
      fWiwTihJ5: Value(aSQn8lD1x),
      peeUJ61: Value(p7ebMBe),
      rgBeY5W: Value(a3tNLNJ),
      pWlpsCw4: Value(lILfrcKI),
    );
  }

  factory ARpUcXEcU4toxru8LMyBl7DV8Cd.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ARpUcXEcU4toxru8LMyBl7DV8Cd(
      l1: serializer.fromJson<String>(json['id']),
      aSQn8lD1x: serializer.fromJson<String>(json['reporteId']),
      p7ebMBe: serializer.fromJson<String>(json['autorId']),
      a3tNLNJ: serializer.fromJson<String>(json['mensaje']),
      lILfrcKI: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(l1),
      'reporteId': serializer.toJson<String>(aSQn8lD1x),
      'autorId': serializer.toJson<String>(p7ebMBe),
      'mensaje': serializer.toJson<String>(a3tNLNJ),
      'creadoEn': serializer.toJson<DateTime>(lILfrcKI),
    };
  }

  ARpUcXEcU4toxru8LMyBl7DV8Cd bocs9vpG({
    String? id,
    String? reporteId,
    String? autorId,
    String? mensaje,
    DateTime? creadoEn,
  }) => ARpUcXEcU4toxru8LMyBl7DV8Cd(
    l1: id ?? this.l1,
    aSQn8lD1x: reporteId ?? this.aSQn8lD1x,
    p7ebMBe: autorId ?? this.p7ebMBe,
    a3tNLNJ: mensaje ?? this.a3tNLNJ,
    lILfrcKI: creadoEn ?? this.lILfrcKI,
  );
  ARpUcXEcU4toxru8LMyBl7DV8Cd sCilnkVXWwmaN9vkv(
    MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB data,
  ) {
    return ARpUcXEcU4toxru8LMyBl7DV8Cd(
      l1: data.vH.present ? data.vH.value : this.l1,
      aSQn8lD1x: data.fWiwTihJ5.present ? data.fWiwTihJ5.value : this.aSQn8lD1x,
      p7ebMBe: data.peeUJ61.present ? data.peeUJ61.value : this.p7ebMBe,
      a3tNLNJ: data.rgBeY5W.present ? data.rgBeY5W.value : this.a3tNLNJ,
      lILfrcKI: data.pWlpsCw4.present ? data.pWlpsCw4.value : this.lILfrcKI,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReporteComentariosTableData(')
          ..write('id: $l1, ')
          ..write('reporteId: $aSQn8lD1x, ')
          ..write('autorId: $p7ebMBe, ')
          ..write('mensaje: $a3tNLNJ, ')
          ..write('creadoEn: $lILfrcKI')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(l1, aSQn8lD1x, p7ebMBe, a3tNLNJ, lILfrcKI);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ARpUcXEcU4toxru8LMyBl7DV8Cd &&
          other.l1 == this.l1 &&
          other.aSQn8lD1x == this.aSQn8lD1x &&
          other.p7ebMBe == this.p7ebMBe &&
          other.a3tNLNJ == this.a3tNLNJ &&
          other.lILfrcKI == this.lILfrcKI);
}

class MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB
    extends UpdateCompanion<ARpUcXEcU4toxru8LMyBl7DV8Cd> {
  final Value<String> vH;
  final Value<String> fWiwTihJ5;
  final Value<String> peeUJ61;
  final Value<String> rgBeY5W;
  final Value<DateTime> pWlpsCw4;
  final Value<int> rL8KS;
  const MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB({
    this.vH = const Value.absent(),
    this.fWiwTihJ5 = const Value.absent(),
    this.peeUJ61 = const Value.absent(),
    this.rgBeY5W = const Value.absent(),
    this.pWlpsCw4 = const Value.absent(),
    this.rL8KS = const Value.absent(),
  });
  MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB.insert({
    required String id,
    required String reporteId,
    required String autorId,
    required String mensaje,
    required DateTime creadoEn,
    this.rL8KS = const Value.absent(),
  }) : vH = Value(id),
       fWiwTihJ5 = Value(reporteId),
       peeUJ61 = Value(autorId),
       rgBeY5W = Value(mensaje),
       pWlpsCw4 = Value(creadoEn);
  static Insertable<ARpUcXEcU4toxru8LMyBl7DV8Cd> jigiVx({
    Expression<String>? id,
    Expression<String>? reporteId,
    Expression<String>? autorId,
    Expression<String>? mensaje,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reporteId != null) 'reporte_id': reporteId,
      if (autorId != null) 'autor_id': autorId,
      if (mensaje != null) 'mensaje': mensaje,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB gsnOSHml({
    Value<String>? id,
    Value<String>? reporteId,
    Value<String>? autorId,
    Value<String>? mensaje,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB(
      vH: id ?? this.vH,
      fWiwTihJ5: reporteId ?? this.fWiwTihJ5,
      peeUJ61: autorId ?? this.peeUJ61,
      rgBeY5W: mensaje ?? this.rgBeY5W,
      pWlpsCw4: creadoEn ?? this.pWlpsCw4,
      rL8KS: rowid ?? this.rL8KS,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (vH.present) {
      map['id'] = Variable<String>(vH.value);
    }
    if (fWiwTihJ5.present) {
      map['reporte_id'] = Variable<String>(fWiwTihJ5.value);
    }
    if (peeUJ61.present) {
      map['autor_id'] = Variable<String>(peeUJ61.value);
    }
    if (rgBeY5W.present) {
      map['mensaje'] = Variable<String>(rgBeY5W.value);
    }
    if (pWlpsCw4.present) {
      map['creado_en'] = Variable<DateTime>(pWlpsCw4.value);
    }
    if (rL8KS.present) {
      map['rowid'] = Variable<int>(rL8KS.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReporteComentariosTableCompanion(')
          ..write('id: $vH, ')
          ..write('reporteId: $fWiwTihJ5, ')
          ..write('autorId: $peeUJ61, ')
          ..write('mensaje: $rgBeY5W, ')
          ..write('creadoEn: $pWlpsCw4, ')
          ..write('rowid: $rL8KS')
          ..write(')'))
        .toString();
  }
}

class YoNU9Kgod2bozlWwHlObWuuh62Da extends ReporteEvidenciasTable
    with TableInfo<YoNU9Kgod2bozlWwHlObWuuh62Da, MqgZIJIZuGbeC3uaGFcCBQmY7J> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _c51QX;
  YoNU9Kgod2bozlWwHlObWuuh62Da(this.attachedDatabase, [this._c51QX]);
  static const VerificationMeta _oe1aSw = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _l82Y3Ph7MlPH0 = const VerificationMeta(
    'reporteId',
  );
  @override
  late final GeneratedColumn<String> reporteId = GeneratedColumn<String>(
    'reporte_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nC0DDLX3 = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dXQCt1Attq = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jp5BD1FpWN7DF = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hrU6DGiET8dJ7 = const VerificationMeta(
    'remoteUrl',
  );
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
    'remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lecsna93RuR3 = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reporteId,
    tipo,
    nombre,
    localPath,
    remoteUrl,
    creadoEn,
  ];
  @override
  String get aliasedName => _c51QX ?? actualTableName;
  @override
  String get actualTableName => h68Ow;
  static const String h68Ow = 'reporte_evidencias_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MqgZIJIZuGbeC3uaGFcCBQmY7J> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_oe1aSw, id.isAcceptableOrUnknown(data['id']!, _oe1aSw));
    } else if (isInserting) {
      context.missing(_oe1aSw);
    }
    if (data.containsKey('reporte_id')) {
      context.handle(
        _l82Y3Ph7MlPH0,
        reporteId.isAcceptableOrUnknown(data['reporte_id']!, _l82Y3Ph7MlPH0),
      );
    } else if (isInserting) {
      context.missing(_l82Y3Ph7MlPH0);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _nC0DDLX3,
        tipo.isAcceptableOrUnknown(data['tipo']!, _nC0DDLX3),
      );
    } else if (isInserting) {
      context.missing(_nC0DDLX3);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _dXQCt1Attq,
        nombre.isAcceptableOrUnknown(data['nombre']!, _dXQCt1Attq),
      );
    } else if (isInserting) {
      context.missing(_dXQCt1Attq);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _jp5BD1FpWN7DF,
        localPath.isAcceptableOrUnknown(data['local_path']!, _jp5BD1FpWN7DF),
      );
    } else if (isInserting) {
      context.missing(_jp5BD1FpWN7DF);
    }
    if (data.containsKey('remote_url')) {
      context.handle(
        _hrU6DGiET8dJ7,
        remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _hrU6DGiET8dJ7),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _lecsna93RuR3,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _lecsna93RuR3),
      );
    } else if (isInserting) {
      context.missing(_lecsna93RuR3);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MqgZIJIZuGbeC3uaGFcCBQmY7J map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MqgZIJIZuGbeC3uaGFcCBQmY7J(
      aU: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      k0zETwpTK: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reporte_id'],
      )!,
      bTBb: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      nPdQ1y: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      qIgsNXgNr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      aFAL0xL46: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_url'],
      ),
      b2oRoMaV: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  YoNU9Kgod2bozlWwHlObWuuh62Da createAlias(String alias) {
    return YoNU9Kgod2bozlWwHlObWuuh62Da(attachedDatabase, alias);
  }
}

class MqgZIJIZuGbeC3uaGFcCBQmY7J extends DataClass
    implements Insertable<MqgZIJIZuGbeC3uaGFcCBQmY7J> {
  final String aU;
  final String k0zETwpTK;
  final String bTBb;
  final String nPdQ1y;
  final String qIgsNXgNr;
  final String? aFAL0xL46;
  final DateTime b2oRoMaV;
  const MqgZIJIZuGbeC3uaGFcCBQmY7J({
    required this.aU,
    required this.k0zETwpTK,
    required this.bTBb,
    required this.nPdQ1y,
    required this.qIgsNXgNr,
    this.aFAL0xL46,
    required this.b2oRoMaV,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(aU);
    map['reporte_id'] = Variable<String>(k0zETwpTK);
    map['tipo'] = Variable<String>(bTBb);
    map['nombre'] = Variable<String>(nPdQ1y);
    map['local_path'] = Variable<String>(qIgsNXgNr);
    if (!nullToAbsent || aFAL0xL46 != null) {
      map['remote_url'] = Variable<String>(aFAL0xL46);
    }
    map['creado_en'] = Variable<DateTime>(b2oRoMaV);
    return map;
  }

  Klv2WHU2z0Dg16Wk503cIncsPIiGTGI qZVKxt6kTaQ(bool nullToAbsent) {
    return Klv2WHU2z0Dg16Wk503cIncsPIiGTGI(
      sU: Value(aU),
      bY6ZOF0uo: Value(k0zETwpTK),
      qS2I: Value(bTBb),
      p7B4JY: Value(nPdQ1y),
      cOvZFXOUU: Value(qIgsNXgNr),
      v8hFsLNip: aFAL0xL46 == null && nullToAbsent
          ? const Value.absent()
          : Value(aFAL0xL46),
      wFJWeFsv: Value(b2oRoMaV),
    );
  }

  factory MqgZIJIZuGbeC3uaGFcCBQmY7J.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MqgZIJIZuGbeC3uaGFcCBQmY7J(
      aU: serializer.fromJson<String>(json['id']),
      k0zETwpTK: serializer.fromJson<String>(json['reporteId']),
      bTBb: serializer.fromJson<String>(json['tipo']),
      nPdQ1y: serializer.fromJson<String>(json['nombre']),
      qIgsNXgNr: serializer.fromJson<String>(json['localPath']),
      aFAL0xL46: serializer.fromJson<String?>(json['remoteUrl']),
      b2oRoMaV: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(aU),
      'reporteId': serializer.toJson<String>(k0zETwpTK),
      'tipo': serializer.toJson<String>(bTBb),
      'nombre': serializer.toJson<String>(nPdQ1y),
      'localPath': serializer.toJson<String>(qIgsNXgNr),
      'remoteUrl': serializer.toJson<String?>(aFAL0xL46),
      'creadoEn': serializer.toJson<DateTime>(b2oRoMaV),
    };
  }

  MqgZIJIZuGbeC3uaGFcCBQmY7J jFfRnvrD({
    String? id,
    String? reporteId,
    String? tipo,
    String? nombre,
    String? localPath,
    Value<String?> remoteUrl = const Value.absent(),
    DateTime? creadoEn,
  }) => MqgZIJIZuGbeC3uaGFcCBQmY7J(
    aU: id ?? this.aU,
    k0zETwpTK: reporteId ?? this.k0zETwpTK,
    bTBb: tipo ?? this.bTBb,
    nPdQ1y: nombre ?? this.nPdQ1y,
    qIgsNXgNr: localPath ?? this.qIgsNXgNr,
    aFAL0xL46: remoteUrl.present ? remoteUrl.value : this.aFAL0xL46,
    b2oRoMaV: creadoEn ?? this.b2oRoMaV,
  );
  MqgZIJIZuGbeC3uaGFcCBQmY7J vSJ7N1eMX0bMPmn5N(
    Klv2WHU2z0Dg16Wk503cIncsPIiGTGI data,
  ) {
    return MqgZIJIZuGbeC3uaGFcCBQmY7J(
      aU: data.sU.present ? data.sU.value : this.aU,
      k0zETwpTK: data.bY6ZOF0uo.present ? data.bY6ZOF0uo.value : this.k0zETwpTK,
      bTBb: data.qS2I.present ? data.qS2I.value : this.bTBb,
      nPdQ1y: data.p7B4JY.present ? data.p7B4JY.value : this.nPdQ1y,
      qIgsNXgNr: data.cOvZFXOUU.present ? data.cOvZFXOUU.value : this.qIgsNXgNr,
      aFAL0xL46: data.v8hFsLNip.present ? data.v8hFsLNip.value : this.aFAL0xL46,
      b2oRoMaV: data.wFJWeFsv.present ? data.wFJWeFsv.value : this.b2oRoMaV,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReporteEvidenciasTableData(')
          ..write('id: $aU, ')
          ..write('reporteId: $k0zETwpTK, ')
          ..write('tipo: $bTBb, ')
          ..write('nombre: $nPdQ1y, ')
          ..write('localPath: $qIgsNXgNr, ')
          ..write('remoteUrl: $aFAL0xL46, ')
          ..write('creadoEn: $b2oRoMaV')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(aU, k0zETwpTK, bTBb, nPdQ1y, qIgsNXgNr, aFAL0xL46, b2oRoMaV);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MqgZIJIZuGbeC3uaGFcCBQmY7J &&
          other.aU == this.aU &&
          other.k0zETwpTK == this.k0zETwpTK &&
          other.bTBb == this.bTBb &&
          other.nPdQ1y == this.nPdQ1y &&
          other.qIgsNXgNr == this.qIgsNXgNr &&
          other.aFAL0xL46 == this.aFAL0xL46 &&
          other.b2oRoMaV == this.b2oRoMaV);
}

class Klv2WHU2z0Dg16Wk503cIncsPIiGTGI
    extends UpdateCompanion<MqgZIJIZuGbeC3uaGFcCBQmY7J> {
  final Value<String> sU;
  final Value<String> bY6ZOF0uo;
  final Value<String> qS2I;
  final Value<String> p7B4JY;
  final Value<String> cOvZFXOUU;
  final Value<String?> v8hFsLNip;
  final Value<DateTime> wFJWeFsv;
  final Value<int> nZy2D;
  const Klv2WHU2z0Dg16Wk503cIncsPIiGTGI({
    this.sU = const Value.absent(),
    this.bY6ZOF0uo = const Value.absent(),
    this.qS2I = const Value.absent(),
    this.p7B4JY = const Value.absent(),
    this.cOvZFXOUU = const Value.absent(),
    this.v8hFsLNip = const Value.absent(),
    this.wFJWeFsv = const Value.absent(),
    this.nZy2D = const Value.absent(),
  });
  Klv2WHU2z0Dg16Wk503cIncsPIiGTGI.insert({
    required String id,
    required String reporteId,
    required String tipo,
    required String nombre,
    required String localPath,
    this.v8hFsLNip = const Value.absent(),
    required DateTime creadoEn,
    this.nZy2D = const Value.absent(),
  }) : sU = Value(id),
       bY6ZOF0uo = Value(reporteId),
       qS2I = Value(tipo),
       p7B4JY = Value(nombre),
       cOvZFXOUU = Value(localPath),
       wFJWeFsv = Value(creadoEn);
  static Insertable<MqgZIJIZuGbeC3uaGFcCBQmY7J> jAUN3L({
    Expression<String>? id,
    Expression<String>? reporteId,
    Expression<String>? tipo,
    Expression<String>? nombre,
    Expression<String>? localPath,
    Expression<String>? remoteUrl,
    Expression<DateTime>? creadoEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reporteId != null) 'reporte_id': reporteId,
      if (tipo != null) 'tipo': tipo,
      if (nombre != null) 'nombre': nombre,
      if (localPath != null) 'local_path': localPath,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  Klv2WHU2z0Dg16Wk503cIncsPIiGTGI nDTHTBUf({
    Value<String>? id,
    Value<String>? reporteId,
    Value<String>? tipo,
    Value<String>? nombre,
    Value<String>? localPath,
    Value<String?>? remoteUrl,
    Value<DateTime>? creadoEn,
    Value<int>? rowid,
  }) {
    return Klv2WHU2z0Dg16Wk503cIncsPIiGTGI(
      sU: id ?? this.sU,
      bY6ZOF0uo: reporteId ?? this.bY6ZOF0uo,
      qS2I: tipo ?? this.qS2I,
      p7B4JY: nombre ?? this.p7B4JY,
      cOvZFXOUU: localPath ?? this.cOvZFXOUU,
      v8hFsLNip: remoteUrl ?? this.v8hFsLNip,
      wFJWeFsv: creadoEn ?? this.wFJWeFsv,
      nZy2D: rowid ?? this.nZy2D,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sU.present) {
      map['id'] = Variable<String>(sU.value);
    }
    if (bY6ZOF0uo.present) {
      map['reporte_id'] = Variable<String>(bY6ZOF0uo.value);
    }
    if (qS2I.present) {
      map['tipo'] = Variable<String>(qS2I.value);
    }
    if (p7B4JY.present) {
      map['nombre'] = Variable<String>(p7B4JY.value);
    }
    if (cOvZFXOUU.present) {
      map['local_path'] = Variable<String>(cOvZFXOUU.value);
    }
    if (v8hFsLNip.present) {
      map['remote_url'] = Variable<String>(v8hFsLNip.value);
    }
    if (wFJWeFsv.present) {
      map['creado_en'] = Variable<DateTime>(wFJWeFsv.value);
    }
    if (nZy2D.present) {
      map['rowid'] = Variable<int>(nZy2D.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReporteEvidenciasTableCompanion(')
          ..write('id: $sU, ')
          ..write('reporteId: $bY6ZOF0uo, ')
          ..write('tipo: $qS2I, ')
          ..write('nombre: $p7B4JY, ')
          ..write('localPath: $cOvZFXOUU, ')
          ..write('remoteUrl: $v8hFsLNip, ')
          ..write('creadoEn: $wFJWeFsv, ')
          ..write('rowid: $nZy2D')
          ..write(')'))
        .toString();
  }
}

class SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp extends ReporteParticipantesTable
    with
        TableInfo<
          SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
          IKHFzRDpgFzjhWij3nsPu1GdzStvW
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _lMOaw;
  SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp(this.attachedDatabase, [this._lMOaw]);
  static const VerificationMeta _jI1EFwzpftEKd = const VerificationMeta(
    'reporteId',
  );
  @override
  late final GeneratedColumn<String> reporteId = GeneratedColumn<String>(
    'reporte_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iCfCpzMfSw = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _q0uuehd = const VerificationMeta('rol');
  @override
  late final GeneratedColumn<String> rol = GeneratedColumn<String>(
    'rol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [reporteId, userId, rol];
  @override
  String get aliasedName => _lMOaw ?? actualTableName;
  @override
  String get actualTableName => xe8Z2;
  static const String xe8Z2 = 'reporte_participantes_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<IKHFzRDpgFzjhWij3nsPu1GdzStvW> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('reporte_id')) {
      context.handle(
        _jI1EFwzpftEKd,
        reporteId.isAcceptableOrUnknown(data['reporte_id']!, _jI1EFwzpftEKd),
      );
    } else if (isInserting) {
      context.missing(_jI1EFwzpftEKd);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _iCfCpzMfSw,
        userId.isAcceptableOrUnknown(data['user_id']!, _iCfCpzMfSw),
      );
    } else if (isInserting) {
      context.missing(_iCfCpzMfSw);
    }
    if (data.containsKey('rol')) {
      context.handle(
        _q0uuehd,
        rol.isAcceptableOrUnknown(data['rol']!, _q0uuehd),
      );
    } else if (isInserting) {
      context.missing(_q0uuehd);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reporteId, userId};
  @override
  IKHFzRDpgFzjhWij3nsPu1GdzStvW map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IKHFzRDpgFzjhWij3nsPu1GdzStvW(
      qQkHzyZ0J: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reporte_id'],
      )!,
      ziKzbT: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      xQP: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rol'],
      )!,
    );
  }

  @override
  SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp createAlias(String alias) {
    return SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp(attachedDatabase, alias);
  }
}

class IKHFzRDpgFzjhWij3nsPu1GdzStvW extends DataClass
    implements Insertable<IKHFzRDpgFzjhWij3nsPu1GdzStvW> {
  final String qQkHzyZ0J;
  final String ziKzbT;
  final String xQP;
  const IKHFzRDpgFzjhWij3nsPu1GdzStvW({
    required this.qQkHzyZ0J,
    required this.ziKzbT,
    required this.xQP,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reporte_id'] = Variable<String>(qQkHzyZ0J);
    map['user_id'] = Variable<String>(ziKzbT);
    map['rol'] = Variable<String>(xQP);
    return map;
  }

  T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU xQiGhXmj8u4(bool nullToAbsent) {
    return T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU(
      c7fchPBLA: Value(qQkHzyZ0J),
      bokW9m: Value(ziKzbT),
      mIv: Value(xQP),
    );
  }

  factory IKHFzRDpgFzjhWij3nsPu1GdzStvW.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IKHFzRDpgFzjhWij3nsPu1GdzStvW(
      qQkHzyZ0J: serializer.fromJson<String>(json['reporteId']),
      ziKzbT: serializer.fromJson<String>(json['userId']),
      xQP: serializer.fromJson<String>(json['rol']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reporteId': serializer.toJson<String>(qQkHzyZ0J),
      'userId': serializer.toJson<String>(ziKzbT),
      'rol': serializer.toJson<String>(xQP),
    };
  }

  IKHFzRDpgFzjhWij3nsPu1GdzStvW eVjGEnwq({
    String? reporteId,
    String? userId,
    String? rol,
  }) => IKHFzRDpgFzjhWij3nsPu1GdzStvW(
    qQkHzyZ0J: reporteId ?? this.qQkHzyZ0J,
    ziKzbT: userId ?? this.ziKzbT,
    xQP: rol ?? this.xQP,
  );
  IKHFzRDpgFzjhWij3nsPu1GdzStvW jyZlNzlaR6sdbCBgG(
    T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU data,
  ) {
    return IKHFzRDpgFzjhWij3nsPu1GdzStvW(
      qQkHzyZ0J: data.c7fchPBLA.present ? data.c7fchPBLA.value : this.qQkHzyZ0J,
      ziKzbT: data.bokW9m.present ? data.bokW9m.value : this.ziKzbT,
      xQP: data.mIv.present ? data.mIv.value : this.xQP,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReporteParticipantesTableData(')
          ..write('reporteId: $qQkHzyZ0J, ')
          ..write('userId: $ziKzbT, ')
          ..write('rol: $xQP')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(qQkHzyZ0J, ziKzbT, xQP);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IKHFzRDpgFzjhWij3nsPu1GdzStvW &&
          other.qQkHzyZ0J == this.qQkHzyZ0J &&
          other.ziKzbT == this.ziKzbT &&
          other.xQP == this.xQP);
}

class T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU
    extends UpdateCompanion<IKHFzRDpgFzjhWij3nsPu1GdzStvW> {
  final Value<String> c7fchPBLA;
  final Value<String> bokW9m;
  final Value<String> mIv;
  final Value<int> eQbrO;
  const T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU({
    this.c7fchPBLA = const Value.absent(),
    this.bokW9m = const Value.absent(),
    this.mIv = const Value.absent(),
    this.eQbrO = const Value.absent(),
  });
  T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU.insert({
    required String reporteId,
    required String userId,
    required String rol,
    this.eQbrO = const Value.absent(),
  }) : c7fchPBLA = Value(reporteId),
       bokW9m = Value(userId),
       mIv = Value(rol);
  static Insertable<IKHFzRDpgFzjhWij3nsPu1GdzStvW> bkDjCD({
    Expression<String>? reporteId,
    Expression<String>? userId,
    Expression<String>? rol,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (reporteId != null) 'reporte_id': reporteId,
      if (userId != null) 'user_id': userId,
      if (rol != null) 'rol': rol,
      if (rowid != null) 'rowid': rowid,
    });
  }

  T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU njCajdkb({
    Value<String>? reporteId,
    Value<String>? userId,
    Value<String>? rol,
    Value<int>? rowid,
  }) {
    return T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU(
      c7fchPBLA: reporteId ?? this.c7fchPBLA,
      bokW9m: userId ?? this.bokW9m,
      mIv: rol ?? this.mIv,
      eQbrO: rowid ?? this.eQbrO,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (c7fchPBLA.present) {
      map['reporte_id'] = Variable<String>(c7fchPBLA.value);
    }
    if (bokW9m.present) {
      map['user_id'] = Variable<String>(bokW9m.value);
    }
    if (mIv.present) {
      map['rol'] = Variable<String>(mIv.value);
    }
    if (eQbrO.present) {
      map['rowid'] = Variable<int>(eQbrO.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReporteParticipantesTableCompanion(')
          ..write('reporteId: $c7fchPBLA, ')
          ..write('userId: $bokW9m, ')
          ..write('rol: $mIv, ')
          ..write('rowid: $eQbrO')
          ..write(')'))
        .toString();
  }
}

abstract class _Dd6MZrmiYCBX extends GeneratedDatabase {
  _Dd6MZrmiYCBX(QueryExecutor e) : super(e);
  VAZmCx0OIEHlhQoQlgP get wRD1rY6U => VAZmCx0OIEHlhQoQlgP(this);
  late final JUtMtZAhU8S2N01nW0NOb fl4K2o4z8EmVE6Q = JUtMtZAhU8S2N01nW0NOb(
    this,
  );
  late final XE5bck28Z2cvTleRiVdRxj76YhW5AXu oUFGqb3kTTei6pB1c72oFuUjt =
      XE5bck28Z2cvTleRiVdRxj76YhW5AXu(this);
  late final Gn9jkqIImNg4fnxYGw6rFKUi cunYqbc3Zd0Chxytm9 =
      Gn9jkqIImNg4fnxYGw6rFKUi(this);
  late final VoEzDvET6spVkF39b0bk p8RGehv9uW7gdv = VoEzDvET6spVkF39b0bk(this);
  late final J62cINCwmlQnn32ri khGDx8OWIxU = J62cINCwmlQnn32ri(this);
  late final H3NxUrmIatWHjGU32octXOFRSTp jU5VEJTz8C7WwoYYJfIlQ =
      H3NxUrmIatWHjGU32octXOFRSTp(this);
  late final TdpibLkvaSVlNdhYP94EMgY2 qaBIf6ei74qAD99wRU =
      TdpibLkvaSVlNdhYP94EMgY2(this);
  late final OZOvvqDyixK8vCrBMu7 tPzD7WczXfidC = OZOvvqDyixK8vCrBMu7(this);
  late final BoBcnkhdbLdMOgKtsin3TNgWX7CJA kBIHzP5TOGzWkh2wMx36lse =
      BoBcnkhdbLdMOgKtsin3TNgWX7CJA(this);
  late final YoNU9Kgod2bozlWwHlObWuuh62Da mE07WRLPfW2zDpFYLRNsjU =
      YoNU9Kgod2bozlWwHlObWuuh62Da(this);
  late final SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp xjLgqdIBlhdS5VmEqfZsjcQvX =
      SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    fl4K2o4z8EmVE6Q,
    oUFGqb3kTTei6pB1c72oFuUjt,
    cunYqbc3Zd0Chxytm9,
    p8RGehv9uW7gdv,
    khGDx8OWIxU,
    jU5VEJTz8C7WwoYYJfIlQ,
    qaBIf6ei74qAD99wRU,
    tPzD7WczXfidC,
    kBIHzP5TOGzWkh2wMx36lse,
    mE07WRLPfW2zDpFYLRNsjU,
    xjLgqdIBlhdS5VmEqfZsjcQvX,
  ];
}

typedef $$AsistenciaTableTableCreateCompanionBuilder =
    I4D75iPWJH0cc2eGwEo90OsZ Function({
      Value<int> id,
      required String usuarioId,
      required DateTime fechaHora,
      required String tipo,
      Value<String> metodo,
      Value<bool> sincronizado,
      Value<DateTime> creadoEn,
    });
typedef $$AsistenciaTableTableUpdateCompanionBuilder =
    I4D75iPWJH0cc2eGwEo90OsZ Function({
      Value<int> id,
      Value<String> usuarioId,
      Value<DateTime> fechaHora,
      Value<String> tipo,
      Value<String> metodo,
      Value<bool> sincronizado,
      Value<DateTime> creadoEn,
    });

class ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL
    extends Composer<_Dd6MZrmiYCBX, JUtMtZAhU8S2N01nW0NOb> {
  ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get oo => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cpFlHJ2wI => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get bKVSKL0Jn => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cKGl => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iW0fGQ => $composableBuilder(
    column: $table.metodo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vvWZ9ZlmNXbb => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get pRFwy3B4 => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg
    extends Composer<_Dd6MZrmiYCBX, JUtMtZAhU8S2N01nW0NOb> {
  YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cT => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kzZJFGgEh => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get wOANDUKQR => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get xhMD => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ugg9S0 => $composableBuilder(
    column: $table.metodo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ld1zD61ydQ8G => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dJI3CQgD => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL
    extends Composer<_Dd6MZrmiYCBX, JUtMtZAhU8S2N01nW0NOb> {
  GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pv =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get hmlW8R4S7 =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<DateTime> get rVq9fc3gG =>
      $composableBuilder(column: $table.fechaHora, builder: (column) => column);

  GeneratedColumn<String> get sFSw =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get qNx4cM =>
      $composableBuilder(column: $table.metodo, builder: (column) => column);

  GeneratedColumn<bool> get b8s12xVU2mdT => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get jLAGbYKM =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class USyXMn8kBYazqEYKNhgqxJdeXQfCoJ069L
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          JUtMtZAhU8S2N01nW0NOb,
          K7g68SL3ZcwxYHO0o9J,
          ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL,
          YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg,
          GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL,
          $$AsistenciaTableTableCreateCompanionBuilder,
          $$AsistenciaTableTableUpdateCompanionBuilder,
          (
            K7g68SL3ZcwxYHO0o9J,
            BaseReferences<
              _Dd6MZrmiYCBX,
              JUtMtZAhU8S2N01nW0NOb,
              K7g68SL3ZcwxYHO0o9J
            >,
          ),
          K7g68SL3ZcwxYHO0o9J,
          PrefetchHooks Function()
        > {
  USyXMn8kBYazqEYKNhgqxJdeXQfCoJ069L(
    _Dd6MZrmiYCBX db,
    JUtMtZAhU8S2N01nW0NOb table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL($db: db, $table: table),
          createOrderingComposer: () =>
              YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg($db: db, $table: table),
          createComputedFieldComposer: () =>
              GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> fechaHora = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> metodo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
              }) => I4D75iPWJH0cc2eGwEo90OsZ(
                oG: id,
                j5hswdgrL: usuarioId,
                tZ5Jbb5Kk: fechaHora,
                obO0: tipo,
                sjelo5: metodo,
                qI8LLZmrR7bZ: sincronizado,
                b2OwXecC: creadoEn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String usuarioId,
                required DateTime fechaHora,
                required String tipo,
                Value<String> metodo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
              }) => I4D75iPWJH0cc2eGwEo90OsZ.gJkcVJ(
                oG: id,
                usuarioId: usuarioId,
                fechaHora: fechaHora,
                tipo: tipo,
                sjelo5: metodo,
                qI8LLZmrR7bZ: sincronizado,
                b2OwXecC: creadoEn,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AsistenciaTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      JUtMtZAhU8S2N01nW0NOb,
      K7g68SL3ZcwxYHO0o9J,
      ZR7msLwZuisG2LIDIQYw6reyFRDeNQSKJ6RL,
      YoedYE6FALTEsC6KGEwDXAes33Akw6wfHaptBg,
      GoHvY2wXjyJjTJ4UUDSDhTuKOkKPdWsRSCxTB5tL,
      $$AsistenciaTableTableCreateCompanionBuilder,
      $$AsistenciaTableTableUpdateCompanionBuilder,
      (
        K7g68SL3ZcwxYHO0o9J,
        BaseReferences<
          _Dd6MZrmiYCBX,
          JUtMtZAhU8S2N01nW0NOb,
          K7g68SL3ZcwxYHO0o9J
        >,
      ),
      K7g68SL3ZcwxYHO0o9J,
      PrefetchHooks Function()
    >;
typedef $$CombustibleRegistrosTableTableCreateCompanionBuilder =
    U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB Function({
      required String id,
      required String usuarioId,
      required String modo,
      Value<String?> nombre,
      Value<String?> destino,
      Value<String?> horaInicio,
      Value<String?> horaFinal,
      Value<String?> combustibleInicial,
      Value<int?> kilometrajeInicial,
      Value<String?> combustibleFinal,
      Value<int?> kilometrajeFinal,
      Value<String?> fechaCarga,
      Value<String?> operador,
      Value<int?> kmAntes,
      Value<int?> kmDespues,
      Value<String?> metadata,
      Value<String?> syncError,
      Value<String?> syncInfo,
      Value<bool> sincronizado,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });
typedef $$CombustibleRegistrosTableTableUpdateCompanionBuilder =
    U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB Function({
      Value<String> id,
      Value<String> usuarioId,
      Value<String> modo,
      Value<String?> nombre,
      Value<String?> destino,
      Value<String?> horaInicio,
      Value<String?> horaFinal,
      Value<String?> combustibleInicial,
      Value<int?> kilometrajeInicial,
      Value<String?> combustibleFinal,
      Value<int?> kilometrajeFinal,
      Value<String?> fechaCarga,
      Value<String?> operador,
      Value<int?> kmAntes,
      Value<int?> kmDespues,
      Value<String?> metadata,
      Value<String?> syncError,
      Value<String?> syncInfo,
      Value<bool> sincronizado,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy
    extends Composer<_Dd6MZrmiYCBX, XE5bck28Z2cvTleRiVdRxj76YhW5AXu> {
  WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get jy => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ooKiRPLH7 => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get miLf => $composableBuilder(
    column: $table.modo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wk5CSI => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zD8eYSH => $composableBuilder(
    column: $table.destino,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ujZwd9VkNG => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cvN8q7BUa => $composableBuilder(
    column: $table.horaFinal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sZmKzLBnoNVscrxlQl => $composableBuilder(
    column: $table.combustibleInicial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pA9s0TEjCFTnXGjZcL => $composableBuilder(
    column: $table.kilometrajeInicial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qsti6uOZwmgktkJz => $composableBuilder(
    column: $table.combustibleFinal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get zUYbwIhg6GtuiJHA => $composableBuilder(
    column: $table.kilometrajeFinal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get h5DVIYL2Uv => $composableBuilder(
    column: $table.fechaCarga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zvrx7jok => $composableBuilder(
    column: $table.operador,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get p92W9Vc => $composableBuilder(
    column: $table.kmAntes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ec1jDXiLb => $composableBuilder(
    column: $table.kmDespues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inzwvWbc => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get o8XLV8NKv => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get e3Pyze2V => $composableBuilder(
    column: $table.syncInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get jVEMre3elDAC => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get jtPW6XOv => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j
    extends Composer<_Dd6MZrmiYCBX, XE5bck28Z2cvTleRiVdRxj76YhW5AXu> {
  WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get qV => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lF6VLHjKL => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get psa1 => $composableBuilder(
    column: $table.modo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pJMUnR => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tDnWFhN => $composableBuilder(
    column: $table.destino,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vNOnFrE17B => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ja6n729G3 => $composableBuilder(
    column: $table.horaFinal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get p75FWUbIlfg8F6lFms => $composableBuilder(
    column: $table.combustibleInicial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get zScIxA5B7lr7Jq050i => $composableBuilder(
    column: $table.kilometrajeInicial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get d63KfyQVKVCGv4jJ => $composableBuilder(
    column: $table.combustibleFinal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cngV2JMu1D22W3nr => $composableBuilder(
    column: $table.kilometrajeFinal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gLss9qbZnL => $composableBuilder(
    column: $table.fechaCarga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kLyScr6c => $composableBuilder(
    column: $table.operador,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nITzAkn => $composableBuilder(
    column: $table.kmAntes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get n6UJ5fLr6 => $composableBuilder(
    column: $table.kmDespues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fF19VTLf => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get k2r8Vg4Zl => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qy53oSTM => $composableBuilder(
    column: $table.syncInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mMdjBG0nPkFZ => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hJWc45E7 => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05
    extends Composer<_Dd6MZrmiYCBX, XE5bck28Z2cvTleRiVdRxj76YhW5AXu> {
  TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get wa =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get oaA7gGyzb =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<String> get c6rc =>
      $composableBuilder(column: $table.modo, builder: (column) => column);

  GeneratedColumn<String> get hMWLlo =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get sAIOlPS =>
      $composableBuilder(column: $table.destino, builder: (column) => column);

  GeneratedColumn<String> get wnT8lgkGr9 => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nemXvlBGD =>
      $composableBuilder(column: $table.horaFinal, builder: (column) => column);

  GeneratedColumn<String> get wQVGKC2sercNQ1PKPi => $composableBuilder(
    column: $table.combustibleInicial,
    builder: (column) => column,
  );

  GeneratedColumn<int> get k31HwvIUmQhv5NSNTK => $composableBuilder(
    column: $table.kilometrajeInicial,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sp1xuHb1qLZT6VMO => $composableBuilder(
    column: $table.combustibleFinal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hxtVA7E4pRMwAs6k => $composableBuilder(
    column: $table.kilometrajeFinal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lqZBmEHnOT => $composableBuilder(
    column: $table.fechaCarga,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lAQupHaP =>
      $composableBuilder(column: $table.operador, builder: (column) => column);

  GeneratedColumn<int> get g5DH1jK =>
      $composableBuilder(column: $table.kmAntes, builder: (column) => column);

  GeneratedColumn<int> get xkl3wMu5w =>
      $composableBuilder(column: $table.kmDespues, builder: (column) => column);

  GeneratedColumn<String> get xHFJa19R =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumn<String> get qW4WshIXv =>
      $composableBuilder(column: $table.syncError, builder: (column) => column);

  GeneratedColumn<String> get rCYClTGK =>
      $composableBuilder(column: $table.syncInfo, builder: (column) => column);

  GeneratedColumn<bool> get gfQOA5FpR9Ul => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get qQp0CTfy =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class Ewpgy5OBYu5LdV6pG4iF2VAdfDSeSiZBpniyJQlcrqex
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
          Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
          WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy,
          WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j,
          TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05,
          $$CombustibleRegistrosTableTableCreateCompanionBuilder,
          $$CombustibleRegistrosTableTableUpdateCompanionBuilder,
          (
            Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
            BaseReferences<
              _Dd6MZrmiYCBX,
              XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
              Tu1jStwkwzpbJHfkGU7g09MJhUwdD
            >,
          ),
          Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
          PrefetchHooks Function()
        > {
  Ewpgy5OBYu5LdV6pG4iF2VAdfDSeSiZBpniyJQlcrqex(
    _Dd6MZrmiYCBX db,
    XE5bck28Z2cvTleRiVdRxj76YhW5AXu table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<String> modo = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> destino = const Value.absent(),
                Value<String?> horaInicio = const Value.absent(),
                Value<String?> horaFinal = const Value.absent(),
                Value<String?> combustibleInicial = const Value.absent(),
                Value<int?> kilometrajeInicial = const Value.absent(),
                Value<String?> combustibleFinal = const Value.absent(),
                Value<int?> kilometrajeFinal = const Value.absent(),
                Value<String?> fechaCarga = const Value.absent(),
                Value<String?> operador = const Value.absent(),
                Value<int?> kmAntes = const Value.absent(),
                Value<int?> kmDespues = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<String?> syncInfo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB(
                kG: id,
                zP9InJmSB: usuarioId,
                piVk: modo,
                i5QUQk: nombre,
                u5GveBn: destino,
                xAMz01YkIt: horaInicio,
                ewIdFnxeO: horaFinal,
                bLRN1zQYqxM1WWlXjr: combustibleInicial,
                aYKSs386BUhF2mkPnG: kilometrajeInicial,
                ybJGZWDVbEKc4n5m: combustibleFinal,
                h0jpAs6ZpPJPw8NI: kilometrajeFinal,
                aqcX18IRuB: fechaCarga,
                ekcREChe: operador,
                dXt6KMU: kmAntes,
                ngpZB55Sc: kmDespues,
                j4QNm5oy: metadata,
                yR3qhIbzL: syncError,
                uX8ZvZgj: syncInfo,
                dJCVP37dMYlm: sincronizado,
                lYeqPFYS: creadoEn,
                tHjkb: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String usuarioId,
                required String modo,
                Value<String?> nombre = const Value.absent(),
                Value<String?> destino = const Value.absent(),
                Value<String?> horaInicio = const Value.absent(),
                Value<String?> horaFinal = const Value.absent(),
                Value<String?> combustibleInicial = const Value.absent(),
                Value<int?> kilometrajeInicial = const Value.absent(),
                Value<String?> combustibleFinal = const Value.absent(),
                Value<int?> kilometrajeFinal = const Value.absent(),
                Value<String?> fechaCarga = const Value.absent(),
                Value<String?> operador = const Value.absent(),
                Value<int?> kmAntes = const Value.absent(),
                Value<int?> kmDespues = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
                Value<String?> syncInfo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => U5NY40rQ6UaFmzKRJy6kqYMHdqkwV9GIHB.insert(
                id: id,
                usuarioId: usuarioId,
                modo: modo,
                i5QUQk: nombre,
                u5GveBn: destino,
                xAMz01YkIt: horaInicio,
                ewIdFnxeO: horaFinal,
                bLRN1zQYqxM1WWlXjr: combustibleInicial,
                aYKSs386BUhF2mkPnG: kilometrajeInicial,
                ybJGZWDVbEKc4n5m: combustibleFinal,
                h0jpAs6ZpPJPw8NI: kilometrajeFinal,
                aqcX18IRuB: fechaCarga,
                ekcREChe: operador,
                dXt6KMU: kmAntes,
                ngpZB55Sc: kmDespues,
                j4QNm5oy: metadata,
                yR3qhIbzL: syncError,
                uX8ZvZgj: syncInfo,
                dJCVP37dMYlm: sincronizado,
                lYeqPFYS: creadoEn,
                tHjkb: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CombustibleRegistrosTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
      Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
      WLyY90h0H60k9oiL4RYrQugE8O9I2NhXcDgLsxgGM1ggJy,
      WWr4R0K2ePGMlQenc4dkX18pDPDSXlIaEBNMMzZw5v56Og5j,
      TsE6iSkGzZcAkuCWOQ3ZHXH39kViIQXJb33AwA7PjSIAW1CI05,
      $$CombustibleRegistrosTableTableCreateCompanionBuilder,
      $$CombustibleRegistrosTableTableUpdateCompanionBuilder,
      (
        Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
        BaseReferences<
          _Dd6MZrmiYCBX,
          XE5bck28Z2cvTleRiVdRxj76YhW5AXu,
          Tu1jStwkwzpbJHfkGU7g09MJhUwdD
        >,
      ),
      Tu1jStwkwzpbJHfkGU7g09MJhUwdD,
      PrefetchHooks Function()
    >;
typedef $$NotificationsTableTableCreateCompanionBuilder =
    SWa7JoZtay7PsWkFUBhxewW9jpO Function({
      required String id,
      required String titulo,
      required String mensaje,
      Value<String> tipo,
      Value<bool> leida,
      Value<String?> origen,
      Value<DateTime> fecha,
      Value<int> rowid,
    });
typedef $$NotificationsTableTableUpdateCompanionBuilder =
    SWa7JoZtay7PsWkFUBhxewW9jpO Function({
      Value<String> id,
      Value<String> titulo,
      Value<String> mensaje,
      Value<String> tipo,
      Value<bool> leida,
      Value<String?> origen,
      Value<DateTime> fecha,
      Value<int> rowid,
    });

class KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w
    extends Composer<_Dd6MZrmiYCBX, Gn9jkqIImNg4fnxYGw6rFKUi> {
  KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get ip => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get albheZ => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ph6YOEI => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get xh29 => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vtluP => $composableBuilder(
    column: $table.leida,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jxUYbQ => $composableBuilder(
    column: $table.origen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get eAXTF => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );
}

class Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy
    extends Composer<_Dd6MZrmiYCBX, Gn9jkqIImNg4fnxYGw6rFKUi> {
  Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get s8 => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bLU3ZG => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zaLEVMq => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iKCR => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get y6Ruo => $composableBuilder(
    column: $table.leida,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get y84Cc5 => $composableBuilder(
    column: $table.origen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get s7tU3 => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );
}

class HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe
    extends Composer<_Dd6MZrmiYCBX, Gn9jkqIImNg4fnxYGw6rFKUi> {
  HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get jU =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uAZDff =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get sjyqTD5 =>
      $composableBuilder(column: $table.mensaje, builder: (column) => column);

  GeneratedColumn<String> get nJb3 =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<bool> get vmpPV =>
      $composableBuilder(column: $table.leida, builder: (column) => column);

  GeneratedColumn<String> get cWPsEO =>
      $composableBuilder(column: $table.origen, builder: (column) => column);

  GeneratedColumn<DateTime> get neZcd =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);
}

class XmKM7mJUfyyob2FBA8NA2ouhEvDRtBtSrJdUr
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          Gn9jkqIImNg4fnxYGw6rFKUi,
          DPidT9wqpsXGu3Kq8QK4mS,
          KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w,
          Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy,
          HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe,
          $$NotificationsTableTableCreateCompanionBuilder,
          $$NotificationsTableTableUpdateCompanionBuilder,
          (
            DPidT9wqpsXGu3Kq8QK4mS,
            BaseReferences<
              _Dd6MZrmiYCBX,
              Gn9jkqIImNg4fnxYGw6rFKUi,
              DPidT9wqpsXGu3Kq8QK4mS
            >,
          ),
          DPidT9wqpsXGu3Kq8QK4mS,
          PrefetchHooks Function()
        > {
  XmKM7mJUfyyob2FBA8NA2ouhEvDRtBtSrJdUr(
    _Dd6MZrmiYCBX db,
    Gn9jkqIImNg4fnxYGw6rFKUi table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w($db: db, $table: table),
          createOrderingComposer: () =>
              Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy($db: db, $table: table),
          createComputedFieldComposer: () =>
              HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> mensaje = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<bool> leida = const Value.absent(),
                Value<String?> origen = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SWa7JoZtay7PsWkFUBhxewW9jpO(
                aN: id,
                ljk5Nd: titulo,
                mnrOxtx: mensaje,
                jdRb: tipo,
                zZbwB: leida,
                b5yrQ9: origen,
                moLEU: fecha,
                b82qb: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String titulo,
                required String mensaje,
                Value<String> tipo = const Value.absent(),
                Value<bool> leida = const Value.absent(),
                Value<String?> origen = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SWa7JoZtay7PsWkFUBhxewW9jpO.insert(
                id: id,
                titulo: titulo,
                mensaje: mensaje,
                jdRb: tipo,
                zZbwB: leida,
                b5yrQ9: origen,
                moLEU: fecha,
                b82qb: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationsTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      Gn9jkqIImNg4fnxYGw6rFKUi,
      DPidT9wqpsXGu3Kq8QK4mS,
      KBIBhN05gN55PwqLPFLSPyorPfK06s0PAH1tc3w,
      Yfk5M6J8kKHOAMcozjHyc1blld9onyYX342erwCfy,
      HXVnSfE9TiJohAyXx7zbB86OrlNuWbnou4GaTCR5Cbe,
      $$NotificationsTableTableCreateCompanionBuilder,
      $$NotificationsTableTableUpdateCompanionBuilder,
      (
        DPidT9wqpsXGu3Kq8QK4mS,
        BaseReferences<
          _Dd6MZrmiYCBX,
          Gn9jkqIImNg4fnxYGw6rFKUi,
          DPidT9wqpsXGu3Kq8QK4mS
        >,
      ),
      DPidT9wqpsXGu3Kq8QK4mS,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableTableCreateCompanionBuilder =
    SrEEFVxhxqZAGYVOYcaDbjs Function({
      Value<int> id,
      required String entidad,
      required String entidadId,
      required String accion,
      Value<Map<String, dynamic>?> payload,
      Value<bool> procesado,
      Value<DateTime> createdAt,
    });
typedef $$SyncQueueTableTableUpdateCompanionBuilder =
    SrEEFVxhxqZAGYVOYcaDbjs Function({
      Value<int> id,
      Value<String> entidad,
      Value<String> entidadId,
      Value<String> accion,
      Value<Map<String, dynamic>?> payload,
      Value<bool> procesado,
      Value<DateTime> createdAt,
    });

class H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF
    extends Composer<_Dd6MZrmiYCBX, VoEzDvET6spVkF39b0bk> {
  H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get hn => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rAdKHgL => $composableBuilder(
    column: $table.entidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tf70T7wDE => $composableBuilder(
    column: $table.entidadId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get j7TTrp => $composableBuilder(
    column: $table.accion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get oRCNDw6 => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get mOGAH3rfd => $composableBuilder(
    column: $table.procesado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get zjUkS8giB => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH
    extends Composer<_Dd6MZrmiYCBX, VoEzDvET6spVkF39b0bk> {
  WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get oY => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get azFwhxv => $composableBuilder(
    column: $table.entidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get yYthc2XHJ => $composableBuilder(
    column: $table.entidadId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get t7QVNe => $composableBuilder(
    column: $table.accion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wKFff4l => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get eiO8Y3LhQ => $composableBuilder(
    column: $table.procesado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get xg4d55GpR => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d
    extends Composer<_Dd6MZrmiYCBX, VoEzDvET6spVkF39b0bk> {
  DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get ju =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kMVt81P =>
      $composableBuilder(column: $table.entidad, builder: (column) => column);

  GeneratedColumn<String> get bMDjO0Wr1 =>
      $composableBuilder(column: $table.entidadId, builder: (column) => column);

  GeneratedColumn<String> get gWmu8j =>
      $composableBuilder(column: $table.accion, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get i5ePpmM =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<bool> get gd92sq2Ya =>
      $composableBuilder(column: $table.procesado, builder: (column) => column);

  GeneratedColumn<DateTime> get bMRigddjy =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class QQYmbrOUojO1LCI6T1mtQoHJE7MozAsyK
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          VoEzDvET6spVkF39b0bk,
          NArNwNTM7Tr2ljhuMP,
          H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF,
          WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH,
          DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d,
          $$SyncQueueTableTableCreateCompanionBuilder,
          $$SyncQueueTableTableUpdateCompanionBuilder,
          (
            NArNwNTM7Tr2ljhuMP,
            BaseReferences<
              _Dd6MZrmiYCBX,
              VoEzDvET6spVkF39b0bk,
              NArNwNTM7Tr2ljhuMP
            >,
          ),
          NArNwNTM7Tr2ljhuMP,
          PrefetchHooks Function()
        > {
  QQYmbrOUojO1LCI6T1mtQoHJE7MozAsyK(
    _Dd6MZrmiYCBX db,
    VoEzDvET6spVkF39b0bk table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF($db: db, $table: table),
          createOrderingComposer: () =>
              WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH($db: db, $table: table),
          createComputedFieldComposer: () =>
              DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entidad = const Value.absent(),
                Value<String> entidadId = const Value.absent(),
                Value<String> accion = const Value.absent(),
                Value<Map<String, dynamic>?> payload = const Value.absent(),
                Value<bool> procesado = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SrEEFVxhxqZAGYVOYcaDbjs(
                dy: id,
                jz6JiPB: entidad,
                g8u3OR9sY: entidadId,
                v7ws6e: accion,
                j9qrlAp: payload,
                sKt6xl9c1: procesado,
                toSavqXbg: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entidad,
                required String entidadId,
                required String accion,
                Value<Map<String, dynamic>?> payload = const Value.absent(),
                Value<bool> procesado = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SrEEFVxhxqZAGYVOYcaDbjs.insert(
                dy: id,
                entidad: entidad,
                entidadId: entidadId,
                accion: accion,
                j9qrlAp: payload,
                sKt6xl9c1: procesado,
                toSavqXbg: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      VoEzDvET6spVkF39b0bk,
      NArNwNTM7Tr2ljhuMP,
      H8qxhIuE2EFMfxb8NbC3zdeAuLul8TIi0pF,
      WS8cMCYsdcD3MmAEzBNy0XPIzlKmKK2MnsDRH,
      DtHkQUbdVD544BoPBTZtNc4hq39Q4OaTzfyFU9d,
      $$SyncQueueTableTableCreateCompanionBuilder,
      $$SyncQueueTableTableUpdateCompanionBuilder,
      (
        NArNwNTM7Tr2ljhuMP,
        BaseReferences<_Dd6MZrmiYCBX, VoEzDvET6spVkF39b0bk, NArNwNTM7Tr2ljhuMP>,
      ),
      NArNwNTM7Tr2ljhuMP,
      PrefetchHooks Function()
    >;
typedef $$TareasTableTableCreateCompanionBuilder =
    OwsvOrFusdhz7tOUKhJP Function({
      required String id,
      Value<String?> remoteId,
      Value<String?> groupId,
      required String reporteId,
      required String titulo,
      Value<String> descripcion,
      Value<String?> creadoPor,
      required String asignadoA,
      required String estado,
      Value<int> rowid,
    });
typedef $$TareasTableTableUpdateCompanionBuilder =
    OwsvOrFusdhz7tOUKhJP Function({
      Value<String> id,
      Value<String?> remoteId,
      Value<String?> groupId,
      Value<String> reporteId,
      Value<String> titulo,
      Value<String> descripcion,
      Value<String?> creadoPor,
      Value<String> asignadoA,
      Value<String> estado,
      Value<int> rowid,
    });

class FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD
    extends Composer<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri> {
  FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uU => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ckEuunuo => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jsswyVm => $composableBuilder(
    column: $table.groupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get knxoyUwgb => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kiRFZT => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cPVDSXrQkzT => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aRwHNQ6TD => $composableBuilder(
    column: $table.creadoPor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pTvYVoMqC => $composableBuilder(
    column: $table.asignadoA,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bkwoWS => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );
}

class NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W
    extends Composer<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri> {
  NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get eu => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pIOh1WNL => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get s9dRrYe => $composableBuilder(
    column: $table.groupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kTABwHiYO => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get k4IrKX => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get c6CxxUzLRCi => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uzdiJGZHs => $composableBuilder(
    column: $table.creadoPor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get x26ZqXd1b => $composableBuilder(
    column: $table.asignadoA,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bu9HKX => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );
}

class T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY
    extends Composer<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri> {
  T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get me =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pfqzdN3q =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get ozyfDGd =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get pUGnHlrhx =>
      $composableBuilder(column: $table.reporteId, builder: (column) => column);

  GeneratedColumn<String> get lM3vvj =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get tggo0YueFx6 => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pp1Lf953H =>
      $composableBuilder(column: $table.creadoPor, builder: (column) => column);

  GeneratedColumn<String> get cMzQDsPtz =>
      $composableBuilder(column: $table.asignadoA, builder: (column) => column);

  GeneratedColumn<String> get lwFJUc =>
      $composableBuilder(column: $table.estado, builder: (column) => column);
}

class RXAwq0eA5rYKGJP6ffVlZey1j6uJGi
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          J62cINCwmlQnn32ri,
          AZne3qKStPEIrwr,
          FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD,
          NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W,
          T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY,
          $$TareasTableTableCreateCompanionBuilder,
          $$TareasTableTableUpdateCompanionBuilder,
          (
            AZne3qKStPEIrwr,
            BaseReferences<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri, AZne3qKStPEIrwr>,
          ),
          AZne3qKStPEIrwr,
          PrefetchHooks Function()
        > {
  RXAwq0eA5rYKGJP6ffVlZey1j6uJGi(_Dd6MZrmiYCBX db, J62cINCwmlQnn32ri table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD($db: db, $table: table),
          createOrderingComposer: () =>
              NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W($db: db, $table: table),
          createComputedFieldComposer: () =>
              T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String?> groupId = const Value.absent(),
                Value<String> reporteId = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String?> creadoPor = const Value.absent(),
                Value<String> asignadoA = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OwsvOrFusdhz7tOUKhJP(
                vN: id,
                rN7JO0qb: remoteId,
                kiENrzh: groupId,
                aeirywxyG: reporteId,
                ynDuUW: titulo,
                lOp8NQT26oW: descripcion,
                x542jWBgN: creadoPor,
                z9uTXhbFC: asignadoA,
                tJjuIr: estado,
                rLjxm: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> remoteId = const Value.absent(),
                Value<String?> groupId = const Value.absent(),
                required String reporteId,
                required String titulo,
                Value<String> descripcion = const Value.absent(),
                Value<String?> creadoPor = const Value.absent(),
                required String asignadoA,
                required String estado,
                Value<int> rowid = const Value.absent(),
              }) => OwsvOrFusdhz7tOUKhJP.insert(
                id: id,
                rN7JO0qb: remoteId,
                kiENrzh: groupId,
                reporteId: reporteId,
                titulo: titulo,
                lOp8NQT26oW: descripcion,
                x542jWBgN: creadoPor,
                asignadoA: asignadoA,
                estado: estado,
                rLjxm: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TareasTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      J62cINCwmlQnn32ri,
      AZne3qKStPEIrwr,
      FrGKxaBeOCrtKuG33xwxKILVUkFyaaXD,
      NI2Ioyk67UDxTi5uMY2f0F1bn0rtXJ8z5W,
      T7OVH2XqSpVXEYkVNOXUqgwjzIvfaIDxpHWY,
      $$TareasTableTableCreateCompanionBuilder,
      $$TareasTableTableUpdateCompanionBuilder,
      (
        AZne3qKStPEIrwr,
        BaseReferences<_Dd6MZrmiYCBX, J62cINCwmlQnn32ri, AZne3qKStPEIrwr>,
      ),
      AZne3qKStPEIrwr,
      PrefetchHooks Function()
    >;
typedef $$TareaComentariosTableTableCreateCompanionBuilder =
    G4ZLuhxuHaVA2A7emAJSd9pokMajYj Function({
      required String id,
      required String tareaId,
      required String autorId,
      required String mensaje,
      required DateTime creadoEn,
      Value<int> rowid,
    });
typedef $$TareaComentariosTableTableUpdateCompanionBuilder =
    G4ZLuhxuHaVA2A7emAJSd9pokMajYj Function({
      Value<String> id,
      Value<String> tareaId,
      Value<String> autorId,
      Value<String> mensaje,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19
    extends Composer<_Dd6MZrmiYCBX, H3NxUrmIatWHjGU32octXOFRSTp> {
  SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get n5 => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rftYKGg => $composableBuilder(
    column: $table.tareaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get w4FqASy => $composableBuilder(
    column: $table.autorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gJVpeHT => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get jVV1gn4D => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy
    extends Composer<_Dd6MZrmiYCBX, H3NxUrmIatWHjGU32octXOFRSTp> {
  LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get rI => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mhERyP4 => $composableBuilder(
    column: $table.tareaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get a2Ji5fL => $composableBuilder(
    column: $table.autorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tnrQ8c3 => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lpnLXtvQ => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4
    extends Composer<_Dd6MZrmiYCBX, H3NxUrmIatWHjGU32octXOFRSTp> {
  Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get yf =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get rfu25Ff =>
      $composableBuilder(column: $table.tareaId, builder: (column) => column);

  GeneratedColumn<String> get d4f7PKc =>
      $composableBuilder(column: $table.autorId, builder: (column) => column);

  GeneratedColumn<String> get jptzjpV =>
      $composableBuilder(column: $table.mensaje, builder: (column) => column);

  GeneratedColumn<DateTime> get rYYCfBd8 =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class OhLrvy21dgQpe5CrGealKCZN5wqeQzN4piRajLip
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          H3NxUrmIatWHjGU32octXOFRSTp,
          PfsdSEuE2JF8CtLF5W1e1XWcI,
          SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19,
          LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy,
          Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4,
          $$TareaComentariosTableTableCreateCompanionBuilder,
          $$TareaComentariosTableTableUpdateCompanionBuilder,
          (
            PfsdSEuE2JF8CtLF5W1e1XWcI,
            BaseReferences<
              _Dd6MZrmiYCBX,
              H3NxUrmIatWHjGU32octXOFRSTp,
              PfsdSEuE2JF8CtLF5W1e1XWcI
            >,
          ),
          PfsdSEuE2JF8CtLF5W1e1XWcI,
          PrefetchHooks Function()
        > {
  OhLrvy21dgQpe5CrGealKCZN5wqeQzN4piRajLip(
    _Dd6MZrmiYCBX db,
    H3NxUrmIatWHjGU32octXOFRSTp table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> tareaId = const Value.absent(),
                Value<String> autorId = const Value.absent(),
                Value<String> mensaje = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => G4ZLuhxuHaVA2A7emAJSd9pokMajYj(
                dc: id,
                zQBZZlP: tareaId,
                t9Zc8W4: autorId,
                eYwLAmk: mensaje,
                h5ANAMwE: creadoEn,
                ea0zu: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String tareaId,
                required String autorId,
                required String mensaje,
                required DateTime creadoEn,
                Value<int> rowid = const Value.absent(),
              }) => G4ZLuhxuHaVA2A7emAJSd9pokMajYj.insert(
                id: id,
                tareaId: tareaId,
                autorId: autorId,
                mensaje: mensaje,
                creadoEn: creadoEn,
                ea0zu: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TareaComentariosTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      H3NxUrmIatWHjGU32octXOFRSTp,
      PfsdSEuE2JF8CtLF5W1e1XWcI,
      SmCV73EcG0sCODxVHqvgeFLbr9bd6Ke15w1PPdqQ19,
      LeIY7dKFqBlAyGATFJrk7FMwCQBiqx8ump0XO2CofQRy,
      Uz6IHNJQVCPoUFd4VV8KHLzl1pMZqCNNMIYnVSbNfUDZL4,
      $$TareaComentariosTableTableCreateCompanionBuilder,
      $$TareaComentariosTableTableUpdateCompanionBuilder,
      (
        PfsdSEuE2JF8CtLF5W1e1XWcI,
        BaseReferences<
          _Dd6MZrmiYCBX,
          H3NxUrmIatWHjGU32octXOFRSTp,
          PfsdSEuE2JF8CtLF5W1e1XWcI
        >,
      ),
      PfsdSEuE2JF8CtLF5W1e1XWcI,
      PrefetchHooks Function()
    >;
typedef $$TareaAdjuntosTableTableCreateCompanionBuilder =
    QlrnTCYlJIu0qdevCWFMOwRPuhb Function({
      required String id,
      required String tareaId,
      required String tipo,
      required String nombre,
      required String localPath,
      Value<String?> mimeType,
      Value<String?> remoteUrl,
      required DateTime creadoEn,
      Value<int> rowid,
    });
typedef $$TareaAdjuntosTableTableUpdateCompanionBuilder =
    QlrnTCYlJIu0qdevCWFMOwRPuhb Function({
      Value<String> id,
      Value<String> tareaId,
      Value<String> tipo,
      Value<String> nombre,
      Value<String> localPath,
      Value<String?> mimeType,
      Value<String?> remoteUrl,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5
    extends Composer<_Dd6MZrmiYCBX, TdpibLkvaSVlNdhYP94EMgY2> {
  CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pC => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nh5iwf2 => $composableBuilder(
    column: $table.tareaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get g1xP => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mjg62a => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get yGGZMpbBr => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rNtl1o2T => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ndsuCX957 => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get oNASWUQg => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6
    extends Composer<_Dd6MZrmiYCBX, TdpibLkvaSVlNdhYP94EMgY2> {
  KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pn => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sWfXNBk => $composableBuilder(
    column: $table.tareaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wfP1 => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get y2bXgL => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get xeztH3Pj7 => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sLTWcJz0 => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pYMJc7TAo => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get gNLhb0LN => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl
    extends Composer<_Dd6MZrmiYCBX, TdpibLkvaSVlNdhYP94EMgY2> {
  DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get hj =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get e0of5hg =>
      $composableBuilder(column: $table.tareaId, builder: (column) => column);

  GeneratedColumn<String> get iGnk =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get jjiYVM =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get w2EtC1ruX =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get mCWObULq =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<String> get vyJ5TMVWg =>
      $composableBuilder(column: $table.remoteUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get yVPDhbHi =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class JRyab0RH1yVc9r4UYfGwU8efnxpSej9fSfG0J
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          TdpibLkvaSVlNdhYP94EMgY2,
          Rot0adVvP5dwb2j4cDof6l,
          CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5,
          KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6,
          DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl,
          $$TareaAdjuntosTableTableCreateCompanionBuilder,
          $$TareaAdjuntosTableTableUpdateCompanionBuilder,
          (
            Rot0adVvP5dwb2j4cDof6l,
            BaseReferences<
              _Dd6MZrmiYCBX,
              TdpibLkvaSVlNdhYP94EMgY2,
              Rot0adVvP5dwb2j4cDof6l
            >,
          ),
          Rot0adVvP5dwb2j4cDof6l,
          PrefetchHooks Function()
        > {
  JRyab0RH1yVc9r4UYfGwU8efnxpSej9fSfG0J(
    _Dd6MZrmiYCBX db,
    TdpibLkvaSVlNdhYP94EMgY2 table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5($db: db, $table: table),
          createOrderingComposer: () =>
              KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6($db: db, $table: table),
          createComputedFieldComposer: () =>
              DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> tareaId = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QlrnTCYlJIu0qdevCWFMOwRPuhb(
                cC: id,
                x35Hv88: tareaId,
                hXAX: tipo,
                cSDgEc: nombre,
                tOyOIzLZx: localPath,
                wvT2cjKQ: mimeType,
                r4cZYBdDG: remoteUrl,
                kq5gx0Ow: creadoEn,
                tlaHb: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String tareaId,
                required String tipo,
                required String nombre,
                required String localPath,
                Value<String?> mimeType = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                required DateTime creadoEn,
                Value<int> rowid = const Value.absent(),
              }) => QlrnTCYlJIu0qdevCWFMOwRPuhb.insert(
                id: id,
                tareaId: tareaId,
                tipo: tipo,
                nombre: nombre,
                localPath: localPath,
                wvT2cjKQ: mimeType,
                r4cZYBdDG: remoteUrl,
                creadoEn: creadoEn,
                tlaHb: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TareaAdjuntosTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      TdpibLkvaSVlNdhYP94EMgY2,
      Rot0adVvP5dwb2j4cDof6l,
      CxkvUSfMcbDW0twyZRBjRgSNe2L0mCbnGDZAeD5,
      KvejfSuIZlf2DsYq1jR5eV0DmOwRkqefhWrPhFWf6,
      DYIcqpm2e1Adbax5ZXwFxGi9Z5m0hYE6VcsqJ06MOvl,
      $$TareaAdjuntosTableTableCreateCompanionBuilder,
      $$TareaAdjuntosTableTableUpdateCompanionBuilder,
      (
        Rot0adVvP5dwb2j4cDof6l,
        BaseReferences<
          _Dd6MZrmiYCBX,
          TdpibLkvaSVlNdhYP94EMgY2,
          Rot0adVvP5dwb2j4cDof6l
        >,
      ),
      Rot0adVvP5dwb2j4cDof6l,
      PrefetchHooks Function()
    >;
typedef $$ReportesTableTableCreateCompanionBuilder =
    HX2XOaxsqSn5sDql3bDAkn Function({
      required String id,
      required String titulo,
      required String descripcion,
      required String categoria,
      required String area,
      Value<String?> activo,
      Value<String?> ubicacion,
      required String creadoPor,
      required DateTime creadoEn,
      required String estado,
      Value<String?> glpiTicketId,
      Value<String?> metadata,
      Value<int> rowid,
    });
typedef $$ReportesTableTableUpdateCompanionBuilder =
    HX2XOaxsqSn5sDql3bDAkn Function({
      Value<String> id,
      Value<String> titulo,
      Value<String> descripcion,
      Value<String> categoria,
      Value<String> area,
      Value<String?> activo,
      Value<String?> ubicacion,
      Value<String> creadoPor,
      Value<DateTime> creadoEn,
      Value<String> estado,
      Value<String?> glpiTicketId,
      Value<String?> metadata,
      Value<int> rowid,
    });

class W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa
    extends Composer<_Dd6MZrmiYCBX, OZOvvqDyixK8vCrBMu7> {
  W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get vB => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gFs774 => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sDNY0Tnv4tQ => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vymyMEQT9 => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dVXK => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get o0JyPs => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nnMFo0a2q => $composableBuilder(
    column: $table.ubicacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get xprQY5ML8 => $composableBuilder(
    column: $table.creadoPor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cU4r9jx0 => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get n7towl => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aOgR4hVGjwKZ => $composableBuilder(
    column: $table.glpiTicketId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dBOqWCFQ => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );
}

class DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7
    extends Composer<_Dd6MZrmiYCBX, OZOvvqDyixK8vCrBMu7> {
  DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get jj => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hQ5kDz => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baPZJxO13so => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get xVaqEFMt9 => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cWGZ => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dpPtgW => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ilmyAjTgi => $composableBuilder(
    column: $table.ubicacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ke9yIUoC4 => $composableBuilder(
    column: $table.creadoPor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get vW6KbTUs => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uAJ3fh => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hDY6thTN3iQP => $composableBuilder(
    column: $table.glpiTicketId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iAbK5W0S => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );
}

class EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7
    extends Composer<_Dd6MZrmiYCBX, OZOvvqDyixK8vCrBMu7> {
  EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get qF =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ujaPYO =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get yOjPFMJbXh3 => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get oHEySrhUX =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<String> get yC1g =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get mupAoO =>
      $composableBuilder(column: $table.activo, builder: (column) => column);

  GeneratedColumn<String> get jFNjadgjT =>
      $composableBuilder(column: $table.ubicacion, builder: (column) => column);

  GeneratedColumn<String> get m8yCA6rMX =>
      $composableBuilder(column: $table.creadoPor, builder: (column) => column);

  GeneratedColumn<DateTime> get hJdjXwfu =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  GeneratedColumn<String> get eaW5Cf =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get u3bLftuQoCu5 => $composableBuilder(
    column: $table.glpiTicketId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get yMpdstFM =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class L9Cwg4F4onK9DCEquZG1DiPl95OEOSX7
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          OZOvvqDyixK8vCrBMu7,
          S3xRBVOlVfAQliETU,
          W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa,
          DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7,
          EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7,
          $$ReportesTableTableCreateCompanionBuilder,
          $$ReportesTableTableUpdateCompanionBuilder,
          (
            S3xRBVOlVfAQliETU,
            BaseReferences<
              _Dd6MZrmiYCBX,
              OZOvvqDyixK8vCrBMu7,
              S3xRBVOlVfAQliETU
            >,
          ),
          S3xRBVOlVfAQliETU,
          PrefetchHooks Function()
        > {
  L9Cwg4F4onK9DCEquZG1DiPl95OEOSX7(_Dd6MZrmiYCBX db, OZOvvqDyixK8vCrBMu7 table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa($db: db, $table: table),
          createOrderingComposer: () =>
              DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7($db: db, $table: table),
          createComputedFieldComposer: () =>
              EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String> categoria = const Value.absent(),
                Value<String> area = const Value.absent(),
                Value<String?> activo = const Value.absent(),
                Value<String?> ubicacion = const Value.absent(),
                Value<String> creadoPor = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<String?> glpiTicketId = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HX2XOaxsqSn5sDql3bDAkn(
                wv: id,
                fwUC6v: titulo,
                yQ3xXO7Rua8: descripcion,
                bsWB13P0F: categoria,
                pAUt: area,
                hqptn4: activo,
                v4bMkOtju: ubicacion,
                r8Zq7Nq7S: creadoPor,
                kIW1poxd: creadoEn,
                cgnYnB: estado,
                d6UYuTd488y5: glpiTicketId,
                leyqxQiP: metadata,
                cGghm: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String titulo,
                required String descripcion,
                required String categoria,
                required String area,
                Value<String?> activo = const Value.absent(),
                Value<String?> ubicacion = const Value.absent(),
                required String creadoPor,
                required DateTime creadoEn,
                required String estado,
                Value<String?> glpiTicketId = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HX2XOaxsqSn5sDql3bDAkn.insert(
                id: id,
                titulo: titulo,
                descripcion: descripcion,
                categoria: categoria,
                area: area,
                hqptn4: activo,
                v4bMkOtju: ubicacion,
                creadoPor: creadoPor,
                creadoEn: creadoEn,
                estado: estado,
                d6UYuTd488y5: glpiTicketId,
                leyqxQiP: metadata,
                cGghm: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReportesTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      OZOvvqDyixK8vCrBMu7,
      S3xRBVOlVfAQliETU,
      W3ZMcN0FxrtNjdquzPwPa4KgedgMqb9sqa,
      DoXrceYKwrLR59JM57zzqvqSp8dsiJuLDtd7,
      EpTiv4je7jdx2pD8vWDp8ZCX7Xxl6BDPLzukO7,
      $$ReportesTableTableCreateCompanionBuilder,
      $$ReportesTableTableUpdateCompanionBuilder,
      (
        S3xRBVOlVfAQliETU,
        BaseReferences<_Dd6MZrmiYCBX, OZOvvqDyixK8vCrBMu7, S3xRBVOlVfAQliETU>,
      ),
      S3xRBVOlVfAQliETU,
      PrefetchHooks Function()
    >;
typedef $$ReporteComentariosTableTableCreateCompanionBuilder =
    MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB Function({
      required String id,
      required String reporteId,
      required String autorId,
      required String mensaje,
      required DateTime creadoEn,
      Value<int> rowid,
    });
typedef $$ReporteComentariosTableTableUpdateCompanionBuilder =
    MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB Function({
      Value<String> id,
      Value<String> reporteId,
      Value<String> autorId,
      Value<String> mensaje,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta
    extends Composer<_Dd6MZrmiYCBX, BoBcnkhdbLdMOgKtsin3TNgWX7CJA> {
  AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nK => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nAO4wslFN => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posHXis => $composableBuilder(
    column: $table.autorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rm92OZt => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sZCdfLux => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7
    extends Composer<_Dd6MZrmiYCBX, BoBcnkhdbLdMOgKtsin3TNgWX7CJA> {
  M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get aO => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rE3Znq1db => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qsn6hq7 => $composableBuilder(
    column: $table.autorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oGFsIMl => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tNy7Rftk => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4
    extends Composer<_Dd6MZrmiYCBX, BoBcnkhdbLdMOgKtsin3TNgWX7CJA> {
  YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get iB =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ybX1DO3zL =>
      $composableBuilder(column: $table.reporteId, builder: (column) => column);

  GeneratedColumn<String> get hRbHbi5 =>
      $composableBuilder(column: $table.autorId, builder: (column) => column);

  GeneratedColumn<String> get pWzWJFs =>
      $composableBuilder(column: $table.mensaje, builder: (column) => column);

  GeneratedColumn<DateTime> get xmvUV91M =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class GF66RA5rabIZvclHzKEKptPjs6orzcFsxrW9RriGE4
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          BoBcnkhdbLdMOgKtsin3TNgWX7CJA,
          ARpUcXEcU4toxru8LMyBl7DV8Cd,
          AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta,
          M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7,
          YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4,
          $$ReporteComentariosTableTableCreateCompanionBuilder,
          $$ReporteComentariosTableTableUpdateCompanionBuilder,
          (
            ARpUcXEcU4toxru8LMyBl7DV8Cd,
            BaseReferences<
              _Dd6MZrmiYCBX,
              BoBcnkhdbLdMOgKtsin3TNgWX7CJA,
              ARpUcXEcU4toxru8LMyBl7DV8Cd
            >,
          ),
          ARpUcXEcU4toxru8LMyBl7DV8Cd,
          PrefetchHooks Function()
        > {
  GF66RA5rabIZvclHzKEKptPjs6orzcFsxrW9RriGE4(
    _Dd6MZrmiYCBX db,
    BoBcnkhdbLdMOgKtsin3TNgWX7CJA table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> reporteId = const Value.absent(),
                Value<String> autorId = const Value.absent(),
                Value<String> mensaje = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB(
                vH: id,
                fWiwTihJ5: reporteId,
                peeUJ61: autorId,
                rgBeY5W: mensaje,
                pWlpsCw4: creadoEn,
                rL8KS: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String reporteId,
                required String autorId,
                required String mensaje,
                required DateTime creadoEn,
                Value<int> rowid = const Value.absent(),
              }) => MZccOvXeA1PTV6HDcQMHQVcEFSJLpitB.insert(
                id: id,
                reporteId: reporteId,
                autorId: autorId,
                mensaje: mensaje,
                creadoEn: creadoEn,
                rL8KS: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReporteComentariosTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      BoBcnkhdbLdMOgKtsin3TNgWX7CJA,
      ARpUcXEcU4toxru8LMyBl7DV8Cd,
      AyeMn8STgk8ZcSPEY398y2EY4bwYnUnscFWClwZjE3Ta,
      M2qmCOmIuU3P8fc6hJTfAk5FKe4F3Gvb1jyq8NFo5WthX7,
      YqbNxq6pS2sdHoO8YBtB45SS9igmNTTm5FYhQja3ZyRz0sa4,
      $$ReporteComentariosTableTableCreateCompanionBuilder,
      $$ReporteComentariosTableTableUpdateCompanionBuilder,
      (
        ARpUcXEcU4toxru8LMyBl7DV8Cd,
        BaseReferences<
          _Dd6MZrmiYCBX,
          BoBcnkhdbLdMOgKtsin3TNgWX7CJA,
          ARpUcXEcU4toxru8LMyBl7DV8Cd
        >,
      ),
      ARpUcXEcU4toxru8LMyBl7DV8Cd,
      PrefetchHooks Function()
    >;
typedef $$ReporteEvidenciasTableTableCreateCompanionBuilder =
    Klv2WHU2z0Dg16Wk503cIncsPIiGTGI Function({
      required String id,
      required String reporteId,
      required String tipo,
      required String nombre,
      required String localPath,
      Value<String?> remoteUrl,
      required DateTime creadoEn,
      Value<int> rowid,
    });
typedef $$ReporteEvidenciasTableTableUpdateCompanionBuilder =
    Klv2WHU2z0Dg16Wk503cIncsPIiGTGI Function({
      Value<String> id,
      Value<String> reporteId,
      Value<String> tipo,
      Value<String> nombre,
      Value<String> localPath,
      Value<String?> remoteUrl,
      Value<DateTime> creadoEn,
      Value<int> rowid,
    });

class VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt
    extends Composer<_Dd6MZrmiYCBX, YoNU9Kgod2bozlWwHlObWuuh62Da> {
  VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get hD => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dZF4DgtNd => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jer7 => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get xLNv7C => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get astdNDXTP => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get to2ZPqpJq => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ojfjtElf => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );
}

class CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO
    extends Composer<_Dd6MZrmiYCBX, YoNU9Kgod2bozlWwHlObWuuh62Da> {
  CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get dp => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dUCTTMpw1 => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qRCv => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uHtfeA => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get haYgM9dmw => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get p7t3mwLTS => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get s4VUb2zc => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk
    extends Composer<_Dd6MZrmiYCBX, YoNU9Kgod2bozlWwHlObWuuh62Da> {
  FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get jA =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get btI139wWk =>
      $composableBuilder(column: $table.reporteId, builder: (column) => column);

  GeneratedColumn<String> get eozo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get hryZZ6 =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get owbrbNWf7 =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get pXmqKdY1X =>
      $composableBuilder(column: $table.remoteUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get iAnfWvkz =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);
}

class Sf1Z3kwfLCbQjPPandg0uNtxTFtxCluH2YKKa3L2Y
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          YoNU9Kgod2bozlWwHlObWuuh62Da,
          MqgZIJIZuGbeC3uaGFcCBQmY7J,
          VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt,
          CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO,
          FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk,
          $$ReporteEvidenciasTableTableCreateCompanionBuilder,
          $$ReporteEvidenciasTableTableUpdateCompanionBuilder,
          (
            MqgZIJIZuGbeC3uaGFcCBQmY7J,
            BaseReferences<
              _Dd6MZrmiYCBX,
              YoNU9Kgod2bozlWwHlObWuuh62Da,
              MqgZIJIZuGbeC3uaGFcCBQmY7J
            >,
          ),
          MqgZIJIZuGbeC3uaGFcCBQmY7J,
          PrefetchHooks Function()
        > {
  Sf1Z3kwfLCbQjPPandg0uNtxTFtxCluH2YKKa3L2Y(
    _Dd6MZrmiYCBX db,
    YoNU9Kgod2bozlWwHlObWuuh62Da table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> reporteId = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => Klv2WHU2z0Dg16Wk503cIncsPIiGTGI(
                sU: id,
                bY6ZOF0uo: reporteId,
                qS2I: tipo,
                p7B4JY: nombre,
                cOvZFXOUU: localPath,
                v8hFsLNip: remoteUrl,
                wFJWeFsv: creadoEn,
                nZy2D: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String reporteId,
                required String tipo,
                required String nombre,
                required String localPath,
                Value<String?> remoteUrl = const Value.absent(),
                required DateTime creadoEn,
                Value<int> rowid = const Value.absent(),
              }) => Klv2WHU2z0Dg16Wk503cIncsPIiGTGI.insert(
                id: id,
                reporteId: reporteId,
                tipo: tipo,
                nombre: nombre,
                localPath: localPath,
                v8hFsLNip: remoteUrl,
                creadoEn: creadoEn,
                nZy2D: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReporteEvidenciasTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      YoNU9Kgod2bozlWwHlObWuuh62Da,
      MqgZIJIZuGbeC3uaGFcCBQmY7J,
      VAmvj6zSKXduXKYuc26Zd67UoX2gPYVpcreUPKyciFt,
      CjAHufGHu2HF7XJvpcbPs2Ng2NJymLiQOdQMlTUgt2VnO,
      FqaHMh6aHqtuPYGna7I3gM3VzFJvhrzgKkpaiPD4JE2EJPk,
      $$ReporteEvidenciasTableTableCreateCompanionBuilder,
      $$ReporteEvidenciasTableTableUpdateCompanionBuilder,
      (
        MqgZIJIZuGbeC3uaGFcCBQmY7J,
        BaseReferences<
          _Dd6MZrmiYCBX,
          YoNU9Kgod2bozlWwHlObWuuh62Da,
          MqgZIJIZuGbeC3uaGFcCBQmY7J
        >,
      ),
      MqgZIJIZuGbeC3uaGFcCBQmY7J,
      PrefetchHooks Function()
    >;
typedef $$ReporteParticipantesTableTableCreateCompanionBuilder =
    T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU Function({
      required String reporteId,
      required String userId,
      required String rol,
      Value<int> rowid,
    });
typedef $$ReporteParticipantesTableTableUpdateCompanionBuilder =
    T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU Function({
      Value<String> reporteId,
      Value<String> userId,
      Value<String> rol,
      Value<int> rowid,
    });

class M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy
    extends Composer<_Dd6MZrmiYCBX, SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp> {
  M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cyhlo0QRV => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hMzLnq => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gaG => $composableBuilder(
    column: $table.rol,
    builder: (column) => ColumnFilters(column),
  );
}

class ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K
    extends Composer<_Dd6MZrmiYCBX, SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp> {
  ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get gtogRz7Vz => $composableBuilder(
    column: $table.reporteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wQsQPm => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iId => $composableBuilder(
    column: $table.rol,
    builder: (column) => ColumnOrderings(column),
  );
}

class NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5
    extends Composer<_Dd6MZrmiYCBX, SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp> {
  NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get dBcHS7WdW =>
      $composableBuilder(column: $table.reporteId, builder: (column) => column);

  GeneratedColumn<String> get ncindi =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get usV =>
      $composableBuilder(column: $table.rol, builder: (column) => column);
}

class BxcPT2iRxD4KG63YNCUvR5DQB77t4U1GbDwilzVxDqEq
    extends
        RootTableManager<
          _Dd6MZrmiYCBX,
          SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
          IKHFzRDpgFzjhWij3nsPu1GdzStvW,
          M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy,
          ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K,
          NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5,
          $$ReporteParticipantesTableTableCreateCompanionBuilder,
          $$ReporteParticipantesTableTableUpdateCompanionBuilder,
          (
            IKHFzRDpgFzjhWij3nsPu1GdzStvW,
            BaseReferences<
              _Dd6MZrmiYCBX,
              SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
              IKHFzRDpgFzjhWij3nsPu1GdzStvW
            >,
          ),
          IKHFzRDpgFzjhWij3nsPu1GdzStvW,
          PrefetchHooks Function()
        > {
  BxcPT2iRxD4KG63YNCUvR5DQB77t4U1GbDwilzVxDqEq(
    _Dd6MZrmiYCBX db,
    SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> reporteId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> rol = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU(
                c7fchPBLA: reporteId,
                bokW9m: userId,
                mIv: rol,
                eQbrO: rowid,
              ),
          createCompanionCallback:
              ({
                required String reporteId,
                required String userId,
                required String rol,
                Value<int> rowid = const Value.absent(),
              }) => T6ALUTcZLck9rxYU2GPWimUVwYf0kswCXU.insert(
                reporteId: reporteId,
                userId: userId,
                rol: rol,
                eQbrO: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReporteParticipantesTableTableProcessedTableManager =
    ProcessedTableManager<
      _Dd6MZrmiYCBX,
      SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
      IKHFzRDpgFzjhWij3nsPu1GdzStvW,
      M88DHvYx6rhr8x7ep1XFbPWWTpABvrwuQqAu4UayMQAMAy,
      ChL4w5bpk5pRKBP3HM2N3yZSye7NZry4mi5wtwmuU8Hbh37K,
      NkZz5vgwUg6cowVFTJa0xaqTagvVhAsBN3fTZYpPMqvSsgoTq5,
      $$ReporteParticipantesTableTableCreateCompanionBuilder,
      $$ReporteParticipantesTableTableUpdateCompanionBuilder,
      (
        IKHFzRDpgFzjhWij3nsPu1GdzStvW,
        BaseReferences<
          _Dd6MZrmiYCBX,
          SFzuWgGDvgjTyXezrerjfdXoB2Lf0Rp,
          IKHFzRDpgFzjhWij3nsPu1GdzStvW
        >,
      ),
      IKHFzRDpgFzjhWij3nsPu1GdzStvW,
      PrefetchHooks Function()
    >;

class VAZmCx0OIEHlhQoQlgP {
  final _Dd6MZrmiYCBX _bE;
  VAZmCx0OIEHlhQoQlgP(this._bE);
  USyXMn8kBYazqEYKNhgqxJdeXQfCoJ069L get rkRGgRKJ4cIRhxd =>
      USyXMn8kBYazqEYKNhgqxJdeXQfCoJ069L(_bE, _bE.fl4K2o4z8EmVE6Q);
  Ewpgy5OBYu5LdV6pG4iF2VAdfDSeSiZBpniyJQlcrqex get pZ8sFMP6dFmxib5NOwHdAbM7B =>
      Ewpgy5OBYu5LdV6pG4iF2VAdfDSeSiZBpniyJQlcrqex(
        _bE,
        _bE.oUFGqb3kTTei6pB1c72oFuUjt,
      );
  XmKM7mJUfyyob2FBA8NA2ouhEvDRtBtSrJdUr get rXoR00fmPrApVdn83D =>
      XmKM7mJUfyyob2FBA8NA2ouhEvDRtBtSrJdUr(_bE, _bE.cunYqbc3Zd0Chxytm9);
  QQYmbrOUojO1LCI6T1mtQoHJE7MozAsyK get reDicVqdGcIxSq =>
      QQYmbrOUojO1LCI6T1mtQoHJE7MozAsyK(_bE, _bE.p8RGehv9uW7gdv);
  RXAwq0eA5rYKGJP6ffVlZey1j6uJGi get z8fYqPiONtq =>
      RXAwq0eA5rYKGJP6ffVlZey1j6uJGi(_bE, _bE.khGDx8OWIxU);
  OhLrvy21dgQpe5CrGealKCZN5wqeQzN4piRajLip get nPfxa64d5WYPwAqfeIWYa =>
      OhLrvy21dgQpe5CrGealKCZN5wqeQzN4piRajLip(_bE, _bE.jU5VEJTz8C7WwoYYJfIlQ);
  JRyab0RH1yVc9r4UYfGwU8efnxpSej9fSfG0J get uxpx1KevFJIqd0JoGl =>
      JRyab0RH1yVc9r4UYfGwU8efnxpSej9fSfG0J(_bE, _bE.qaBIf6ei74qAD99wRU);
  L9Cwg4F4onK9DCEquZG1DiPl95OEOSX7 get sofplN7VZmlMe =>
      L9Cwg4F4onK9DCEquZG1DiPl95OEOSX7(_bE, _bE.tPzD7WczXfidC);
  GF66RA5rabIZvclHzKEKptPjs6orzcFsxrW9RriGE4 get uusxiwdslQntl2WA2aKEZE3 =>
      GF66RA5rabIZvclHzKEKptPjs6orzcFsxrW9RriGE4(
        _bE,
        _bE.kBIHzP5TOGzWkh2wMx36lse,
      );
  Sf1Z3kwfLCbQjPPandg0uNtxTFtxCluH2YKKa3L2Y get eLnD6CWqOo6pdniecrefNK =>
      Sf1Z3kwfLCbQjPPandg0uNtxTFtxCluH2YKKa3L2Y(
        _bE,
        _bE.mE07WRLPfW2zDpFYLRNsjU,
      );
  BxcPT2iRxD4KG63YNCUvR5DQB77t4U1GbDwilzVxDqEq get y1MbrKFWOfR0rg6UYq6ttzeyI =>
      BxcPT2iRxD4KG63YNCUvR5DQB77t4U1GbDwilzVxDqEq(
        _bE,
        _bE.xjLgqdIBlhdS5VmEqfZsjcQvX,
      );
}
