import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dashboard_providers.dart';

class FHwWWNhl4p5UW extends ConsumerWidget {
  const FHwWWNhl4p5UW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(dashboardMetricsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: metrics.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) => Text('Error: $e'),
        data: (m) => Column(
          children: [
            _vbGv('Reportes abiertos', m.reportesAbiertos),
            _vbGv('Reportes cerrados', m.reportesCerrados),
            _vbGv('Tareas pendientes', m.tareasPendientes),
            _vbGv('Evidencias hoy', m.evidenciasHoy),
          ],
        ),
      ),
    );
  }

  Widget _vbGv(String label, int value) {
    return Card(
      child: ListTile(
        title: Text(label),
        trailing: Text('$value'),
      ),
    );
  }
}