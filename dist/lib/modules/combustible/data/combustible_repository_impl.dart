import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';

class N7ryjQbQHaTbZcmZy6MwR {
  final AppDatabase j6;

  N7ryjQbQHaTbZcmZy6MwR(this.j6);

  Stream<List<CombustibleRegistrosTableData>> gMdD8Ei3rHejfR() {
    final query = j6.select(j6.combustibleRegistrosTable)
      ..orderBy([
        (t) => OrderingTerm(expression: t.creadoEn, mode: OrderingMode.desc),
      ]);
    return query.watch();
  }

  Stream<int> vrqvpgNUrkUJ3r4Ct9fT() {
    final q = j6.selectOnly(j6.combustibleRegistrosTable)
      ..addColumns([j6.combustibleRegistrosTable.id.count()])
      ..where(j6.combustibleRegistrosTable.sincronizado.equals(false));

    return q.watchSingle().map((row) {
      return row.read(j6.combustibleRegistrosTable.id.count()) ?? 0;
    });
  }

  Future<String> pUsacB2aUz1h3kcy3X({
    required String usuarioId,
    required String nombre,
    required String destino,
    String? gerenciaNombre,
    int? gerenciaId,
    String? vehiculo,
    String? horaInicio,
    String? combustibleInicial,
    int? kilometrajeInicial,
    String? horaFinal,
    String? combustibleFinal,
    int? kilometrajeFinal,
    Map<String, dynamic>? metadata,
  }) async {
    final id = const Uuid().v4();

    final mergedMetadata = <String, dynamic>{
      if (metadata != null) ...metadata,
      if (vehiculo != null && vehiculo.trim().isNotEmpty)
        'vehiculo': vehiculo.trim(),
    };

    final payload = <String, dynamic>{
      'id': id,
      'usuarioId': usuarioId,
      'modo': 'usar_vehiculo',
      'nombre': nombre,
      'destino': destino,
      if (gerenciaNombre != null && gerenciaNombre.trim().isNotEmpty)
        'gerencia': gerenciaNombre.trim(),
      if (gerenciaId != null) 'gerenciaId': gerenciaId,
      if (vehiculo != null && vehiculo.trim().isNotEmpty)
        'vehiculo': vehiculo.trim(),
      'horaInicio': horaInicio,
      'horaFinal': horaFinal,
      'combustibleInicial': combustibleInicial,
      'combustibleFinal': combustibleFinal,
      'kilometrajeInicial': kilometrajeInicial,
      'kilometrajeFinal': kilometrajeFinal,
      'metadata': mergedMetadata.isEmpty ? null : mergedMetadata,
    }..removeWhere((_, v) => v == null);

    await j6
        .into(j6.combustibleRegistrosTable)
        .insert(
          CombustibleRegistrosTableCompanion.insert(
            id: id,
            usuarioId: usuarioId,
            modo: 'usar_vehiculo',
            nombre: Value(nombre),
            destino: Value(destino),
            horaInicio: Value(horaInicio),
            horaFinal: Value(horaFinal),
            combustibleInicial: Value(combustibleInicial),
            combustibleFinal: Value(combustibleFinal),
            kilometrajeInicial: Value(kilometrajeInicial),
            kilometrajeFinal: Value(kilometrajeFinal),
            metadata: Value(
              mergedMetadata.isEmpty ? null : jsonEncode(mergedMetadata),
            ),
            sincronizado: const Value(false),
          ),
        );

    await j6
        .into(j6.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'combustible_registro',
            entidadId: id,
            accion: 'create',
            payload: Value(payload),
          ),
        );

    return id;
  }

  Future<String> mJAHRmQYVj5b65jV1gP4nVa({
    required String usuarioId,
    String? fechaCarga,
    required String operador,
    String? vehiculo,
    String? gerenciaNombre,
    int? gerenciaId,
    int? kmAntes,
    int? kmDespues,
    Map<String, dynamic>? metadata,
  }) async {
    final id = const Uuid().v4();
    final mergedMetadata = <String, dynamic>{
      if (metadata != null) ...metadata,
      if (vehiculo != null && vehiculo.trim().isNotEmpty)
        'vehiculo': vehiculo.trim(),
    };
    final payload = <String, dynamic>{
      'id': id,
      'usuarioId': usuarioId,
      'modo': 'cargar_combustible',
      'fechaCarga': fechaCarga,
      'operador': operador,
      if (gerenciaNombre != null && gerenciaNombre.trim().isNotEmpty)
        'gerencia': gerenciaNombre.trim(),
      if (gerenciaId != null) 'gerenciaId': gerenciaId,
      if (vehiculo != null && vehiculo.trim().isNotEmpty)
        'vehiculo': vehiculo.trim(),
      'kmAntes': kmAntes,
      'kmDespues': kmDespues,
      'metadata': mergedMetadata.isEmpty ? null : mergedMetadata,
    }..removeWhere((_, v) => v == null);

    await j6
        .into(j6.combustibleRegistrosTable)
        .insert(
          CombustibleRegistrosTableCompanion.insert(
            id: id,
            usuarioId: usuarioId,
            modo: 'cargar_combustible',
            fechaCarga: Value(fechaCarga),
            operador: Value(operador),
            kmAntes: Value(kmAntes),
            kmDespues: Value(kmDespues),
            metadata: Value(
              mergedMetadata.isEmpty ? null : jsonEncode(mergedMetadata),
            ),
            sincronizado: const Value(false),
          ),
        );

    await j6
        .into(j6.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'combustible_registro',
            entidadId: id,
            accion: 'create',
            payload: Value(payload),
          ),
        );

    return id;
  }
}
