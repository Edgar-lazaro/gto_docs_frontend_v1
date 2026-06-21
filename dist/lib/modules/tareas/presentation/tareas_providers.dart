import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/database/database_providers.dart';
import '../../../core/network/providers.dart';
import '../../notificacions/presentation/notificacion_providers.dart';
import '../../usuarios_glpi/data/glpi_user_model.dart';
import '../data/tarea_adjuntos_repository_impl.dart';
import '../data/tarea_api_repository.dart';
import '../data/tarea_avances_api_repository.dart';
import '../data/tarea_timeline_api_repository.dart';
import '../data/tarea_comentarios_repository_impl.dart';
import '../data/tarea_repository_impl.dart';
import '../data/glpi_ticket_api_repository.dart';
import '../domain/tarea_adjunto.dart';
import '../domain/tarea_comentario.dart';
import '../domain/tarea.dart';
import '../domain/tarea_repository.dart';
import 'tareas_controller.dart';

final tareaRepositoryProvider = Provider<TareaRepository>((ref) {
  return TareaRepositoryImpl(ref.read(appDatabaseProvider));
});

final tareaApiRepositoryProvider = Provider<TareaApiRepository>((ref) {
  return TareaApiRepository(ref.read(dioProvider));
});

final tareasApiProvider = FutureProvider<List<Tarea>>((ref) {
  return ref.read(tareaApiRepositoryProvider).obtenerTodas();
});

final tareasApiPorCreadorProvider =
    FutureProvider.family<List<Tarea>, String>((ref, creadoPor) {
  return ref.read(tareaApiRepositoryProvider).obtenerPorCreador(creadoPor);
});

final tareasApiPorAsignadoProvider =
    FutureProvider.family<List<Tarea>, String>((ref, asignadoA) {
  return ref.read(tareaApiRepositoryProvider).obtenerPorAsignado(asignadoA);
});

final tareaControllerProvider = Provider<TareaController>((ref) {
  return TareaController(
    ref.read(tareaRepositoryProvider),
    ref.read(notificacionRepositoryProvider),
  );
});

final tareaComentariosRepositoryProvider = Provider<TareaComentariosRepository>(
  (ref) {
    return TareaComentariosRepository(ref.read(appDatabaseProvider));
  },
);

final tareaAdjuntosRepositoryProvider = Provider<TareaAdjuntosRepository>((
  ref,
) {
  return TareaAdjuntosRepository(ref.read(appDatabaseProvider));
});

final tareaComentariosProvider =
    StreamProvider.family<List<TareaComentario>, String>((ref, tareaId) {
      return ref
          .read(tareaComentariosRepositoryProvider)
          .watchPorTareaId(tareaId);
    });

final tareaAdjuntosProvider = StreamProvider.family<List<TareaAdjunto>, String>(
  (ref, tareaId) {
    return ref.read(tareaAdjuntosRepositoryProvider).watchPorTareaId(tareaId);
  },
);

final tareasPorAsignadoProvider = FutureProvider.family<List<Tarea>, String>((
  ref,
  asignadoA,
) {
  return ref.read(tareaRepositoryProvider).obtenerPorAsignado(asignadoA);
});

final tareasPorCreadorProvider = FutureProvider.family<List<Tarea>, String>((
  ref,
  creadoPor,
) {
  return ref.read(tareaRepositoryProvider).obtenerPorCreador(creadoPor);
});

final todasLasTareasProvider = FutureProvider<List<Tarea>>((ref) {
  return ref.read(tareaRepositoryProvider).obtenerTodas();
});

final tareaAvancesApiRepositoryProvider =
    Provider<TareaAvancesApiRepository>((ref) {
  return TareaAvancesApiRepository(ref.read(dioProvider));
});

final tareaAvancesApiProvider =
    FutureProvider.family<List<TareaAvanceApi>, String>((ref, tareaId) {
  return ref.read(tareaAvancesApiRepositoryProvider).obtenerAvances(tareaId);
});

final tareaTimelineApiRepositoryProvider =
    Provider<TareaTimelineApiRepository>((ref) {
  return TareaTimelineApiRepository(ref.read(dioProvider));
});

final tareaTimelineApiProvider =
    FutureProvider.family<List<TareaTimelineItem>, String>((ref, tareaId) {
  return ref.read(tareaTimelineApiRepositoryProvider).obtenerTimeline(tareaId);
});

final glpiTicketApiRepositoryProvider = Provider<GlpiTicketApiRepository>((ref) {
  return GlpiTicketApiRepository(ref.read(dioProvider));
});

final glpiTicketsAsignadosProvider = FutureProvider<List<GlpiTicket>>((ref) {
  return ref.read(glpiTicketApiRepositoryProvider).obtenerAsignados();
});

final glpiTicketsCreadosProvider = FutureProvider<List<GlpiTicket>>((ref) {
  return ref.read(glpiTicketApiRepositoryProvider).obtenerCreados();
});

final glpiTodosLosTicketsProvider = FutureProvider<List<GlpiTicket>>((ref) {
  return ref.read(glpiTicketApiRepositoryProvider).obtenerTodos();
});

final glpiTicketTimelineProvider =
    FutureProvider.family<List<TareaTimelineItem>, int>((ref, ticketId) {
  return ref.read(glpiTicketApiRepositoryProvider).obtenerTimeline(ticketId);
});

final itemsPorCreadorProvider =
    FutureProvider.family<List<TareaItem>, String>((ref, creadoPor) async {
  final results = await Future.wait([
    ref.read(tareaApiRepositoryProvider).obtenerPorCreador(creadoPor),
    ref.read(glpiTicketApiRepositoryProvider).obtenerCreados(),
  ]);
  final tareas = results[0] as List<Tarea>;
  final tickets = results[1] as List<GlpiTicket>;
  return [
    ...tareas.map((t) => TareaItem.tarea(t)),
    ...tickets.map((t) => TareaItem.ticket(t)),
  ];
});

final itemsPorAsignadoProvider =
    FutureProvider.family<List<TareaItem>, String>((ref, asignadoA) async {
  final results = await Future.wait([
    ref.read(tareaApiRepositoryProvider).obtenerPorAsignado(asignadoA),
    ref.read(glpiTicketApiRepositoryProvider).obtenerAsignados(),
  ]);
  final tareas = results[0] as List<Tarea>;
  final tickets = results[1] as List<GlpiTicket>;
  return [
    ...tareas.map((t) => TareaItem.tarea(t)),
    ...tickets.map((t) => TareaItem.ticket(t)),
  ];
});

final itemsTodosProvider = FutureProvider<List<TareaItem>>((ref) async {
  final results = await Future.wait([
    ref.read(tareaApiRepositoryProvider).obtenerTodas(),
    ref.read(glpiTicketApiRepositoryProvider).obtenerTodos(),
  ]);
  final tareas = results[0] as List<Tarea>;
  final tickets = results[1] as List<GlpiTicket>;
  return [
    ...tareas.map((t) => TareaItem.tarea(t)),
    ...tickets.map((t) => TareaItem.ticket(t)),
  ];
});

final glpiTicketDetalleProvider =
    FutureProvider.family<GlpiTicket, int>((ref, ticketId) {
  return ref.read(glpiTicketApiRepositoryProvider).obtenerDetalle(ticketId);
});

final glpiUsuariosProvider = FutureProvider<List<GlpiUserModel>>((ref) {
  return ref.read(glpiTicketApiRepositoryProvider).listarUsuarios();
});

final glpiFuentesSolicitudProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) {
  return ref.read(glpiTicketApiRepositoryProvider).listarFuentesSolicitud();
});

final glpiTiposSolucionProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) {
  return ref.read(glpiTicketApiRepositoryProvider).listarTiposSolucion();
});

final glpiTicketDocumentosProvider =
    FutureProvider.family<List<GlpiDocumento>, int>((ref, ticketId) {
  return ref.read(glpiTicketApiRepositoryProvider).listarDocumentos(ticketId);
});

/// ID GLPI del usuario autenticado actualmente.
/// Intenta [AuthUser.glpiUserId] primero; si no está, parsea [AuthUser.id].
final currentGlpiUserIdProvider = Provider<int?>((ref) {
  final auth = ref.watch(authControllerProvider);
  final user = auth.user;
  if (user == null) return null;
  return user.glpiUserId ?? int.tryParse(user.id);
});
