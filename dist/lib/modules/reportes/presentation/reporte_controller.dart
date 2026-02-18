import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../notificacions/data/notificacion_repository_impl.dart';
import '../../notificacions/domain/notificacion.dart';
import '../domain/reporte.dart';
import '../domain/reporte_repository.dart';

class Xura32lRWpuixuMRU extends StateNotifier<AsyncValue<List<Reporte>>> {
  final ReporteRepository mbnkVqAhgB;
  final NotificacionRepository exvOz4ephsyeyqD0;

  Xura32lRWpuixuMRU(this.mbnkVqAhgB, this.exvOz4ephsyeyqD0)
      : super(const AsyncValue.loading()) {
    _okWw();
  }

  Future<void> _okWw() async {
    try {
      final data = await mbnkVqAhgB.obtenerReportes();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> uJxtR8M() => _okWw();

  Future<void> f6fRU({
    required String titulo,
    required String descripcion,
    required String categoria,
    required String area,
    required String creadoPor,
  }) async {
    final reporte = Reporte(
      id: const Uuid().v4(),
      titulo: titulo,
      descripcion: descripcion,
      categoria: categoria,
      area: area,
      creadoPor: creadoPor,
      creadoEn: DateTime.now(),
    );

    await mbnkVqAhgB.crearReporte(reporte);

    await exvOz4ephsyeyqD0.crear(
      tipo: NotificacionTipo.reporte.name,
      titulo: 'Reporte enviado',
      mensaje: reporte.titulo,
      referenciaId: reporte.id,
    );

    await _okWw();
  }
}

