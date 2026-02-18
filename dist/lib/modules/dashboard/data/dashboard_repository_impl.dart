import '../../../core/database/app_database.dart';
import '../domain/dashboard_metrics.dart';

class QCAyhDdUmOcfY2VIHVu {
  final AppDatabase ap;

  QCAyhDdUmOcfY2VIHVu(this.ap);

  Future<DashboardMetrics> s1NcpF6m1BYc8S1() async {
    final reportes = await ap.select(ap.reportesTable).get();
    final tareas = await ap.select(ap.tareasTable).get();
    final evidencias = await ap.select(ap.reporteEvidenciasTable).get();

    final now = DateTime.now();

    return DashboardMetrics(
      reportesAbiertos:
          reportes.where((r) => r.estado != 'resuelto').length,
      reportesCerrados:
          reportes.where((r) => r.estado == 'resuelto').length,
      tareasPendientes:
          tareas.where((t) => t.estado != 'completada').length,
      incidenciasCriticas: 0,
      evidenciasHoy: evidencias
          .where(
            (e) =>
                e.creadoEn.year == now.year &&
                e.creadoEn.month == now.month &&
                e.creadoEn.day == now.day,
          )
          .length,
    );
  }
}