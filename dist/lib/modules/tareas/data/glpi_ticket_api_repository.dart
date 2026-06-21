import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_lib;

import '../../usuarios_glpi/data/glpi_user_model.dart';
import '../domain/tarea.dart';
import 'tarea_timeline_api_repository.dart';

// ─── Modelo de documento adjunto ────────────────────────────────────────────

class GlpiDocumento {
  final int id;
  final String nombre;
  final String filename;
  final String mime;
  final int size;
  final String fecha;
  final int? usuarioId;
  final String? usuarioNombre;

  GlpiDocumento({
    required this.id,
    required this.nombre,
    required this.filename,
    required this.mime,
    required this.size,
    required this.fecha,
    this.usuarioId,
    this.usuarioNombre,
  });

  factory GlpiDocumento.fromJson(Map<String, dynamic> m) {
    return GlpiDocumento(
      id: (m['id'] as num?)?.toInt() ?? 0,
      nombre: (m['nombre'] as String?) ?? (m['name'] as String?) ?? '',
      filename: (m['filename'] as String?) ?? '',
      mime: (m['mime'] as String?) ?? 'application/octet-stream',
      size: (m['size'] as num?)?.toInt() ?? 0,
      fecha: (m['fecha'] as String?) ?? (m['date_creation'] as String?) ?? '',
      usuarioId: (m['usuarioId'] as num?)?.toInt(),
      usuarioNombre: m['usuarioNombre'] as String?,
    );
  }
}

class TareaItem {
  final Tarea? tarea;
  final GlpiTicket? ticket;

  TareaItem.tarea(this.tarea) : ticket = null;
  TareaItem.ticket(this.ticket) : tarea = null;

  bool get isGlpi => ticket != null;

  String get id => isGlpi ? 'glpi_${ticket!.id}' : tarea!.id;

  String get titulo => isGlpi ? ticket!.name : tarea!.titulo;

  String get estadoLabel =>
      isGlpi ? ticket!.statusLabel : tarea!.estado.name;

  String get subtitulo =>
      isGlpi ? 'Ticket GLPI #${ticket!.id}' : 'Tarea #${tarea!.id}';

  String get fecha => isGlpi ? ticket!.date : '';
}

class GlpiTicket {
  final int id;
  final String name;
  final String date;
  final int status;
  final int priority;
  final int type;
  final String content;
  final int entitiesId;
  final int usersIdRecipient;

  GlpiTicket({
    required this.id,
    required this.name,
    required this.date,
    required this.status,
    required this.priority,
    required this.type,
    required this.content,
    required this.entitiesId,
    required this.usersIdRecipient,
  });

  factory GlpiTicket.fromJson(Map<String, dynamic> m) {
    return GlpiTicket(
      id: (m['id'] as num?)?.toInt() ?? 0,
      name: (m['name'] as String?) ?? '',
      date: (m['date'] as String?) ?? (m['date_creation'] as String?) ?? '',
      status: (m['status'] as num?)?.toInt() ?? 0,
      priority: (m['priority'] as num?)?.toInt() ?? 0,
      type: (m['type'] as num?)?.toInt() ?? 0,
      content: (m['content'] as String?) ?? '',
      entitiesId: (m['entities_id'] as num?)?.toInt() ?? 0,
      usersIdRecipient: (m['users_id_recipient'] as num?)?.toInt() ?? 0,
    );
  }

  String get statusLabel {
    switch (status) {
      case 1: return 'Nuevo';
      case 2: return 'En proceso';
      case 3: return 'En proceso (+plan)';
      case 4: return 'Pendiente';
      case 5: return 'Resuelto';
      case 6: return 'Cerrado';
      default: return 'Desconocido';
    }
  }

  String get priorityLabel {
    switch (priority) {
      case 1: return 'Muy baja';
      case 2: return 'Baja';
      case 3: return 'Media';
      case 4: return 'Alta';
      case 5: return 'Muy alta';
      case 6: return 'Urgente';
      default: return 'Desconocida';
    }
  }

  String get typeLabel => type == 2 ? 'Solicitud' : 'Incidencia';
}

class GlpiTicketApiRepository {
  final Dio _dio;

  GlpiTicketApiRepository(this._dio);

  Options _longTimeout() => Options(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
  );

  Future<List<GlpiTicket>> obtenerAsignados({int limit = 500}) async {
    final response = await _dio.get(
      '/glpi/tickets/asignados',
      queryParameters: {'limit': limit},
      options: _longTimeout(),
    );
    final list = response.data as List;
    return list
        .map((json) => GlpiTicket.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<GlpiTicket>> obtenerCreados({int limit = 500}) async {
    final response = await _dio.get(
      '/glpi/tickets/creados',
      queryParameters: {'limit': limit},
      options: _longTimeout(),
    );
    final list = response.data as List;
    return list
        .map((json) => GlpiTicket.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<GlpiTicket>> obtenerTodos({int limit = 500}) async {
    final response = await _dio.get(
      '/glpi/tickets',
      queryParameters: {'limit': limit},
      options: _longTimeout(),
    );
    final list = response.data as List;
    return list
        .map((json) => GlpiTicket.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<GlpiTicket> obtenerDetalle(int ticketId) async {
    final response = await _dio.get(
      '/glpi/tickets/$ticketId',
      options: _longTimeout(),
    );
    return GlpiTicket.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<TareaTimelineItem>> obtenerTimeline(int ticketId) async {
    final response = await _dio.get(
      '/glpi/tickets/$ticketId/timeline',
      options: _longTimeout(),
    );
    final list = response.data as List;
    return list
        .map((json) => TareaTimelineItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<GlpiTicket> obtenerPorId(int ticketId) => obtenerDetalle(ticketId);

  Future<void> crearTicket({
    required String titulo,
    required String descripcion,
    int tipo = 1,
    int prioridad = 3,
    List<int> solicitanteIds = const [],
    List<int> tecnicoIds = const [],
  }) async {
    await _dio.post(
      '/glpi/tickets',
      data: {
        'input': {
          'name': titulo,
          'content': descripcion,
          'type': tipo,
          'priority': prioridad,
          'status': 1,
          if (solicitanteIds.isNotEmpty) '_users_id_requester': solicitanteIds,
          if (tecnicoIds.isNotEmpty) '_users_id_assign': tecnicoIds,
        },
      },
      options: _longTimeout(),
    );
  }

  Future<void> cambiarStatus(int ticketId, int status) async {
    await _dio.patch(
      '/glpi/tickets/$ticketId/status',
      data: {'status': status},
      options: _longTimeout(),
    );
  }

  Future<int> agregarComentario(
    int ticketId,
    String content, {
    bool esPrivado = false,
    int? requesttypesId,
  }) async {
    final res = await _dio.post(
      '/glpi/tickets/$ticketId/followups',
      data: {
        'content': content,
        'is_private': esPrivado ? 1 : 0,
        if (requesttypesId != null) 'requesttypes_id': requesttypesId,
      },
      options: _longTimeout(),
    );
    return (res.data?['id'] as num?)?.toInt() ?? 0;
  }

  Future<void> crearTarea(
    int ticketId, {
    required String descripcion,
    int estado = 1,
    int? usuarioTecnicoId,
    int? categoriaId,
    String? fechaInicio,
    String? fechaFin,
    int? duracionSegundos,
    bool esPrivado = false,
  }) async {
    await _dio.post(
      '/glpi/tickets/$ticketId/tasks',
      data: {
        'content': descripcion,
        'state': estado,
        if (usuarioTecnicoId != null) 'users_id_tech': usuarioTecnicoId,
        if (categoriaId != null && categoriaId > 0) 'taskcategories_id': categoriaId,
        if (fechaInicio != null) 'begin': fechaInicio,
        if (fechaFin != null) 'plan_end': fechaFin,
        if (duracionSegundos != null) 'actiontime': duracionSegundos,
        'is_private': esPrivado ? 1 : 0,
      },
      options: _longTimeout(),
    );
  }

  Future<void> subirArchivo(
    int ticketId, {
    required String nombre,
    required List<int> bytes,
    required String mimeType,
  }) => subirDocumento(ticketId, nombre: nombre, bytes: bytes, mimeType: mimeType);

  Future<void> subirDocumento(
    int ticketId, {
    required String nombre,
    required List<int> bytes,
    required String mimeType,
    int? usuarioId,
    int? followupId,
  }) async {
    final parts = mimeType.split('/');
    final mediaType = parts.length == 2
        ? dio_lib.DioMediaType(parts[0], parts[1])
        : dio_lib.DioMediaType('application', 'octet-stream');

    final formData = dio_lib.FormData.fromMap({
      'nombre': nombre,
      if (usuarioId != null) 'usuarioId': usuarioId.toString(),
      if (followupId != null) 'followupId': followupId.toString(),
      'file': dio_lib.MultipartFile.fromBytes(
        bytes,
        filename: nombre,
        contentType: mediaType,
      ),
    });
    await _dio.post(
      '/glpi/tickets/$ticketId/documents',
      data: formData,
      options: Options(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
  }

  Future<void> solicitarValidacion(
    int ticketId, {
    required int validatorUserId,
    required String comment,
  }) async {
    await _dio.post(
      '/glpi/tickets/$ticketId/validation',
      data: {'validatorUserId': validatorUserId, 'comment': comment},
      options: _longTimeout(),
    );
  }

  Future<void> crearSolucion(
    int ticketId, {
    required String content,
    int tipoId = 1,
  }) async {
    await _dio.post(
      '/glpi/tickets/$ticketId/solution',
      data: {'content': content, 'solutiontypes_id': tipoId, 'status': 1},
      options: _longTimeout(),
    );
  }

  Future<void> aprobarSolucion(int solutionId, {required bool aprobada}) async {
    await _dio.patch(
      '/glpi/solutions/$solutionId/approve',
      data: {'approved': aprobada},
      options: _longTimeout(),
    );
  }

  Future<List<Map<String, dynamic>>> listarFuentesSolicitud() async {
    final r = await _dio.get('/glpi/fuentes-solicitud', options: _longTimeout());
    return List<Map<String, dynamic>>.from(r.data as List);
  }

  Future<List<Map<String, dynamic>>> listarTiposSolucion() async {
    final r = await _dio.get('/glpi/tipos-solucion', options: _longTimeout());
    return List<Map<String, dynamic>>.from(r.data as List);
  }

  Future<List<GlpiUserModel>> listarUsuarios() async {
    final response = await _dio.get('/glpi/usuarios', options: _longTimeout());
    final list = response.data as List;
    return list.map((json) {
      final m = json as Map<String, dynamic>;
      return GlpiUserModel(
        id: (m['id'] as num?)?.toInt() ?? 0,
        name: (m['name'] as String?) ?? '',
        firstname: (m['firstname'] as String?) ?? '',
        realname: (m['realname'] as String?) ?? '',
      );
    }).toList();
  }

  // ── Documentos ────────────────────────────────────────────────────────────

  Future<List<GlpiDocumento>> listarDocumentos(int ticketId) async {
    final response = await _dio.get(
      '/glpi/tickets/$ticketId/documents',
      options: _longTimeout(),
    );
    final list = response.data as List;
    return list
        .map((json) => GlpiDocumento.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Uint8List> descargarDocumentoBytes(int docId) async {
    final response = await _dio.get<List<int>>(
      '/glpi/documents/$docId/download',
      options: Options(
        responseType: ResponseType.bytes,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    return Uint8List.fromList(response.data ?? []);
  }

  Future<void> eliminarDocumento(int docId) async {
    await _dio.delete(
      '/glpi/documents/$docId',
      options: _longTimeout(),
    );
  }

  Future<void> reemplazarDocumento(
    int ticketId, {
    required int docId,
    required String nombre,
    required List<int> bytes,
    required String mimeType,
  }) async {
    final parts = mimeType.split('/');
    final mediaType = parts.length == 2
        ? dio_lib.DioMediaType(parts[0], parts[1])
        : dio_lib.DioMediaType('application', 'octet-stream');

    final formData = dio_lib.FormData.fromMap({
      'nombre': nombre,
      'file': dio_lib.MultipartFile.fromBytes(
        bytes,
        filename: nombre,
        contentType: mediaType,
      ),
    });
    await _dio.put(
      '/glpi/tickets/$ticketId/documents/$docId',
      data: formData,
      options: Options(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
  }

  // ── Comentarios (followups) ───────────────────────────────────────────────

  Future<void> editarComentario(int followupId, String contenido) async {
    await _dio.patch(
      '/glpi/followups/$followupId',
      data: {'content': contenido},
      options: _longTimeout(),
    );
  }
}
