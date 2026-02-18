import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_models.dart';
import '../../../core/auth/auth_providers.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../../../shared/ui/widgets/gerencia_app_bar.dart';
import '../domain/jefatura.dart';
import 'check_list_providers.dart';
import 'list_cl_page.dart';

class T6Sp2bVXCuIMs2pcv extends ConsumerStatefulWidget {
  final GerenciaTheme bhiFm;

  const T6Sp2bVXCuIMs2pcv({super.key, required this.bhiFm});

  @override
  ConsumerState<T6Sp2bVXCuIMs2pcv> createState() => _MItF3csKEIXQhkNreFWULl();
}

class _MItF3csKEIXQhkNreFWULl extends ConsumerState<T6Sp2bVXCuIMs2pcv> {
  final _q1k4q0dsrA8aIcKL = TextEditingController();
  String _b5Cy7CujRUl = '';

  @override
  void dispose() {
    _q1k4q0dsrA8aIcKL.dispose();
    super.dispose();
  }

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

    final jefaturasAsync = ref.watch(jefaturasProvider);

    return Scaffold(
      appBar: GerenciaAppBar(theme: widget.bhiFm, title: 'Checklist'),
      body: jefaturasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 32 : 24),
            child: Text('Error al cargar jefaturas: ${_hvx9HL2V(e)}'),
          ),
        ),
        data: (items) {
          final filtered = _i1yUpr1E2bd(items);

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(jefaturasProvider);
              await ref.read(jefaturasProvider.future);
            },
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              children: [
                TextField(
                  controller: _q1k4q0dsrA8aIcKL,
                  onChanged: (v) => setState(() => _b5Cy7CujRUl = v),
                  decoration: InputDecoration(
                    hintText: 'Buscar jefatura…',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(height: isTablet ? 24 : 16),
                if (items.isEmpty)
                  const Center(child: Text('No hay jefaturas disponibles')),
                ...filtered.map(
                  (j) => _KdJQSc2NhdOd(
                    eqqtm5DH: j,
                    mo2Ad: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HXsf7zlICe(
                            mjUxc: widget.bhiFm,
                            voozy1rqGl: j.id,
                            zXBtPDtDfzb3jI: j.nombre,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Jefatura> _i1yUpr1E2bd(List<Jefatura> items) {
    final q = _b5Cy7CujRUl.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items.where((j) => j.nombre.toLowerCase().contains(q)).toList();
  }

  String _hvx9HL2V(Object e) {
    if (e is StateError) return e.message;
    return e.toString();
  }
}

class _KdJQSc2NhdOd extends StatelessWidget {
  final Jefatura eqqtm5DH;
  final VoidCallback mo2Ad;

  const _KdJQSc2NhdOd({required this.eqqtm5DH, required this.mo2Ad});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    final cs = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: mo2Ad,
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                _PFTKHH3M5u9ed9(cfS: eqqtm5DH.img),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eqqtm5DH.nombre,
                        style: TextStyle(
                          fontSize: isTablet ? 20 : 16,
                          fontWeight: FontWeight.bold,
                          color: cs.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ver checklist',
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

class _PFTKHH3M5u9ed9 extends StatelessWidget {
  final String? cfS;

  const _PFTKHH3M5u9ed9({required this.cfS});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    final name = cfS?.trim();
    if (name == null || name.isEmpty) {
      return _lTN0fuF2(isTablet);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
      child: Image.asset(
        'assets/img/$name.png',
        width: isTablet ? 80 : 64,
        height: isTablet ? 80 : 64,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _lTN0fuF2(isTablet),
      ),
    );
  }

  Widget _lTN0fuF2(bool isTablet) {
    return Container(
      width: isTablet ? 80 : 64,
      height: isTablet ? 80 : 64,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
      ),
      child: Icon(
        Icons.business,
        color: Colors.blue[700],
        size: isTablet ? 40 : 32,
      ),
    );
  }
}
