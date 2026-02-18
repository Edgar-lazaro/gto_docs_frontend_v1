import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/asistencia.dart';
import '../domain/asistencia_repository.dart';

class K0WQpasZb3yUjqQaJp48moMa implements AsistenciaRepository {
  final AppDatabase by;

  K0WQpasZb3yUjqQaJp48moMa(this.by);

  @override
  Future<void> registrar({
    required String usuarioId,
    required TipoAsistencia tipo,
    required String metodo,
  }) async {
    // Insertar asistencia local
    final id = await by.into(by.asistenciaTable).insert(
          AsistenciaTableCompanion.insert(
            usuarioId: usuarioId,
            fechaHora: DateTime.now(),
            tipo: tipo.name, // entrada | salida
            metodo: Value(metodo), // manual / biometrico
            sincronizado: const Value(false),
          ),
        );

    // Encolar para sincronización
    await by.into(by.syncQueueTable).insert(
          SyncQueueTableCompanion.insert(
            entidad: 'asistencia',
            entidadId: id.toString(),
            accion: 'create',
            payload: const Value(null),
          ),
        );
  }

  @override
  Future<List<Asistencia>> obtenerHistorial(String usuarioId) async {
    final rows = await (by.select(by.asistenciaTable)
          ..where((a) => a.usuarioId.equals(usuarioId))
          ..orderBy([(a) => OrderingTerm.desc(a.fechaHora)]))
        .get();

    return rows
        .map(
          (a) => Asistencia(
            id: a.id,
            usuarioId: a.usuarioId,
            fechaHora: a.fechaHora,
            tipo: TipoAsistencia.values.byName(a.tipo),
            metodo: a.metodo,
            sincronizado: a.sincronizado,
          ),
        )
        .toList();
  }
}