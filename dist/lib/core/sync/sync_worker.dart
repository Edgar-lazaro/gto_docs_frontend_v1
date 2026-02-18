import 'package:drift/drift.dart';
import 'package:dio/dio.dart';

import '../database/app_database.dart';
import '../network/lan_status.dart';
import '../sync/sync_service.dart';
import '../../modules/notificacions/data/notificacion_repository_impl.dart';
import '../../modules/notificacions/domain/notificacion.dart';

class LKUO7gQ6CD {
  final AppDatabase tz;
  final SyncService iSLajur;
  final NotificacionRepository vqn2Ij6l7vO3Tqq1;

  LKUO7gQ6CD({
    required this.tz,
    required this.iSLajur,
    required this.vqn2Ij6l7vO3Tqq1,
  });

  Future<void> bNa(LanStatus lanStatus) async {
    if (lanStatus != LanStatus.connected) return;

    final pendientes =
        await (tz.select(tz.syncQueueTable)
              ..where((q) => q.procesado.equals(false))
              ..orderBy([(q) => OrderingTerm.asc(q.createdAt)]))
            .get();

    for (final item in pendientes) {
      try {
        // ignore: avoid_print
        print(
          '[SYNC] Procesando ${item.entidad}:${item.accion} id=${item.entidadId}',
        );
        // ASISTENCIA
        if (item.entidad == 'asistencia' && item.accion == 'create') {
          await iSLajur.syncAsistencia(int.parse(item.entidadId));
        }

        // GLPI TICKET
        if (item.entidad == 'glpi_ticket' &&
            item.accion == 'create' &&
            item.payload != null) {
          await iSLajur.syncGlpiTicket(item.payload!);
        }

        // REPORTE
        if (item.entidad == 'reporte' &&
            item.accion == 'create' &&
            item.payload != null) {
          await iSLajur.syncReporte(item.payload!);
        }

        // COMENTARIO DE REPORTE
        if (item.entidad == 'reporte_comentario' &&
            item.accion == 'create' &&
            item.payload != null) {
          await iSLajur.syncReporteComentario(item.payload!);
        }

        // EVIDENCIA
        if (item.entidad == 'reporte_evidencia' &&
            item.accion == 'upload' &&
            item.payload != null) {
          await iSLajur.syncReporteEvidencia(item.payload!);
        }

        // TAREA
        if (item.entidad == 'tarea' &&
            item.accion == 'create' &&
            item.payload != null) {
          final remote = await iSLajur.syncTarea(item.payload!);
          final remoteId = remote?['id']?.toString();
          if (remoteId != null && remoteId.isNotEmpty) {
            final updated =
                await (tz.update(tz.tareasTable)
                      ..where((t) => t.id.equals(item.entidadId)))
                    .write(TareasTableCompanion(remoteId: Value(remoteId)));

            if (updated == 0) {
              // ignore: avoid_print
              print(
                '[SYNC] WARN tarea:create no existe local id=${item.entidadId} para guardar remoteId=$remoteId',
              );
            }
          }
        }

        // CAMBIO DE ESTADO DE TAREA
        if (item.entidad == 'tarea' &&
            item.accion == 'update_estado' &&
            item.payload != null) {
          await iSLajur.syncTareaEstado(item.payload!);
        }

        // COMENTARIO DE TAREA
        if (item.entidad == 'tarea_comentario' &&
            item.accion == 'create' &&
            item.payload != null) {
          await iSLajur.syncTareaComentario(item.payload!);
        }

        // ADJUNTO DE TAREA
        if (item.entidad == 'tarea_adjunto' &&
            item.accion == 'upload' &&
            item.payload != null) {
          await iSLajur.syncTareaAdjunto(item.payload!);
        }

        // COMBUSTIBLE
        if (item.entidad == 'combustible_registro' &&
            item.accion == 'create' &&
            item.payload != null) {
          await _zwFInAGM7m2fiphWfM5(item);
        }

        // CAMBIO DE ESTADO DE REPORTE (backend → app)
        if (item.entidad == 'reporte_estado' && item.payload != null) {
          // aquí también podrías actualizar el reporte local

          await vqn2Ij6l7vO3Tqq1.crear(
            tipo: NotificacionTipo.reporte.name,
            titulo: 'Reporte resuelto',
            mensaje: 'Tu reporte fue marcado como resuelto',
            referenciaId: item.entidadId,
          );
        }

        // NOTIFICACIÓN REMOTA
        if (item.entidad == 'notificacion' && item.payload != null) {
          await vqn2Ij6l7vO3Tqq1.crear(
            tipo: NotificacionTipo.sistema.name,
            titulo: item.payload!['titulo'] as String,
            mensaje: item.payload!['mensaje'] as String,
            referenciaId: item.entidadId,
          );
        }

        // RESULTADO IA
        if (item.entidad == 'ia_resultado' && item.payload != null) {
          // aquí luego podrás actualizar prioridad, responsables, etc.

          await vqn2Ij6l7vO3Tqq1.crear(
            tipo: NotificacionTipo.sistema.name,
            titulo: 'Clasificación automática',
            mensaje: 'IA asignó prioridad y responsables',
            referenciaId: item.entidadId,
          );
        }

        // ✅ MARCAR COMO PROCESADO
        await (tz.update(tz.syncQueueTable)..where((q) => q.id.equals(item.id)))
            .write(const SyncQueueTableCompanion(procesado: Value(true)));

        // ignore: avoid_print
        print('[SYNC] OK ${item.entidad}:${item.accion} id=${item.entidadId}');
      } catch (e) {
        // ignore: avoid_print
        print(
          '[SYNC] ERROR ${item.entidad}:${item.accion} id=${item.entidadId} -> $e',
        );
        // GLPI no debe bloquear el resto de sincronización.
        // Se reintentará en la siguiente corrida (queda como no-procesado).
        if (item.entidad == 'glpi_ticket') {
          continue;
        }

        // Para el resto, si falla uno se detiene y se reintentará después.
        break;
      }
    }
  }

  Future<void> cbXIKoh8LV2R2Xesjr() async {
    final pendientes =
        await (tz.select(tz.syncQueueTable)
              ..where((q) {
                return q.procesado.equals(false) &
                    q.entidad.equals('combustible_registro');
              })
              ..orderBy([(q) => OrderingTerm.asc(q.createdAt)]))
            .get();

    for (final item in pendientes) {
      try {
        // ignore: avoid_print
        print('[SYNC] Procesando combustible:create id=${item.entidadId}');

        if (item.payload != null) {
          await _zwFInAGM7m2fiphWfM5(item);
        }

        await (tz.update(tz.syncQueueTable)..where((q) => q.id.equals(item.id)))
            .write(const SyncQueueTableCompanion(procesado: Value(true)));

        // ignore: avoid_print
        print('[SYNC] OK combustible:create id=${item.entidadId}');
      } catch (e) {
        // ignore: avoid_print
        print('[SYNC] ERROR combustible:create id=${item.entidadId} -> $e');
        // Sigue con el siguiente para no bloquear el resto.
        continue;
      }
    }
  }

  Future<void> _zwFInAGM7m2fiphWfM5(SyncQueueTableData item) async {
    try {
      final res = await iSLajur.syncCombustibleRegistro(item.payload!);

      String jTNgXJS5W(dynamic data) {
        if (data == null) return '';
        final s = data is String ? data : data.toString();
        return s.length > 1200 ? '${s.substring(0, 1200)}…' : s;
      }

      final infoParts = <String>[
        'OK',
        if (res?.statusCode != null) 'status:${res!.statusCode}',
        if ((res?.data) != null) jTNgXJS5W(res!.data),
      ];
      final info = infoParts.where((p) => p.trim().isNotEmpty).join(' | ');

      await (tz.update(
        tz.combustibleRegistrosTable,
      )..where((t) => t.id.equals(item.entidadId))).write(
        CombustibleRegistrosTableCompanion(
          sincronizado: const Value(true),
          syncError: const Value.absent(),
          syncInfo: Value(info.isEmpty ? 'OK' : info),
        ),
      );
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final data = e.response?.data;
      final dataStr = data == null
          ? ''
          : (data is String ? data : data.toString());
      final trimmed = dataStr.length > 800
          ? '${dataStr.substring(0, 800)}…'
          : dataStr;
      final uri = e.requestOptions.uri.toString();
      final underlying = e.error?.toString() ?? '';

      final message = <String>[
        'dio:${e.type}',
        if (uri.isNotEmpty) 'url:$uri',
        if (status != null) 'status:$status',
        if ((e.message ?? '').isNotEmpty) e.message!,
        if (underlying.isNotEmpty) underlying,
        if (trimmed.isNotEmpty) trimmed,
      ].join(' | ');

      await (tz.update(
        tz.combustibleRegistrosTable,
      )..where((t) => t.id.equals(item.entidadId))).write(
        CombustibleRegistrosTableCompanion(
          syncError: Value(message),
          syncInfo: const Value.absent(),
        ),
      );

      rethrow;
    } catch (e) {
      // Captura errores de validación/locales (ej. falta vehiculo en payload viejo)
      // para que el historial muestre el motivo real del fallo.
      final msg = e.toString();
      await (tz.update(
        tz.combustibleRegistrosTable,
      )..where((t) => t.id.equals(item.entidadId))).write(
        CombustibleRegistrosTableCompanion(
          syncError: Value(
            msg.length > 800 ? '${msg.substring(0, 800)}…' : msg,
          ),
          syncInfo: const Value.absent(),
        ),
      );
      rethrow;
    }
  }
}
