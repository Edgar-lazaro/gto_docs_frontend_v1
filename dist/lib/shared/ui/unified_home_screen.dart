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

class AexhzoRpGqe1izNlq extends ConsumerStatefulWidget {
  final AuthUser pylK;

  const AexhzoRpGqe1izNlq({super.key, required this.pylK});

  @override
  ConsumerState<AexhzoRpGqe1izNlq> createState() => _CfLxsIUYlyf8Tuwbl9Re9M();
}

class _CfLxsIUYlyf8Tuwbl9Re9M extends ConsumerState<AexhzoRpGqe1izNlq> {
  int _k64JV77czq5RB = 0;

  @override
  Widget build(BuildContext context) {
    final theme = GerenciaConfig.getConfig(widget.pylK.gerencia);

    final gradient = LinearGradient(
      colors: [theme.colorPrimario, theme.colorSecundario],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: IndexedStack(
        index: _k64JV77czq5RB,
        children: [
          _GuJEyvU(qmhtC: theme, l4Tz: widget.pylK),
          CombustiblePage(theme: theme),
          _Bf2NGTOAj2(zYg5: widget.pylK, n3rMv: theme),
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
          currentIndex: _k64JV77czq5RB,
          onTap: (index) => setState(() => _k64JV77czq5RB = index),
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

class _GuJEyvU extends StatelessWidget {
  final GerenciaTheme qmhtC;
  final AuthUser l4Tz;

  const _GuJEyvU({required this.qmhtC, required this.l4Tz});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _VRFOD5(gSZyP: qmhtC, jtPP: l4Tz),
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
                      color: qmhtC.colorSecundario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InventarioPage(theme: qmhtC),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Checklist',
                      icon: Icons.checklist,
                      color: qmhtC.colorPrimario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => JefaturasListPage(theme: qmhtC),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Reportes',
                      icon: Icons.assessment,
                      color: qmhtC.colorSecundario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ReportesPage(theme: qmhtC),
                          ),
                        );
                      },
                    ),
                    MenuCard(
                      title: 'Tareas',
                      icon: Icons.task_alt,
                      color: qmhtC.colorPrimario,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TareasPage(theme: qmhtC),
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

class _VRFOD5 extends StatelessWidget {
  final GerenciaTheme gSZyP;
  final AuthUser jtPP;

  const _VRFOD5({required this.gSZyP, required this.jtPP});

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
          colors: [gSZyP.colorPrimario, gSZyP.colorSecundario],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isTablet ? 40 : 32),
          bottomRight: Radius.circular(isTablet ? 40 : 32),
        ),
        boxShadow: [
          BoxShadow(
            color: gSZyP.colorPrimario.withValues(alpha: 0.3),
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
                      jtPP.nombre,
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
                  gSZyP.iconoPrincipal,
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
                    gSZyP.nombre,
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

class _Bf2NGTOAj2 extends ConsumerWidget {
  final AuthUser zYg5;
  final GerenciaTheme n3rMv;

  const _Bf2NGTOAj2({required this.zYg5, required this.n3rMv});

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
                          color: n3rMv.colorPrimario.withValues(alpha: 0.2),
                          blurRadius: isTablet ? 30 : 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: isTablet ? 80 : 64,
                      color: n3rMv.colorPrimario,
                    ),
                  ),
                  SizedBox(height: isTablet ? 32 : 24),
                  Text(
                    zYg5.nombre,
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
                        _mcW6Wrm(
                          context: context,
                          icon: Icons.business,
                          label: 'Gerencia',
                          value: n3rMv.nombre,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: isTablet ? 20 : 16,
                          ),
                          child: Divider(height: 1, color: Colors.grey[200]),
                        ),
                        _mcW6Wrm(
                          context: context,
                          icon: Icons.verified_user,
                          label: 'Cargo',
                          value: zYg5.roles.isEmpty
                              ? 'Sin asignar'
                              : zYg5.roles.join(', '),
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

                        String t3eYUq(String value) {
                          if (value.isEmpty) return '(vacío)';
                          if (value.length <= 14) return value;
                          return '${value.substring(0, 8)}…${value.substring(value.length - 6)}';
                        }

                        String mY7nZ1FWXV(dynamic data) {
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
                                    : t3eYUq(token);

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
                                          'Body: ${mY7nZ1FWXV(body)}',
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

  Widget _mcW6Wrm({
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
              colors: [n3rMv.colorPrimario, n3rMv.colorSecundario],
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
