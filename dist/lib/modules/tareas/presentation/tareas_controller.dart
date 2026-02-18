import '../../notificacions/data/notificacion_repository_impl.dart';
import '../../notificacions/domain/notificacion.dart';
import '../domain/tarea.dart';
import '../domain/tarea_repository.dart';

class YFN4UOLKRErF0zB {
  final TareaRepository mKIjpL4jh1;
  final NotificacionRepository vzk3Dzfc2O8aCGgf;

  YFN4UOLKRErF0zB(this.mKIjpL4jh1, this.vzk3Dzfc2O8aCGgf);

  Future<void> xJaXqYSeLc(Tarea tarea) async {
    await mKIjpL4jh1.crearTarea(tarea);

    // NOTIFICACIÓN
    await vzk3Dzfc2O8aCGgf.crear(
      tipo: NotificacionTipo.tarea.name,
      titulo: 'Nueva tarea asignada',
      mensaje: tarea.titulo,
      referenciaId: tarea.id,
    );
  }
}
