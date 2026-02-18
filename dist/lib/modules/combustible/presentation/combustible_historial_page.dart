import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/lan_status.dart';
import '../../../core/network/lan_status_provider.dart';
import '../../../core/sync/sync_providers.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import 'combustible_providers.dart';

class Wf4ddykqAEjGBjQGuK0wZvrD extends ConsumerWidget {
  final GerenciaTheme hVHqc;

  const Wf4ddykqAEjGBjQGuK0wZvrD({super.key, required this.hVHqc});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendientesAsync = ref.watch(combustiblePendientesCountProvider);
    final registrosAsync = ref.watch(combustibleRegistrosProvider);
    final lanStatus = ref
        .watch(lanStatusProvider)
        .maybeWhen(data: (s) => s, orElse: () => LanStatus.disconnected);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de combustible'),
        backgroundColor: hVHqc.colorPrimario,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Reintentar sincronización',
            onPressed: () {
              if (lanStatus != LanStatus.connected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Sin conexión al servidor (revisa Wi‑Fi y /api/health).',
                    ),
                  ),
                );
                return;
              }
              ref.read(syncWorkerProvider).runCombustibleOnly();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sincronización iniciada...')),
              );
            },
            icon: const Icon(Icons.sync),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.black.withValues(alpha: 0.04),
            child: pendientesAsync.when(
              data: (count) => Text(
                'Pendientes por subir: $count',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              loading: () => const Text('Pendientes por subir: ...'),
              error: (err, _) => const Text('Pendientes por subir: -'),
            ),
          ),
          Expanded(
            child: registrosAsync.when(
              data: (rows) {
                if (rows.isEmpty) {
                  return const Center(
                    child: Text('Aún no hay registros guardados localmente.'),
                  );
                }

                return ListView.separated(
                  itemCount: rows.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final r = rows[i];
                    final title = r.modo == 'cargar_combustible'
                        ? 'Carga de combustible'
                        : 'Uso de vehículo';
                    final subtitle = r.modo == 'cargar_combustible'
                        ? (r.operador ?? '-')
                        : (r.destino ?? '-');
                    final syncError = (r.syncError ?? '').trim();
                    final hasError = syncError.isNotEmpty;
                    final syncInfo = (r.syncInfo ?? '').trim();
                    final hasInfo = syncInfo.isNotEmpty;

                    return ListTile(
                      leading: Icon(
                        r.sincronizado ? Icons.cloud_done : Icons.cloud_off,
                        color: r.sincronizado ? Colors.green : Colors.orange,
                      ),
                      title: Text(title),
                      subtitle: Text(
                        [
                          '$subtitle • ${r.creadoEn.toLocal().toString()}',
                          if (hasError) 'Error: $syncError',
                          if (!hasError && hasInfo) 'Servidor: $syncInfo',
                        ].join('\n'),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: r.sincronizado
                          ? const Text('OK')
                          : (hasError
                                ? const Text('Error')
                                : const Text('Pendiente')),
                      onTap: (hasError || hasInfo)
                          ? () {
                              final text = hasError ? syncError : syncInfo;
                              showDialog<void>(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    hasError
                                        ? 'Error de sincronización'
                                        : 'Respuesta del servidor',
                                  ),
                                  content: SingleChildScrollView(
                                    child: Text(text),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).maybePop(),
                                      child: const Text('Cerrar'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          : null,
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
