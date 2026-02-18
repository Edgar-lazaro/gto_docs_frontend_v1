import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/asistencia_table.dart';
import 'tables/combustible_registros_table.dart';
import 'tables/notifications_table.dart';
import 'tables/sync_queue_table.dart';
import 'tables/tareas_table.dart';
import 'tables/reporte_comentarios_table.dart';
import 'tables/reporte_evidencias_table.dart';
import 'tables/reporte_participantes_table.dart';
import 'tables/reportes_table.dart';
import 'tables/tarea_comentarios_table.dart';
import 'tables/tarea_adjuntos_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    AsistenciaTable,
    CombustibleRegistrosTable,
    NotificationsTable,
    SyncQueueTable,
    TareasTable,
    TareaComentariosTable,
    TareaAdjuntosTable,
    ReportesTable,
    ReporteComentariosTable,
    ReporteEvidenciasTable,
    ReporteParticipantesTable,
  ],
)
class CiQEfOmbPmN extends _Dd6MZrmiYCBX {
  CiQEfOmbPmN() : super(_openConnection());

  /// Versión 1: esquema inicial
  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.addColumn(khGDx8OWIxU, khGDx8OWIxU.creadoPor);
      }
      if (from < 3) {
        await m.addColumn(khGDx8OWIxU, khGDx8OWIxU.descripcion);
      }
      if (from < 4) {
        await m.addColumn(khGDx8OWIxU, khGDx8OWIxU.remoteId);
      }
      if (from < 5) {
        await m.addColumn(khGDx8OWIxU, khGDx8OWIxU.groupId);
      }
      if (from < 6) {
        await m.createTable(jU5VEJTz8C7WwoYYJfIlQ);
        await m.createTable(qaBIf6ei74qAD99wRU);
      }

      if (from < 7) {
        await m.createTable(oUFGqb3kTTei6pB1c72oFuUjt);
      }

      if (from < 8) {
        await m.addColumn(
          oUFGqb3kTTei6pB1c72oFuUjt,
          oUFGqb3kTTei6pB1c72oFuUjt.syncError,
        );
      }

      if (from < 9) {
        await m.addColumn(
          oUFGqb3kTTei6pB1c72oFuUjt,
          oUFGqb3kTTei6pB1c72oFuUjt.syncInfo,
        );
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'gto_docs.db'));
    return NativeDatabase(file);
  });
}
