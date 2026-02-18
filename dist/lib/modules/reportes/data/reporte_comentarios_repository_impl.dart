import 'package:drift/drift.dart';

import 'package:gto_docs_v2_ad/core/database/app_database.dart';
import 'package:gto_docs_v2_ad/modules/reportes/domain/reporte_comentario.dart';

class IT74gf7ttgWdSEinAoqVCYTfmC9i {
  final AppDatabase l4;

  IT74gf7ttgWdSEinAoqVCYTfmC9i(this.l4);

  Future<void> ddGByN2tSsBB68j6A(ReporteComentario c) async {
    await l4
        .into(l4.reporteComentariosTable)
        .insert(
          ReporteComentariosTableCompanion.insert(
            id: c.id,
            reporteId: c.reporteId,
            autorId: c.autorId,
            mensaje: c.mensaje,
            creadoEn: c.creadoEn,
          ),
        );

    await l4
        .into(l4.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'reporte_comentario',
            entidadId: c.id,
            accion: 'create',
            payload: Value({
              'id': c.id,
              'reporteId': c.reporteId,
              'usuarioId': c.autorId,
              'mensaje': c.mensaje,
            }),
          ),
        );
  }
}
