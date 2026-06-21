import 'package:dio/dio.dart';

class TareaTimelineItem {
  final String tipo;
  final int id;
  final String contenido;
  final int? usuarioId;
  final String? usuarioNombre;
  final String fecha;
  final int? estado;
  final int? usuarioValidacion;
  final bool esPrivado;
  final List<int> docIds;

  TareaTimelineItem({
    required this.tipo,
    required this.id,
    required this.contenido,
    this.usuarioId,
    this.usuarioNombre,
    required this.fecha,
    this.estado,
    this.usuarioValidacion,
    this.esPrivado = false,
    this.docIds = const [],
  });

  factory TareaTimelineItem.fromJson(Map<String, dynamic> m) {
    final rawDocIds = m['docIds'];
    return TareaTimelineItem(
      tipo: (m['tipo'] as String?) ?? '',
      id: (m['id'] as int?) ?? 0,
      contenido: (m['contenido'] as String?) ?? '',
      usuarioId: (m['usuarioId'] as num?)?.toInt(),
      usuarioNombre: m['usuarioNombre'] as String?,
      fecha: (m['fecha'] as String?) ?? '',
      estado: m['estado'] as int?,
      usuarioValidacion: m['usuarioValidacion'] as int?,
      esPrivado: (m['esPrivado'] as bool?) ?? false,
      docIds: rawDocIds is List
          ? rawDocIds.map((e) => (e as num).toInt()).toList()
          : const [],
    );
  }
}

class TareaTimelineApiRepository {
  final Dio _dio;

  TareaTimelineApiRepository(this._dio);

  Future<List<TareaTimelineItem>> obtenerTimeline(String tareaId) async {
    final response = await _dio.get('/tareas/$tareaId/glpi-timeline');
    final list = response.data as List;
    return list
        .map((json) => TareaTimelineItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
