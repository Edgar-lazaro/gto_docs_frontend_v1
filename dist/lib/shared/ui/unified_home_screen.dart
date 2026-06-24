import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../core/auth/auth_models.dart';
import '../../core/auth/auth_providers.dart';
import '../../core/network/providers.dart';
import '../../core/config/config_provider.dart';
import '../../modules/check_list/presentation/jefaturas_list_page.dart';
import '../../modules/combustible/presentation/combustible_page.dart';
import '../../modules/inventarios/presentation/inventario_page.dart';
import '../../modules/reportes/presentation/reporte_page.dart';
import '../../modules/tareas/presentation/tareas_page.dart';
import 'cards/menu_card.dart';
import 'layout/responsive.grid.dart';
import 'theme/gerencia_config.dart';

class UnifiedHomeScreen extends ConsumerStatefulWidget {
  final AuthUser user;

  const UnifiedHomeScreen({super.key, required this.user});

  @override
  ConsumerState<UnifiedHomeScreen> createState() => _UnifiedHomeScreenState();
}

class _UnifiedHomeScreenState extends ConsumerState<UnifiedHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = GerenciaConfig.getConfig(widget.user.gerencia);

    final gradient = LinearGradient(
      colors: [theme.colorPrimario, theme.colorSecundario],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _HomeTab(theme: theme, user: widget.user),
          CombustiblePage(theme: theme),
          _ProfileTab(user: widget.user, theme: theme),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: theme.colorPrimario.withValues(alpha: 0.12),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_gas_station),
              label: 'Combustible',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  final GerenciaTheme theme;
  final AuthUser user;

  const _HomeTab({required this.theme, required this.user});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _Header(theme: theme, user: user),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: isTablet ? 32 : 24,
            ),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = adaptiveCrossAxisCount(
                  constraints.crossAxisExtent,
                );

                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: isTablet ? 20 : 16,
                    crossAxisSpacing: isTablet ? 20 : 16,
                    childAspectRatio: isTablet ? 1.1 : 1.0,
                  ),
                  delegate: SliverChildListDelegate.fixed([
                    MenuCard(
                      title: 'Inventario',
                      icon: Icons.inventory,
                      color: theme.colorSecundario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InventarioPage(theme: theme),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Checklist',
                      icon: Icons.checklist,
                      color: theme.colorPrimario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => JefaturasListPage(theme: theme),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Reportes',
                      icon: Icons.assessment,
                      color: theme.colorSecundario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ReportesPage(theme: theme),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Tareas',
                      icon: Icons.task_alt,
                      color: theme.colorPrimario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TareasPage(theme: theme),
                          ),
                        );
                      },
                    ),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final GerenciaTheme theme;
  final AuthUser user;

  const _Header({required this.theme, required this.user});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Container(
      padding: EdgeInsets.fromLTRB(
        24,
        isTablet ? 32 : 24,
        24,
        isTablet ? 40 : 32,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [theme.colorPrimario, theme.colorSecundario],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isTablet ? 40 : 32),
          bottomRight: Radius.circular(isTablet ? 40 : 32),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorPrimario.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Hola! 👋',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: isTablet ? 20 : 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.nombre,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 32 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(isTablet ? 16 : 12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
                ),
                child: Icon(
                  theme.iconoPrincipal,
                  color: Colors.white,
                  size: isTablet ? 36 : 28,
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 24 : 20),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 20 : 16,
              vertical: isTablet ? 16 : 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.business,
                  color: Colors.white,
                  size: isTablet ? 24 : 20,
                ),
                SizedBox(width: isTablet ? 16 : 12),
                Flexible(
                  child: Text(
                    theme.nombre,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileTab extends ConsumerWidget {
  final AuthUser user;
  final GerenciaTheme theme;

  const _ProfileTab({required this.user, required this.theme});

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

    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 600 : double.infinity,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 40 : 24,
              ),
              child: Column(
                children: [
                  SizedBox(height: isTablet ? 32 : 20),
                  Container(
                    padding: EdgeInsets.all(isTablet ? 32 : 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorPrimario.withValues(alpha: 0.2),
                          blurRadius: isTablet ? 30 : 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: isTablet ? 80 : 64,
                      color: theme.colorPrimario,
                    ),
                  ),
                  SizedBox(height: isTablet ? 32 : 24),
                  Text(
                    user.nombre,
                    style: TextStyle(
                      fontSize: isTablet ? 32 : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isTablet ? 48 : 32),
                  Container(
                    padding: EdgeInsets.all(isTablet ? 28 : 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(isTablet ? 24 : 20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: isTablet ? 15 : 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _infoRow(
                          context: context,
                          icon: Icons.business,
                          label: 'Gerencia',
                          value: theme.nombre,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: isTablet ? 20 : 16,
                          ),
                          child: Divider(height: 1, color: Colors.grey[200]),
                        ),
                        _infoRow(
                          context: context,
                          icon: Icons.verified_user,
                          label: 'Cargo',
                          value: user.roles.isEmpty
                              ? 'Sin asignar'
                              : user.roles.join(', '),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isTablet ? 48 : 32),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        final config = ref.read(appConfigProvider);
                        final session = ref.read(sessionManagerProvider);
                        final token = (await session.getToken())?.trim() ?? '';

                        String redact(String value) {
                          if (value.isEmpty) return '(vacío)';
                          if (value.length <= 14) return value;
                          return '${value.substring(0, 8)}…${value.substring(value.length - 6)}';
                        }

                        String prettyData(dynamic data) {
                          if (data == null) return '(sin body)';
                          final s = data is String ? data : data.toString();
                          return s.length > 2000
                              ? '${s.substring(0, 2000)}…'
                              : s;
                        }

                        int? status;
                        dynamic body;
                        String? error;
                        final dio = ref.read(dioProvider);
                        try {
                          if (token.isEmpty) {
                            error = 'No hay token guardado en el dispositivo.';
                          } else {
                            final res = await dio.get('/auth/me');
                            status = res.statusCode;
                            body = res.data;
                          }
                        } on DioException catch (e) {
                          error = e.toString();
                          status = e.response?.statusCode;
                          body = e.response?.data;
                        } catch (e) {
                          error = e.toString();
                        }

                        if (!context.mounted) return;

                        await showDialog<void>(
                          context: context,
                          builder: (_) {
                            var revealToken = false;
                            return StatefulBuilder(
                              builder: (context, setState) {
                                final tokenLine = revealToken
                                    ? token
                                    : redact(token);

                                return AlertDialog(
                                  title: const Text('Diagnóstico de token'),
                                  content: SingleChildScrollView(
                                    child: SelectableText(
                                      [
                                        'BaseUrl: ${dio.options.baseUrl}',
                                        'Auth endpoint: ${config.authEndpoint}',
                                        'Tiene token: ${token.isNotEmpty}',
                                        'Token: $tokenLine',
                                        'GET /auth/me status: ${status ?? '-'}',
                                        if (error != null) 'Error: $error',
                                        if (body != null)
                                          'Body: ${prettyData(body)}',
                                      ].join('\n'),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: token.isEmpty
                                          ? null
                                          : () async {
                                              await Clipboard.setData(
                                                ClipboardData(text: token),
                                              );
                                              if (!context.mounted) return;
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Token copiado al portapapeles.',
                                                  ),
                                                ),
                                              );
                                            },
                                      child: const Text('Copiar token'),
                                    ),
                                    TextButton(
                                      onPressed: token.isEmpty
                                          ? null
                                          : () => setState(
                                              () => revealToken = !revealToken,
                                            ),
                                      child: Text(
                                        revealToken
                                            ? 'Ocultar token'
                                            : 'Mostrar token',
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).maybePop(),
                                      child: const Text('Cerrar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.vpn_key),
                      label: const Text('Diagnóstico token'),
                    ),
                  ),
                  SizedBox(height: isTablet ? 16 : 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final shouldLogout = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Cerrar Sesión'),
                            content: const Text(
                              '¿Estás seguro que deseas cerrar sesión?',
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Cerrar Sesión'),
                              ),
                            ],
                          ),
                        );

                        if (shouldLogout == true) {
                          await ref
                              .read(authControllerProvider.notifier)
                              .logout();
                        }
                      },
                      icon: Icon(Icons.logout, size: isTablet ? 24 : 20),
                      label: Text(
                        'Cerrar Sesión',
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: isTablet ? 20 : 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            isTablet ? 20 : 16,
                          ),
                        ),
                        elevation: 8,
                        shadowColor: Colors.red.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [theme.colorPrimario, theme.colorSecundario],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
