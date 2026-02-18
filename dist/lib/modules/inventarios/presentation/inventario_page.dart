import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_models.dart';
import '../../../core/auth/auth_providers.dart';
import '../../../core/auth/role_utils.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../../../shared/ui/widgets/gerencia_app_bar.dart';
import '../domain/activo.dart';
import 'inventario_providers.dart';

class PBDyUOohYkRmCY extends ConsumerStatefulWidget {
  final GerenciaTheme s49Kw;

  const PBDyUOohYkRmCY({super.key, required this.s49Kw});

  @override
  ConsumerState<PBDyUOohYkRmCY> createState() => _Th0uvKq1RbiI5n8dJCh();
}

class _Th0uvKq1RbiI5n8dJCh extends ConsumerState<PBDyUOohYkRmCY> {
  final _iIoSHNhBKndnL3a6 = TextEditingController();
  String _nB11aksxec5 = '';

  @override
  void dispose() {
    _iIoSHNhBKndnL3a6.dispose();
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

    final user = auth.user!;
    final canCrud = user.isSupervisor && !user.isAuxiliar;

    final inventarioAsync = ref.watch(inventarioItemsProvider);

    return Scaffold(
      appBar: GerenciaAppBar(theme: widget.s49Kw, title: 'Inventario'),
      floatingActionButton: canCrud
          ? FloatingActionButton.extended(
              onPressed: () => _zcGC6o6pF6WmMxAC(context),
              icon: const Icon(Icons.add),
              label: const Text('Agregar'),
            )
          : null,
      body: inventarioAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 32 : 24),
            child: Text('Error al cargar inventario: $e'),
          ),
        ),
        data: (items) {
          final filtered = _ayluIZfpi7o(items);

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(inventarioItemsProvider);
              await ref.read(inventarioItemsProvider.future);
            },
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              children: [
                TextField(
                  controller: _iIoSHNhBKndnL3a6,
                  onChanged: (v) => setState(() => _nB11aksxec5 = v),
                  decoration: InputDecoration(
                    hintText: 'Buscar en inventario…',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(height: isTablet ? 24 : 16),
                if (items.isEmpty)
                  const Center(child: Text('No hay registros de inventario')),
                ...filtered.map(
                  (a) => _O0xhg5lQIi(
                    oYWMgy: a,
                    yuysQNl: canCrud,
                    pgiW6m: () => _j9lxeNazyNwsyQ(context, a),
                    ybjwa11n: () => _am2Q9kEgYfPc2(context, a),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _zcGC6o6pF6WmMxAC(BuildContext context) async {
    final created = await showDialog<Activo>(
      context: context,
      builder: (_) => _TJhdL7Hgd4q9(hnj0b: widget.s49Kw),
    );
    if (created == null) return;

    try {
      await ref.read(inventarioRepositoryProvider).crearActivo(created);
      ref.invalidate(inventarioItemsProvider);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo crear: $e')));
    }
  }

  Future<void> _j9lxeNazyNwsyQ(BuildContext context, Activo activo) async {
    final updated = await showDialog<Activo>(
      context: context,
      builder: (_) => _TJhdL7Hgd4q9(hnj0b: widget.s49Kw, ygJrsoe: activo),
    );
    if (updated == null) return;

    try {
      await ref.read(inventarioRepositoryProvider).actualizarActivo(updated);
      ref.invalidate(inventarioItemsProvider);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo actualizar: $e')));
    }
  }

  Future<void> _am2Q9kEgYfPc2(BuildContext context, Activo activo) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar'),
        content: Text('¿Eliminar "${activo.nombre}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (ok != true) return;

    try {
      await ref.read(inventarioRepositoryProvider).eliminarActivo(activo.id);
      ref.invalidate(inventarioItemsProvider);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo eliminar: $e')));
    }
  }

  List<Activo> _ayluIZfpi7o(List<Activo> items) {
    final q = _nB11aksxec5.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items.where((a) {
      final hay = '${a.nombre} ${a.tipo} ${a.ubicacion} ${a.estado}'
          .toLowerCase();
      return hay.contains(q);
    }).toList();
  }
}

class _O0xhg5lQIi extends StatelessWidget {
  final Activo oYWMgy;

  final bool yuysQNl;
  final VoidCallback? pgiW6m;
  final VoidCallback? ybjwa11n;

  const _O0xhg5lQIi({
    required this.oYWMgy,
    required this.yuysQNl,
    this.pgiW6m,
    this.ybjwa11n,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Container(
      margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: isTablet ? 15 : 12,
            offset: Offset(0, isTablet ? 6 : 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 20 : 16),
        child: Row(
          children: [
            Container(
              width: isTablet ? 64 : 56,
              height: isTablet ? 64 : 56,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
              ),
              child: Icon(
                Icons.inventory_2,
                color: Colors.blue[700],
                size: isTablet ? 34 : 30,
              ),
            ),
            SizedBox(width: isTablet ? 20 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    oYWMgy.nombre,
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 10,
                    runSpacing: 6,
                    children: [
                      if (oYWMgy.tipo.isNotEmpty)
                        _Xl0R(huqB: oYWMgy.tipo, rhou: Icons.category),
                      if (oYWMgy.ubicacion.isNotEmpty)
                        _Xl0R(huqB: oYWMgy.ubicacion, rhou: Icons.place),
                      if (oYWMgy.estado.isNotEmpty)
                        _Xl0R(huqB: oYWMgy.estado, rhou: Icons.info_outline),
                      _Xl0R(
                        huqB: 'Cant: ${oYWMgy.cantidad}',
                        rhou: Icons.numbers,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (yuysQNl)
              PopupMenuButton<String>(
                onSelected: (v) {
                  if (v == 'edit') pgiW6m?.call();
                  if (v == 'delete') ybjwa11n?.call();
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 'edit', child: Text('Editar')),
                  PopupMenuItem(value: 'delete', child: Text('Eliminar')),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _TJhdL7Hgd4q9 extends StatefulWidget {
  final GerenciaTheme hnj0b;
  final Activo? ygJrsoe;

  const _TJhdL7Hgd4q9({required this.hnj0b, this.ygJrsoe});

  @override
  State<_TJhdL7Hgd4q9> createState() => _YpqdJ5qKnniBPwB7t();
}

class _YpqdJ5qKnniBPwB7t extends State<_TJhdL7Hgd4q9> {
  final _xAotw5Y = GlobalKey<FormState>();
  late final TextEditingController _gxU0yv;
  late final TextEditingController _hrMa;
  late final TextEditingController _aaTUFbhND;
  late final TextEditingController _pHk3eB;
  late final TextEditingController _zBiaPlCm;
  late final TextEditingController _iy7B8FfaPls;

  @override
  void initState() {
    super.initState();
    final a = widget.ygJrsoe;
    _gxU0yv = TextEditingController(text: a?.nombre ?? '');
    _hrMa = TextEditingController(text: a?.tipo ?? '');
    _aaTUFbhND = TextEditingController(text: a?.ubicacion ?? '');
    _pHk3eB = TextEditingController(text: a?.estado ?? '');
    _zBiaPlCm = TextEditingController(text: (a?.cantidad ?? 0).toString());
    _iy7B8FfaPls = TextEditingController(text: a?.descripcion ?? '');
  }

  @override
  void dispose() {
    _gxU0yv.dispose();
    _hrMa.dispose();
    _aaTUFbhND.dispose();
    _pHk3eB.dispose();
    _zBiaPlCm.dispose();
    _iy7B8FfaPls.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: widget.hnj0b.colorPrimario.withAlpha(22),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              widget.ygJrsoe == null ? Icons.add : Icons.edit,
              color: widget.hnj0b.colorPrimario,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.ygJrsoe == null ? 'Agregar activo' : 'Editar activo',
                ),
                const SizedBox(height: 2),
                Text(
                  'Completa los datos del inventario.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 14, 24, 10),
      content: SizedBox(
        width: 520,
        child: Form(
          key: _xAotw5Y,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _gxU0yv,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _hrMa,
                  decoration: const InputDecoration(
                    labelText: 'Tipo/Categoría',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _aaTUFbhND,
                  decoration: const InputDecoration(labelText: 'Ubicación'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _pHk3eB,
                  decoration: const InputDecoration(labelText: 'Estado'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _zBiaPlCm,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Cantidad'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _iy7B8FfaPls,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(onPressed: _zUKi4P, child: const Text('Guardar')),
      ],
    );
  }

  void _zUKi4P() {
    if (!_xAotw5Y.currentState!.validate()) return;
    final id =
        widget.ygJrsoe?.id ?? DateTime.now().millisecondsSinceEpoch.toString();
    final cant = int.tryParse(_zBiaPlCm.text.trim()) ?? 0;
    Navigator.pop(
      context,
      Activo(
        id: id,
        nombre: _gxU0yv.text.trim(),
        tipo: _hrMa.text.trim(),
        ubicacion: _aaTUFbhND.text.trim(),
        estado: _pHk3eB.text.trim(),
        cantidad: cant,
        descripcion: _iy7B8FfaPls.text.trim().isEmpty
            ? null
            : _iy7B8FfaPls.text.trim(),
      ),
    );
  }
}

class _Xl0R extends StatelessWidget {
  final String huqB;
  final IconData rhou;

  const _Xl0R({required this.huqB, required this.rhou});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(rhou, size: 14, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Text(huqB, style: TextStyle(fontSize: 14, color: Colors.grey[800])),
        ],
      ),
    );
  }
}
