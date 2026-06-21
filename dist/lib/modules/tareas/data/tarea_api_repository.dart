import 'package:dio/dio.dart';

import '../domain/tarea.dart';

class TareaApiRepository {
  final Dio _dio;

  TareaApiRepository(this._dio);

  Future<List<Tarea>> obtenerTodas() async {
    final response = await _dio.get('/tareas');
    final list = response.data as List;
    return list.map((json) => _fromJson(json)).toList();
  }

  Future<List<Tarea>> obtenerPorCreador(String userId) async {
    final all = await obtenerTodas();
    return all.where((t) => t.creadoPor == userId).toList();
  }

  Future<List<Tarea>> obtenerPorAsignado(String userId) async {
    final all = await obtenerTodas();
    return all.where((t) => t.asignadoA == userId).toList();
  }

  Tarea _fromJson(Map<String, dynamic> json) {
    final estadoRaw = (json['estatus'] as String?) ?? 'pendiente';
    final estado = switch (estadoRaw) {
      'en_proceso' || 'en_progreso' => TareaEstado.enProceso,
      'completada' => TareaEstado.completada,
      _ => TareaEstado.pendiente,
    };

    return Tarea(
      id: (json['id'] ?? '').toString(),
      groupId: null,
      reporteId: (json['id'] ?? '').toString(),
      titulo: (json['titulo'] as String?) ?? '',
      descripcion: (json['descripcion'] as String?) ?? '',
      creadoPor: (json['asignado_por'] as String?) ?? '',
      asignadoA: (json['usuario_asignado'] as String?) ?? '',
      estado: estado,
    );
  }
}
