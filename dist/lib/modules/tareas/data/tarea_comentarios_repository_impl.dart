import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../domain/tarea_comentario.dart';

class WbpePJ3kboJ3Y0p7htts0KrLP1 {
  final AppDatabase dw;

  WbpePJ3kboJ3Y0p7htts0KrLP1(this.dw);

  Future<void> snZH27bTrGSA7uSjV({
    required String tareaId,
    required String autorId,
    required String mensaje,
  }) async {
    final c = TareaComentario(
      id: const Uuid().v4(),
      tareaId: tareaId,
      autorId: autorId,
      mensaje: mensaje,
      creadoEn: DateTime.now(),
    );

    await dw
        .into(dw.tareaComentariosTable)
        .insert(
          TareaComentariosTableCompanion.insert(
            id: c.id,
            tareaId: c.tareaId,
            autorId: c.autorId,
            mensaje: c.mensaje,
            creadoEn: c.creadoEn,
          ),
        );

    await dw
        .into(dw.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'tarea_comentario',
            entidadId: c.id,
            accion: 'create',
            payload: Value({
              'id': c.id,
              'tareaId': c.tareaId,
              'usuarioId': c.autorId,
              'mensaje': c.mensaje,
            }),
          ),
        );
  }

  Stream<List<TareaComentario>> kXjwA2jXQtC2xtX(String tareaId) {
    return (dw.select(dw.tareaComentariosTable)
          ..where((c) => c.tareaId.equals(tareaId))
          ..orderBy([(c) => OrderingTerm.asc(c.creadoEn)]))
        .watch()
        .map(
          (rows) => rows
              .map(
                (r) => TareaComentario(
                  id: r.id,
                  tareaId: r.tareaId,
                  autorId: r.autorId,
                  mensaje: r.mensaje,
                  creadoEn: r.creadoEn,
                ),
              )
              .toList(growable: false),
        );
  }
}
