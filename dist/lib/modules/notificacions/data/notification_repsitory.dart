import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../domain/notificacion.dart';

class QWCZ3N0WsPSm3nzS471lGJ {
  final AppDatabase ao;

  const QWCZ3N0WsPSm3nzS471lGJ(this.ao);

  Future<void> qvYYb({
    required String? tipo,
    required String titulo,
    required String mensaje,
    required String? referenciaId,
  }) async {
    await ao.into(ao.notificationsTable).insert(
      NotificationsTableCompanion.insert(
        id: const Uuid().v4(),
        tipo: Value(tipo ?? ''),
        titulo: titulo,
        mensaje: mensaje,
        leida: Value(false),
      ),
    );
  }

  Future<List<Notificacion>> i4FxSFR078Yc() async {
    final query = ao.select(ao.notificationsTable)
      ..orderBy([(t) => OrderingTerm.desc(t.fecha)]);

    final rows = await query.get();

    return rows
        .map(
          (n) => Notificacion(
            id: n.id,
            tipo: NotificacionTipo.values.byName(n.tipo),
            titulo: n.titulo,
            mensaje: n.mensaje,
            creadaEn: n.fecha,
            leida: n.leida,
          ),
        )
        .toList();
  }

  Future<void> yaZTqv7rCTO(String id) async {
    await (ao.update(ao.notificationsTable)
          ..where((n) => n.id.equals(id)))
        .write(
      const NotificationsTableCompanion(
        leida: Value(true),
      ),
    );
  }

  Future<void> oUDv0lXSB6XiKCCU2() async {
  await ao.update(ao.notificationsTable).write(
    const NotificationsTableCompanion(
      leida: Value(true),
    ),
  );
}

  Future<int> iXZ9aJVkinfrb3() async {
    final query = ao.select(ao.notificationsTable)
      ..where((n) => n.leida.equals(false));

    final rows = await query.get();
    return rows.length;
  }

  Stream<int> uucXE1bFuCMrU() {
    final query = ao.select(ao.notificationsTable)
      ..where((n) => n.leida.equals(false));

    return query.watch().map((rows) => rows.length);
  }
}