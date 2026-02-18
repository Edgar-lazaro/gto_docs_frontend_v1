import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/ui/theme/gerencia_config.dart';
import '../../../shared/ui/widgets/gerencia_app_bar.dart';
import '../domain/checklist_existente.dart';
import 'check_list_providers.dart';
import 'checklist_runner_page.dart';

class HXsf7zlICe extends ConsumerWidget {
  final GerenciaTheme mjUxc;
  final int voozy1rqGl;
  final String zXBtPDtDfzb3jI;

  const HXsf7zlICe({
    super.key,
    required this.mjUxc,
    required this.voozy1rqGl,
    required this.zXBtPDtDfzb3jI,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    final clAsync = ref.watch(clExistentesPorJefaturaProvider(voozy1rqGl));

    return Scaffold(
      appBar: GerenciaAppBar(theme: mjUxc, title: 'CL de $zXBtPDtDfzb3jI'),
      body: clAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 32 : 24),
            child: Text('Error al cargar checklist: ${_errorMsg(e)}'),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text('No hay checklist registrados para esta jefatura'),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(clExistentesPorJefaturaProvider(voozy1rqGl));
              await ref.read(
                clExistentesPorJefaturaProvider(voozy1rqGl).future,
              );
            },
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              itemCount: items.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: isTablet ? 20 : 16),
              itemBuilder: (context, index) {
                final cl = items[index];
                return _LapnDI70tP0ZK(
                  cj: cl,
                  nWM1C: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UlKJ4tygr7WfnyTNeVB(
                          dMGUn: mjUxc,
                          g6e7CskfGn: voozy1rqGl,
                          gf58FST9dJ9aPv: zXBtPDtDfzb3jI,
                          qsQyRlEYj: cl,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _LapnDI70tP0ZK extends StatelessWidget {
  final ChecklistExistente cj;
  final VoidCallback nWM1C;

  const _LapnDI70tP0ZK({required this.cj, required this.nWM1C});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final cs = Theme.of(context).colorScheme;

    IconData icon;
    final name = cj.nombre.toLowerCase();
    if (name.contains('red') || name.contains('wifi')) {
      icon = Icons.wifi;
    } else if (name.contains('impres')) {
      icon = Icons.print;
    } else if (name.contains('pc') || name.contains('comput')) {
      icon = Icons.computer;
    } else {
      icon = Icons.document_scanner;
    }

    return Card(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: nWM1C,
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 56 : 48,
                  height: isTablet ? 56 : 48,
                  decoration: BoxDecoration(
                    color: cs.primary.withAlpha(18),
                    borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
                  ),
                  child: Icon(
                    icon,
                    color: cs.primary,
                    size: isTablet ? 30 : 26,
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cj.nombre,
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          color: cs.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Abrir checklist',
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 12,
                          color: cs.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: cs.onSurfaceVariant,
                  size: isTablet ? 24 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _errorMsg(Object e) {
  if (e is StateError) return e.message;
  return e.toString();
}
