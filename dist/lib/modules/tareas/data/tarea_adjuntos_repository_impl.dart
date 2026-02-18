import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../domain/tarea_adjunto.dart';

class IpwipU2fEn4NVODke7Zr8A4 {
  final AppDatabase bU;

  IpwipU2fEn4NVODke7Zr8A4(this.bU);

  Future<void> dAY90mcuKf0R7F({
    required String tareaId,
    required TareaAdjuntoTipo tipo,
    required String nombre,
    required String localPath,
    String? mimeType,
  }) async {
    final a = TareaAdjunto(
      id: const Uuid().v4(),
      tareaId: tareaId,
      tipo: tipo,
      nombre: nombre,
      localPath: localPath,
      mimeType: mimeType,
      remoteUrl: null,
      creadoEn: DateTime.now(),
    );

    await bU
        .into(bU.tareaAdjuntosTable)
        .insert(
          TareaAdjuntosTableCompanion.insert(
            id: a.id,
            tareaId: a.tareaId,
            tipo: a.tipo.name,
            nombre: a.nombre,
            localPath: a.localPath,
            mimeType: Value(a.mimeType),
            remoteUrl: const Value.absent(),
            creadoEn: a.creadoEn,
          ),
        );

    await bU
        .into(bU.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'tarea_adjunto',
            entidadId: a.id,
            accion: 'upload',
            payload: Value({
              'id': a.id,
              'tareaId': a.tareaId,
              'tipo': a.tipo.name,
              'nombre': a.nombre,
              'localPath': a.localPath,
              if (a.mimeType != null) 'mimeType': a.mimeType,
            }),
          ),
        );
  }

  Stream<List<TareaAdjunto>> hnGLtSIPUnj9wkv(String tareaId) {
    return (bU.select(bU.tareaAdjuntosTable)
          ..where((a) => a.tareaId.equals(tareaId))
          ..orderBy([(a) => OrderingTerm.asc(a.creadoEn)]))
        .watch()
        .map(
          (rows) => rows
              .map(
                (r) => TareaAdjunto(
                  id: r.id,
                  tareaId: r.tareaId,
                  tipo: TareaAdjuntoTipo.values.byName(r.tipo),
                  nombre: r.nombre,
                  localPath: r.localPath,
                  mimeType: r.mimeType,
                  remoteUrl: r.remoteUrl,
                  creadoEn: r.creadoEn,
                ),
              )
              .toList(growable: false),
        );
  }
}
