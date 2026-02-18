import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/reporte.dart';
import '../domain/reporte_repository.dart';

class L2RAjl5bhcxxtT2tSP9ap implements ReporteRepository {
  final AppDatabase tt;
  final Dio? pVn;

  L2RAjl5bhcxxtT2tSP9ap({required this.tt, this.pVn});

  @override
  Future<void> crearReporte(Reporte reporte) async {
    //  Guardar local
    await tt
        .into(tt.reportesTable)
        .insert(
          ReportesTableCompanion.insert(
            id: reporte.id,
            titulo: reporte.titulo,
            descripcion: reporte.descripcion,
            categoria: reporte.categoria,
            area: reporte.area,
            activo: Value(reporte.activo),
            ubicacion: Value(reporte.ubicacion),
            creadoPor: reporte.creadoPor,
            creadoEn: reporte.creadoEn,
            estado: reporte.estado.asString,
            glpiTicketId: Value(reporte.glpiTicketId),
            metadata: Value(
              reporte.metadata != null ? jsonEncode(reporte.metadata) : null,
            ),
          ),
        );

    // Agregar a SyncQueue → backend creará ticket GLPI
    await tt
        .into(tt.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entidad: 'reporte',
            entidadId: reporte.id,
            accion: 'create',
            payload: Value({
              'id': reporte.id,
              'titulo': reporte.titulo,
              'descripcion': reporte.descripcion,
              'area': reporte.area,
              'estado': reporte.estado.asString,
              'creadorId': reporte.creadoPor,
              'usuarioId': reporte.creadoPor,
            }),
          ),
        );
  }

  @override
  Future<List<Reporte>> obtenerReportes() async {
    // Primero lo local (offline-first)
    var local = await _bYc7uVAyr();

    // Si hay backend configurado, intentamos traer y hacer upsert en local
    if (pVn != null) {
      try {
        final remote = await _ivjPAGEYXA9bs1siBvd();
        if (remote.isNotEmpty) {
          await _l0plWa9lADlIS4mQ9om45(remote);
          local = await _bYc7uVAyr();
        }
      } catch (_) {
        // Si falla el backend, dejamos lo local.
      }
    }

    return local;
  }

  Future<List<Reporte>> _bYc7uVAyr() async {
    final rows = await tt.select(tt.reportesTable).get();

    return rows.map((r) {
      return Reporte(
        id: r.id,
        titulo: r.titulo,
        descripcion: r.descripcion,
        categoria: r.categoria,
        area: r.area,
        activo: r.activo,
        ubicacion: r.ubicacion,
        creadoPor: r.creadoPor,
        creadoEn: r.creadoEn,
        estado: ReporteEstadoX.fromString(r.estado),
        glpiTicketId: r.glpiTicketId,
        metadata: r.metadata != null ? jsonDecode(r.metadata!) : null,
      );
    }).toList();
  }

  Future<List<Map<String, dynamic>>> _ivjPAGEYXA9bs1siBvd() async {
    final candidates = <String>['/reportes', '/reporte'];

    Object? lastError;
    for (final path in candidates) {
      try {
        final res = await pVn!.get(path);
        final list = _iy2VIjcsoBz(res.data);
        return list;
      } catch (e) {
        lastError = e;
      }
    }
    throw lastError ?? Exception('No se pudo obtener reportes');
  }

  List<Map<String, dynamic>> _iy2VIjcsoBz(dynamic data) {
    dynamic root = data;
    if (root is Map<String, dynamic>) {
      root = root['data'] ?? root['items'] ?? root['result'] ?? root;
    }

    if (root is List) {
      return root
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }

    if (root is Map<String, dynamic>) {
      final inner = root['data'] ?? root['items'] ?? root['result'];
      if (inner is List) {
        return inner
            .whereType<Map>()
            .map((e) => Map<String, dynamic>.from(e))
            .toList();
      }
    }

    return const <Map<String, dynamic>>[];
  }

  Future<void> _l0plWa9lADlIS4mQ9om45(List<Map<String, dynamic>> remote) async {
    for (final r in remote) {
      final id = (r['id'] ?? '').toString();
      if (id.isEmpty) continue;

      final titulo = (r['titulo'] ?? '').toString();
      final descripcion = (r['descripcion'] ?? '').toString();
      final area = (r['area'] ?? '').toString();
      final estadoStr = (r['estado'] ?? 'enviado').toString();
      final creadorId = (r['creadorId'] ?? r['usuarioId'] ?? 'unknown')
          .toString();

      final createdAtRaw = r['createdAt'];
      DateTime creadoEn;
      if (createdAtRaw is String) {
        creadoEn = DateTime.tryParse(createdAtRaw) ?? DateTime.now();
      } else {
        creadoEn = DateTime.now();
      }

      // El schema del backend no trae estos campos; usamos defaults razonables.
      final categoria = (r['categoria'] ?? 'General').toString();

      await tt
          .into(tt.reportesTable)
          .insert(
            ReportesTableCompanion.insert(
              id: id,
              titulo: titulo,
              descripcion: descripcion,
              categoria: categoria,
              area: area,
              activo: const Value(null),
              ubicacion: const Value(null),
              creadoPor: creadorId,
              creadoEn: creadoEn,
              estado: ReporteEstadoX.fromString(estadoStr).asString,
              glpiTicketId: const Value(null),
              metadata: const Value(null),
            ),
            mode: InsertMode.insertOrReplace,
          );
    }
  }
}
