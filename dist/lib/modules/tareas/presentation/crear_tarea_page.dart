import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../core/auth/auth_providers.dart';
import '../../../core/auth/role_utils.dart';
import '../../../core/users/users_providers.dart';
import '../../../core/users/user_ref.dart';
import '../../tickets_glpi/domain/glpi_ticket.dart';
import '../../tickets_glpi/domain/glpi_ticket_user.dart';
import '../../tickets_glpi/presentation/glpi_providers.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../../../shared/ui/widgets/section_container.dart';
import '../domain/tarea.dart';
import 'tareas_providers.dart';

class K8NwCbJv8ZuhjZ extends ConsumerStatefulWidget {
  final GerenciaTheme yiiNG;
  final String yIzgxjLvS;
  final String? cGfjaaA21BXhTE;

  const K8NwCbJv8ZuhjZ({
    super.key,
    required this.yiiNG,
    required this.yIzgxjLvS,
    this.cGfjaaA21BXhTE,
  });

  @override
  ConsumerState<K8NwCbJv8ZuhjZ> createState() => _BYTdaOeouo5mziomkSs();
}

class _BYTdaOeouo5mziomkSs extends ConsumerState<K8NwCbJv8ZuhjZ> {
  final _hYkE9zr = GlobalKey<FormState>();
  final _mlqbeUOw1T = TextEditingController();
  final _ifL0UXLnyPDWKNg = TextEditingController();
  final _lbCqX3daNcv = TextEditingController();

  final Set<String> _tjKAHFReX9rnWjc = <String>{};
  final Set<String> _bDHKPIjcN5cFXoIsLQOW = <String>{};

  final GlobalKey _g16FLGcEUufnWx0ed = GlobalKey();
  final GlobalKey _yBIFG1yhDxlA6Twx1 = GlobalKey();

  bool _xqkxwc = false;

  void _ft26uOdI1zPG() {
    final gerenciaId = ref
        .read(authControllerProvider)
        .user
        ?.resolvedGerenciaId;
    ref.invalidate(usersListByGerenciaProvider(gerenciaId));
  }

  RelativeRect _yiIyBoSIBGf6ab2YF(GlobalKey key) {
    final overlayBox =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final fieldBox = key.currentContext!.findRenderObject() as RenderBox;

    final fieldBottomLeft = fieldBox.localToGlobal(
      Offset(0, fieldBox.size.height),
      ancestor: overlayBox,
    );

    final left = fieldBottomLeft.dx;
    final top = fieldBottomLeft.dy;
    final right = overlayBox.size.width - left - fieldBox.size.width;
    final bottom = overlayBox.size.height - top;

    return RelativeRect.fromLTRB(left, top, right, bottom);
  }

  double _xdAUVbwJ0V(GlobalKey key) {
    final fieldBox = key.currentContext!.findRenderObject() as RenderBox;
    return fieldBox.size.width;
  }

  Future<Set<String>?> _caYSPgaBRXO9HolmNsz({
    required List<UserRef> users,
  }) async {
    if (_g16FLGcEUufnWx0ed.currentContext == null) return null;
    final pos = _yiIyBoSIBGf6ab2YF(_g16FLGcEUufnWx0ed);
    final width = _xdAUVbwJ0V(_g16FLGcEUufnWx0ed);

    final selected = await showMenu<Set<String>>(
      context: context,
      position: pos,
      items: [
        _W4dDHNea24XbR<Set<String>>(
          width: width,
          height: 360,
          nhc2T: _IsBao0zpvkVz3K5uBTVlnaC(
            fjlm1: users,
            v0ZLLRKyxT1RqGq: _bDHKPIjcN5cFXoIsLQOW,
            e78Jfp: _xqkxwc,
            wTIDDi: (selected) => Navigator.of(context).pop(selected),
          ),
        ),
      ],
    );

    return selected;
  }

  Future<Set<String>?> _mv3kBcIcVDfgNZcFi({
    required List<UserRef> users,
  }) async {
    if (_yBIFG1yhDxlA6Twx1.currentContext == null) return null;
    final pos = _yiIyBoSIBGf6ab2YF(_yBIFG1yhDxlA6Twx1);
    final width = _xdAUVbwJ0V(_yBIFG1yhDxlA6Twx1);

    final result = await showMenu<Set<String>>(
      context: context,
      position: pos,
      items: [
        _W4dDHNea24XbR<Set<String>>(
          width: width,
          height: 360,
          nhc2T: _Qw5rtjh55SsSHJLElRhKX(
            wIk6T: users,
            w8JauVMU4UfbJz8: _tjKAHFReX9rnWjc,
            uzL58j: _xqkxwc,
            aOIem4: (selected) => Navigator.of(context).pop(selected),
          ),
        ),
      ],
    );

    return result;
  }

  @override
  void initState() {
    super.initState();

    final creado = widget.yIzgxjLvS.trim();
    if (creado.isNotEmpty) {
      _bDHKPIjcN5cFXoIsLQOW.add(creado);
    }

    final fixed = widget.cGfjaaA21BXhTE;
    if (fixed != null && fixed.trim().isNotEmpty) {
      _tjKAHFReX9rnWjc.add(fixed.trim());
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _ft26uOdI1zPG();
    });
  }

  @override
  void dispose() {
    _mlqbeUOw1T.dispose();
    _ifL0UXLnyPDWKNg.dispose();
    _lbCqX3daNcv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final gerenciaId = auth.user?.resolvedGerenciaId;
    final asignadorLabel = auth.user?.nombre ?? widget.yIzgxjLvS;

    final isTablet = MediaQuery.of(context).size.width >= 600;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
        ? 80.0
        : width >= 600
        ? 60.0
        : 24.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.yiiNG.colorPrimario,
        elevation: 4,
        shadowColor: widget.yiiNG.colorPrimario.withAlpha(38),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Crear tarea',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(isTablet ? 24 : 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isTablet ? 32 : 24,
        ),
        child: Form(
          key: _hYkE9zr,
          child: Column(
            children: [
              SectionContainer(
                title: 'Datos de la tarea',
                subtitle: 'Completa la información principal.',
                icon: Icons.task_alt,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mlqbeUOw1T,
                      decoration: const InputDecoration(labelText: 'Título'),
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _ifL0UXLnyPDWKNg,
                      decoration: const InputDecoration(
                        labelText: 'Descripción',
                      ),
                      minLines: 3,
                      maxLines: 6,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _lbCqX3daNcv,
                      decoration: const InputDecoration(
                        labelText: 'Reporte ID (opcional)',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              SectionContainer(
                title: 'Asignación',
                subtitle: 'Define quién asigna y a quién se asigna.',
                icon: Icons.group_add,
                child: Column(
                  children: [
                    // Quién asigna / crea la tarea (puede ser distinto del usuario logueado).
                    if (auth.user == null) ...[
                      TextFormField(
                        initialValue: asignadorLabel,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Asignado por',
                        ),
                      ),
                      const SizedBox(height: 12),
                    ] else ...[
                      ref
                          .watch(usersListByGerenciaProvider(gerenciaId))
                          .when(
                            loading: () => InkWell(
                              onTap: _xqkxwc
                                  ? null
                                  : () {
                                      _ft26uOdI1zPG();
                                    },
                              child: const InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Asignado por',
                                ),
                                child: Text('Cargando...'),
                              ),
                            ),
                            error: (e, _) => InkWell(
                              onTap: _xqkxwc
                                  ? null
                                  : () {
                                      _ft26uOdI1zPG();
                                    },
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'Asignado por',
                                ),
                                child: Text(
                                  _oAk9M0qWePGmAVfA4Fv2O(e),
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                            data: (users) {
                              final byId = <String, String>{
                                for (final u in users) u.id: u.name,
                              };

                              String xpMGnAG3JCylx9a() {
                                final ids = _bDHKPIjcN5cFXoIsLQOW
                                    .where((e) => e.trim().isNotEmpty)
                                    .toList(growable: false);
                                if (ids.isEmpty) return 'Ninguno';
                                final names = ids
                                    .map((id) => byId[id] ?? id)
                                    .toList(growable: false);
                                names.sort(
                                  (a, b) => a.toLowerCase().compareTo(
                                    b.toLowerCase(),
                                  ),
                                );
                                if (names.length <= 2) return names.join(', ');
                                return '${names.take(2).join(', ')} +${names.length - 2}';
                              }

                              return InkWell(
                                key: _g16FLGcEUufnWx0ed,
                                onTap: _xqkxwc
                                    ? null
                                    : () async {
                                        _ft26uOdI1zPG();
                                        final picked =
                                            await _caYSPgaBRXO9HolmNsz(
                                              users: users,
                                            );
                                        if (!mounted || picked == null) return;
                                        setState(() {
                                          _bDHKPIjcN5cFXoIsLQOW
                                            ..clear()
                                            ..addAll(picked);
                                        });
                                      },
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Asignado por',
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                  ),
                                  child: Text(
                                    'Seleccionados: ${_bDHKPIjcN5cFXoIsLQOW.length} • ${xpMGnAG3JCylx9a()}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                          ),
                      const SizedBox(height: 12),
                    ],

                    if (widget.cGfjaaA21BXhTE == null) ...[
                      ref
                          .watch(usersListByGerenciaProvider(gerenciaId))
                          .when(
                            loading: () => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: LinearProgressIndicator(),
                            ),
                            error: (e, _) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                _oAk9M0qWePGmAVfA4Fv2O(e),
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                            data: (users) {
                              String xpMGnAG3JCylx9a() {
                                if (_tjKAHFReX9rnWjc.isEmpty) return 'Ninguno';
                                final byId = <String, String>{
                                  for (final u in users) u.id: u.name,
                                };
                                final names = _tjKAHFReX9rnWjc
                                    .map((id) => byId[id] ?? id)
                                    .toList(growable: false);
                                names.sort(
                                  (a, b) => a.toLowerCase().compareTo(
                                    b.toLowerCase(),
                                  ),
                                );
                                if (names.length <= 2) return names.join(', ');
                                return '${names.take(2).join(', ')} +${names.length - 2}';
                              }

                              final subtitle =
                                  'Seleccionados: ${_tjKAHFReX9rnWjc.length} • ${xpMGnAG3JCylx9a()}';

                              return InkWell(
                                key: _yBIFG1yhDxlA6Twx1,
                                onTap: _xqkxwc
                                    ? null
                                    : () async {
                                        _ft26uOdI1zPG();
                                        final picked = await _mv3kBcIcVDfgNZcFi(
                                          users: users,
                                        );
                                        if (!mounted || picked == null) return;
                                        setState(() {
                                          _tjKAHFReX9rnWjc
                                            ..clear()
                                            ..addAll(picked);
                                        });
                                      },
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Asignado a',
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                  ),
                                  child: Text(
                                    subtitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                          ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _xqkxwc ? null : _l8d7H0,
                  child: _xqkxwc
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _l8d7H0() async {
    if (!_hYkE9zr.currentState!.validate()) return;

    final asignadores = <String>{..._bDHKPIjcN5cFXoIsLQOW.map((e) => e.trim())}
      ..removeWhere((e) => e.isEmpty);

    if (asignadores.isEmpty) {
      final fallback = widget.yIzgxjLvS.trim();
      if (fallback.isNotEmpty) asignadores.add(fallback);
    }

    final asignadorId = () {
      final ordered = asignadores.toList(growable: false)
        ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
      return ordered.isEmpty ? widget.yIzgxjLvS.trim() : ordered.first;
    }();

    final asignados = <String>{..._tjKAHFReX9rnWjc}
      ..removeWhere((e) => e.trim().isEmpty);
    if (asignados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona al menos un usuario.')),
      );
      return;
    }

    setState(() => _xqkxwc = true);
    try {
      const uuid = Uuid();

      final batchId = uuid.v4();
      final createdAt = DateTime.now();
      final asignadoresGlpi = <String>{...asignadores}
        ..removeWhere((e) => e.isEmpty);

      for (final userId in asignados) {
        final tarea = Tarea(
          id: uuid.v4(),
          groupId: batchId,
          reporteId: _lbCqX3daNcv.text.trim(),
          titulo: _mlqbeUOw1T.text.trim(),
          descripcion: _ifL0UXLnyPDWKNg.text.trim(),
          creadoPor: asignadorId,
          asignadoA: userId,
          estado: TareaEstado.pendiente,
        );

        await ref.read(tareaControllerProvider).xJaXqYSeLc(tarea);
      }

      // GLPI (M:M): un solo ticket por creación, con lista de asignadores/asignados.
      final titulo = _mlqbeUOw1T.text.trim();
      final descripcionBase = _ifL0UXLnyPDWKNg.text.trim();
      final reporteId = _lbCqX3daNcv.text.trim();

      final desc = StringBuffer()
        ..writeln(descripcionBase.isEmpty ? titulo : descripcionBase)
        ..writeln('')
        ..writeln('---')
        ..writeln('Origen: GTO Docs')
        ..writeln('BatchId: $batchId');

      if (reporteId.isNotEmpty) {
        desc.writeln('ReporteId: $reporteId');
      }

      final ticket = GlpiTicket(
        titulo: 'Tarea: $titulo',
        descripcion: desc.toString(),
        fecha: createdAt,
        asignadores: asignadoresGlpi.toList(growable: false),
        asignados: asignados.toList(growable: false),
        categoria: 'tareas',
        prioridad: 'media',
        users: [
          for (final a in asignadoresGlpi)
            GlpiTicketUser(userId: a, role: TicketUserRole.requester),
          for (final u in asignados)
            GlpiTicketUser(userId: u, role: TicketUserRole.assignee),
        ],
        metadata: {
          'source': 'gto_docs_v2_ad',
          'batchId': batchId,
          if (reporteId.isNotEmpty) 'reporteId': reporteId,
        },
      );

      await ref
          .read(glpiRepositoryProvider)
          .crearTicket(ticket, entidadId: batchId);

      if (mounted) {
        ref.invalidate(tareasPorAsignadoProvider);
        ref.invalidate(tareasPorCreadorProvider);
        ref.invalidate(todasLasTareasProvider);
        Navigator.of(context).pop(true);
      }
    } finally {
      if (mounted) setState(() => _xqkxwc = false);
    }
  }

  String _oAk9M0qWePGmAVfA4Fv2O(Object e) {
    if (e is StateError) {
      return e.message;
    }
    return 'No se pudieron cargar usuarios. ${e.toString()}';
  }
}

class _W4dDHNea24XbR<T> extends PopupMenuEntry<T> {
  final double _afyNul;
  final double? _s0ykq;
  final Widget nhc2T;

  const _W4dDHNea24XbR({
    required double height,
    double? width,
    required this.nhc2T,
  }) : _afyNul = height,
       _s0ykq = width;

  @override
  double get height => _afyNul;

  @override
  bool represents(T? value) => false;

  @override
  State<_W4dDHNea24XbR<T>> createState() => _CgxyYM1FW9UC2RMpTK<T>();
}

class _CgxyYM1FW9UC2RMpTK<T> extends State<_W4dDHNea24XbR<T>> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: SizedBox(width: widget._s0ykq, child: widget.nhc2T),
    );
  }
}

class _IsBao0zpvkVz3K5uBTVlnaC extends StatefulWidget {
  final List<UserRef> fjlm1;
  final Set<String> v0ZLLRKyxT1RqGq;
  final bool e78Jfp;
  final ValueChanged<Set<String>> wTIDDi;

  const _IsBao0zpvkVz3K5uBTVlnaC({
    required this.fjlm1,
    required this.v0ZLLRKyxT1RqGq,
    required this.e78Jfp,
    required this.wTIDDi,
  });

  @override
  State<_IsBao0zpvkVz3K5uBTVlnaC> createState() =>
      _CFRwLMznYmLUo1UgdHSP76cQ1mfl();
}

class _CFRwLMznYmLUo1UgdHSP76cQ1mfl extends State<_IsBao0zpvkVz3K5uBTVlnaC> {
  late final Set<String> _iSCDEVAf = <String>{...widget.v0ZLLRKyxT1RqGq}
    ..removeWhere((e) => e.trim().isEmpty);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Asignado por (${_iSCDEVAf.length})',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: widget.e78Jfp
                      ? null
                      : () {
                          setState(() => _iSCDEVAf.clear());
                        },
                  child: const Text('Limpiar'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 260),
            child: widget.fjlm1.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('No hay usuarios disponibles.'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.fjlm1.length,
                    itemBuilder: (context, i) {
                      final u = widget.fjlm1[i];
                      final checked = _iSCDEVAf.contains(u.id);
                      return CheckboxListTile(
                        dense: true,
                        value: checked,
                        title: Text(u.name),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: widget.e78Jfp
                            ? null
                            : (v) {
                                setState(() {
                                  if (v == true) {
                                    _iSCDEVAf.add(u.id);
                                  } else {
                                    _iSCDEVAf.remove(u.id);
                                  }
                                });
                              },
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.e78Jfp
                    ? null
                    : () => widget.wTIDDi(_iSCDEVAf),
                child: const Text('Listo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Qw5rtjh55SsSHJLElRhKX extends StatefulWidget {
  final List<UserRef> wIk6T;
  final Set<String> w8JauVMU4UfbJz8;
  final bool uzL58j;
  final ValueChanged<Set<String>> aOIem4;

  const _Qw5rtjh55SsSHJLElRhKX({
    required this.wIk6T,
    required this.w8JauVMU4UfbJz8,
    required this.uzL58j,
    required this.aOIem4,
  });

  @override
  State<_Qw5rtjh55SsSHJLElRhKX> createState() => _Y9kkaMCQCNw2Fk9eHKvsivxCp1();
}

class _Y9kkaMCQCNw2Fk9eHKvsivxCp1 extends State<_Qw5rtjh55SsSHJLElRhKX> {
  late final Set<String> _sxRm23np = <String>{...widget.w8JauVMU4UfbJz8};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Asignar a (${_sxRm23np.length})',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: widget.uzL58j
                      ? null
                      : () {
                          setState(() => _sxRm23np.clear());
                        },
                  child: const Text('Limpiar'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 260),
            child: widget.wIk6T.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('No hay usuarios disponibles.'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.wIk6T.length,
                    itemBuilder: (context, i) {
                      final u = widget.wIk6T[i];
                      final checked = _sxRm23np.contains(u.id);
                      return CheckboxListTile(
                        dense: true,
                        value: checked,
                        title: Text(u.name),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: widget.uzL58j
                            ? null
                            : (v) {
                                setState(() {
                                  if (v == true) {
                                    _sxRm23np.add(u.id);
                                  } else {
                                    _sxRm23np.remove(u.id);
                                  }
                                });
                              },
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.uzL58j
                    ? null
                    : () => widget.aOIem4(_sxRm23np),
                child: const Text('Listo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
