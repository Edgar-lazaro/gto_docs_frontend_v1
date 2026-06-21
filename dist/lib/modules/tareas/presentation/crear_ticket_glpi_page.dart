import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/ui/theme/gerencia_config.dart';
import '../../usuarios_glpi/data/glpi_user_model.dart';
import 'tareas_providers.dart';

class _TipoOption {
  final int value;
  final String label;
  final IconData icon;
  final Color color;
  const _TipoOption(this.value, this.label, this.icon, this.color);
}

class _PrioridadOption {
  final int value;
  final String label;
  final Color color;
  const _PrioridadOption(this.value, this.label, this.color);
}

class CrearTicketGlpiPage extends ConsumerStatefulWidget {
  final GerenciaTheme theme;

  const CrearTicketGlpiPage({super.key, required this.theme});

  @override
  ConsumerState<CrearTicketGlpiPage> createState() =>
      _CrearTicketGlpiPageState();
}

class _CrearTicketGlpiPageState extends ConsumerState<CrearTicketGlpiPage> {
  final _formKey = GlobalKey<FormState>();
  final _tituloCtrl = TextEditingController();
  final _descripcionCtrl = TextEditingController();
  int _tipo = 1;
  int _prioridad = 3;
  final List<GlpiUserModel> _solicitantes = [];
  final List<GlpiUserModel> _tecnicos = [];
  bool _loading = false;

  static const _tiposTicket = [
    _TipoOption(1, 'Incidencia', Icons.warning_amber_outlined, Color(0xFFFF9800)),
    _TipoOption(2, 'Solicitud', Icons.assignment_outlined, Color(0xFF2196F3)),
  ];

  static const _prioridades = [
    _PrioridadOption(1, 'Muy baja', Color(0xFF9E9E9E)),
    _PrioridadOption(2, 'Baja', Color(0xFF8BC34A)),
    _PrioridadOption(3, 'Media', Color(0xFFFFC107)),
    _PrioridadOption(4, 'Alta', Color(0xFFFF9800)),
    _PrioridadOption(5, 'Muy alta', Color(0xFFF44336)),
    _PrioridadOption(6, 'Urgente', Color(0xFF9C27B0)),
  ];

  @override
  void dispose() {
    _tituloCtrl.dispose();
    _descripcionCtrl.dispose();
    super.dispose();
  }

  Future<void> _enviar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final repo = ref.read(glpiTicketApiRepositoryProvider);
      await repo.crearTicket(
        titulo: _tituloCtrl.text.trim(),
        descripcion: _descripcionCtrl.text.trim(),
        tipo: _tipo,
        prioridad: _prioridad,
        solicitanteIds: _solicitantes.map((u) => u.id).toList(),
        tecnicoIds: _tecnicos.map((u) => u.id).toList(),
      );
      ref.invalidate(glpiTicketsCreadosProvider);
      ref.invalidate(glpiTodosLosTicketsProvider);
      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ticket creado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error al crear: $e')));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final usuariosAsync = ref.watch(glpiUsuariosProvider);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: widget.theme.colorPrimario,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Nuevo Ticket',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── Tipo ──────────────────────────────────────────────────────
            _SectionCard(
              title: '¿Qué tipo de ticket es?',
              child: Row(
                children: _tiposTicket.map((t) {
                  final selected = _tipo == t.value;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: t.value == 1 ? 8 : 0,
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => _tipo = t.value),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          decoration: BoxDecoration(
                            color: selected
                                ? t.color.withValues(alpha: 0.12)
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selected ? t.color : Colors.grey[300]!,
                              width: selected ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(t.icon,
                                  color: selected ? t.color : Colors.grey,
                                  size: 30),
                              const SizedBox(height: 8),
                              Text(
                                t.label,
                                style: TextStyle(
                                  fontWeight: selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color:
                                      selected ? t.color : Colors.grey[700],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),

            // ── Título ───────────────────────────────────────────────────
            _SectionCard(
              title: '¿Cuál es el problema?',
              child: TextFormField(
                controller: _tituloCtrl,
                decoration: InputDecoration(
                  hintText: 'Describe brevemente el problema',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLength: 100,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Campo obligatorio' : null,
              ),
            ),
            const SizedBox(height: 12),

            // ── Descripción ───────────────────────────────────────────────
            _SectionCard(
              title: 'Cuéntanos más detalles',
              child: TextFormField(
                controller: _descripcionCtrl,
                decoration: InputDecoration(
                  hintText:
                      'Explica con detalle qué pasó, cuándo ocurrió y qué estabas haciendo...',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                minLines: 3,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Campo obligatorio' : null,
              ),
            ),
            const SizedBox(height: 12),

            // ── Prioridad ─────────────────────────────────────────────────
            _SectionCard(
              title: '¿Qué tan urgente es?',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _prioridades.map((p) {
                  final selected = _prioridad == p.value;
                  return GestureDetector(
                    onTap: () => setState(() => _prioridad = p.value),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? p.color.withValues(alpha: 0.15)
                            : Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected ? p.color : Colors.grey[300]!,
                          width: selected ? 2 : 1,
                        ),
                      ),
                      child: Text(
                        p.label,
                        style: TextStyle(
                          color: selected ? p.color : Colors.grey[600],
                          fontWeight: selected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),

            // ── Solicitantes ──────────────────────────────────────────────
            _SectionCard(
              title: '¿Quién(es) solicitan el ticket?',
              child: usuariosAsync.when(
                loading: () => const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                error: (_, __) => const Text('No se pudieron cargar usuarios'),
                data: (usuarios) => _MultiUserSearchField(
                  selected: _solicitantes,
                  usuarios: usuarios,
                  hint: 'Agregar solicitante...',
                  onChanged: (list) => setState(() {
                    _solicitantes
                      ..clear()
                      ..addAll(list);
                  }),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ── Técnicos asignados ────────────────────────────────────────
            _SectionCard(
              title: '¿A quién(es) se asigna?',
              child: usuariosAsync.when(
                loading: () => const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                error: (_, __) => const Text('No se pudieron cargar usuarios'),
                data: (usuarios) => _MultiUserSearchField(
                  selected: _tecnicos,
                  usuarios: usuarios,
                  hint: 'Agregar técnico...',
                  onChanged: (list) => setState(() {
                    _tecnicos
                      ..clear()
                      ..addAll(list);
                  }),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // ── Botón enviar ──────────────────────────────────────────────
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.theme.colorPrimario,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                ),
                onPressed: _loading ? null : _enviar,
                child: _loading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.send),
                          SizedBox(width: 8),
                          Text(
                            'Crear ticket',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      ),
    );
  }
}

class _MultiUserSearchField extends StatefulWidget {
  final List<GlpiUserModel> selected;
  final List<GlpiUserModel> usuarios;
  final String hint;
  final ValueChanged<List<GlpiUserModel>> onChanged;

  const _MultiUserSearchField({
    required this.selected,
    required this.usuarios,
    required this.hint,
    required this.onChanged,
  });

  @override
  State<_MultiUserSearchField> createState() => _MultiUserSearchFieldState();
}

class _MultiUserSearchFieldState extends State<_MultiUserSearchField> {
  Key _autocompleteKey = UniqueKey();

  void _add(GlpiUserModel u) {
    if (widget.selected.any((s) => s.id == u.id)) return;
    widget.onChanged([...widget.selected, u]);
    setState(() => _autocompleteKey = UniqueKey());
  }

  void _remove(GlpiUserModel u) {
    widget.onChanged(widget.selected.where((s) => s.id != u.id).toList());
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── chips de usuarios seleccionados ───────────────────────────
        if (widget.selected.isNotEmpty) ...[
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: widget.selected.map((u) {
              final initial = u.fullName.isNotEmpty
                  ? u.fullName[0].toUpperCase()
                  : '?';
              return Chip(
                avatar: CircleAvatar(
                  backgroundColor: primaryColor.withValues(alpha: 0.15),
                  child: Text(
                    initial,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                label: Text(
                  u.fullName,
                  style: const TextStyle(fontSize: 13),
                ),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () => _remove(u),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                backgroundColor: primaryColor.withValues(alpha: 0.08),
                side: BorderSide(
                    color: primaryColor.withValues(alpha: 0.25), width: 1),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
        ],

        // ── campo de búsqueda ─────────────────────────────────────────
        Autocomplete<GlpiUserModel>(
          key: _autocompleteKey,
          displayStringForOption: (u) => u.fullName,
          optionsBuilder: (value) {
            final q = value.text.trim().toLowerCase();
            if (q.isEmpty) return const Iterable<GlpiUserModel>.empty();
            return widget.usuarios.where((u) =>
                !widget.selected.any((s) => s.id == u.id) &&
                (u.fullName.toLowerCase().contains(q) ||
                    u.name.toLowerCase().contains(q)));
          },
          onSelected: _add,
          fieldViewBuilder: (context, ctrl, focusNode, _) {
            return TextField(
              controller: ctrl,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                prefixIcon: Icon(Icons.person_add_outlined,
                    size: 20, color: Colors.grey[500]),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: ctrl,
                  builder: (_, v, __) => v.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.close,
                              size: 18, color: Colors.grey[600]),
                          onPressed: () => ctrl.clear(),
                        )
                      : const SizedBox.shrink(),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
              ),
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(12),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 220),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (_, i) {
                      final u = options.elementAt(i);
                      final initial = u.fullName.isNotEmpty
                          ? u.fullName[0].toUpperCase()
                          : '?';
                      return ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          radius: 16,
                          backgroundColor:
                              primaryColor.withValues(alpha: 0.12),
                          child: Text(
                            initial,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        title: Text(
                          u.fullName,
                          style: const TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          u.name,
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[500]),
                        ),
                        onTap: () => onSelected(u),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
