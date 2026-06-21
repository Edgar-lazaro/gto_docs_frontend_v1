import 'package:dio/dio.dart';

class TareaAvanceApi {
  final String id;
  final String descripcion;
  final List<String> imagenes;
  final String? usuarioId;
  final String? usuarioNombre;
  final String? fechaCreacion;

  TareaAvanceApi({
    required this.id,
    required this.descripcion,
    required this.imagenes,
    this.usuarioId,
    this.usuarioNombre,
    this.fechaCreacion,
  });
}

class TareaAvancesApiRepository {
  final Dio _dio;

  TareaAvancesApiRepository(this._dio);

  Future<List<TareaAvanceApi>> obtenerAvances(String tareaId) async {
    final response = await _dio.get('/tareas/$tareaId/avances');
    final list = response.data as List;
    return list.map((json) {
      final m = json as Map<String, dynamic>;
      return TareaAvanceApi(
        id: (m['id'] ?? '').toString(),
        descripcion: (m['descripcion'] as String?) ?? '',
        imagenes: (m['imagenes'] as List?)?.cast<String>() ?? [],
        usuarioId: (m['usuarioId'] as String?) ?? (m['usuario_id'] as String?),
        usuarioNombre: (m['usuarioNombre'] as String?) ?? (m['usuario_nombre'] as String?),
        fechaCreacion: (m['fechaCreacion'] as String?) ?? (m['fecha_creacion'] as String?),
      );
    }).toList();
  }
}
