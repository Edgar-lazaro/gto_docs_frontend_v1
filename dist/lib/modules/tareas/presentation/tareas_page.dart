import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/role_utils.dart';
import '../../../core/auth/auth_providers.dart';
import '../../../core/auth/auth_models.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../../../shared/ui/widgets/gerencia_app_bar.dart';
import 'admin_tareas_page.dart';
import 'crear_ticket_glpi_page.dart';
import 'ticket_glpi_detalle_page.dart';
import 'tareas_providers.dart';
import '../data/glpi_ticket_api_repository.dart';

class TareasPage extends ConsumerStatefulWidget {
  final GerenciaTheme theme;

  const TareasPage({super.key, required this.theme});

  @override
  ConsumerState<TareasPage> createState() => _TareasPageState();
}

class _TareasPageState extends ConsumerState<TareasPage> {
  int _selectedScope = 0; // 0=Creados, 1=Asignados, 2=Todos

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    final auth = ref.watch(authControllerProvider);

    if (auth.status != AuthStatus.authenticated || auth.user == null) {
      return const Scaffold(body: Center(child: Text('Debes iniciar sesión')));
    }

    final user = auth.user!;

    if (user.isSupervisor) {
      return AdminTareasPage(theme: widget.theme);
    }

    final ticketsAsync = switch (_selectedScope) {
      0 => ref.watch(glpiTicketsCreadosProvider),
      1 => ref.watch(glpiTicketsAsignadosProvider),
      _ => ref.watch(glpiTodosLosTicketsProvider),
    };

    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.theme,
        title: 'Tickets',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(glpiTicketsCreadosProvider);
              ref.invalidate(glpiTicketsAsignadosProvider);
              ref.invalidate(glpiTodosLosTicketsProvider);
            },
            tooltip: 'Actualizar',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final created = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => CrearTicketGlpiPage(theme: widget.theme),
            ),
          );
          if (created == true) {
            ref.invalidate(glpiTicketsCreadosProvider);
            ref.invalidate(glpiTicketsAsignadosProvider);
            ref.invalidate(glpiTodosLosTicketsProvider);
          }
        },
        icon: const Icon(Icons.confirmation_number_outlined),
        label: const Text('Nuevo ticket'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding, 16, horizontalPadding, 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(value: 0, label: Text('Creados')),
                      ButtonSegment(value: 1, label: Text('Asignados')),
                      ButtonSegment(value: 2, label: Text('Todos')),
                    ],
                    selected: <int>{_selectedScope},
                    onSelectionChanged: (s) =>
                        setState(() => _selectedScope = s.first),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ticketsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (tickets) =>
                  _buildTicketList(tickets, horizontalPadding, isTablet),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketList(
    List<GlpiTicket> tickets,
    double horizontalPadding,
    bool isTablet,
  ) {
    if (tickets.isEmpty) {
      return const Center(child: Text('No hay tickets'));
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isTablet ? 32 : 24,
      ),
      itemCount: tickets.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final ticket = tickets[i];
        return _GlpiTicketCard(
          ticket: ticket,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TicketGlpiDetallePage(
                theme: widget.theme,
                ticketId: ticket.id,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GlpiTicketCard extends StatelessWidget {
  final GlpiTicket ticket;
  final VoidCallback? onTap;
  const _GlpiTicketCard({required this.ticket, this.onTap});

  IconData _statusIcon(int status) {
    switch (status) {
      case 1: return Icons.fiber_new;
      case 2: return Icons.play_circle;
      case 3: return Icons.schedule;
      case 4: return Icons.pause_circle;
      case 5: return Icons.check_circle;
      case 6: return Icons.lock;
      default: return Icons.help;
    }
  }

  Color _statusColor(int status) {
    switch (status) {
      case 1: return Colors.orange;
      case 2: return Colors.blue;
      case 3: return Colors.amber;
      case 4: return Colors.purple;
      case 5: return Colors.green;
      case 6: return Colors.grey;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    return Card(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 56 : 48,
                  height: isTablet ? 56 : 48,
                  decoration: BoxDecoration(
                    color: _statusColor(ticket.status).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
                  ),
                  child: Icon(
                    _statusIcon(ticket.status),
                    color: _statusColor(ticket.status),
                    size: isTablet ? 30 : 26,
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.name,
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '#${ticket.id} · ${ticket.statusLabel}',
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 12,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
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
