import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/glpi_repository.dart';
import '../domain/glpi_ticket.dart';

class FE4ECib5JxlhxZgH1C implements GlpiRepository {
  final AppDatabase wg;

  FE4ECib5JxlhxZgH1C({required this.wg});

  @override
  Future<void> crearTicket(GlpiTicket ticket, {String? entidadId}) async {
    await wg.into(wg.syncQueueTable).insert(
      SyncQueueTableCompanion.insert(
        entidad: 'glpi_ticket',
        entidadId: (entidadId != null && entidadId.trim().isNotEmpty)
            ? entidadId.trim()
            : DateTime.now().millisecondsSinceEpoch.toString(),
        accion: 'create',
        payload: Value(ticket.toJson()),
      ),
    );
  }
}