import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../shared/ui/theme/gerencia_config.dart';
import '../data/glpi_ticket_api_repository.dart';
import '../data/tarea_timeline_api_repository.dart';
import 'tareas_providers.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  Utilidades top-level
// ─────────────────────────────────────────────────────────────────────────────

String mimeFromExt(String ext) {
  switch (ext.toLowerCase()) {
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'png':
      return 'image/png';
    case 'gif':
      return 'image/gif';
    case 'pdf':
      return 'application/pdf';
    case 'doc':
      return 'application/msword';
    case 'docx':
      return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
    case 'xls':
      return 'application/vnd.ms-excel';
    case 'xlsx':
      return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
    case 'mp4':
      return 'video/mp4';
    case 'txt':
      return 'text/plain';
    default:
      return 'application/octet-stream';
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Tipos de respuesta (equivalentes a las tabs nativas de GLPI)
// ─────────────────────────────────────────────────────────────────────────────

enum _TipoRespuesta { seguimiento, tarea, solucion, documento, validacion }

extension _TipoRespuestaExt on _TipoRespuesta {
  String get label {
    switch (this) {
      case _TipoRespuesta.seguimiento: return 'Seguimiento';
      case _TipoRespuesta.tarea: return 'Tarea';
      case _TipoRespuesta.solucion: return 'Solución';
      case _TipoRespuesta.documento: return 'Documento';
      case _TipoRespuesta.validacion: return 'Validación';
    }
  }

  IconData get icon {
    switch (this) {
      case _TipoRespuesta.seguimiento: return Icons.chat_bubble_outline;
      case _TipoRespuesta.tarea: return Icons.task_alt;
      case _TipoRespuesta.solucion: return Icons.check_circle_outline;
      case _TipoRespuesta.documento: return Icons.attach_file;
      case _TipoRespuesta.validacion: return Icons.verified_outlined;
    }
  }

  Color get color {
    switch (this) {
      case _TipoRespuesta.seguimiento: return Colors.blue;
      case _TipoRespuesta.tarea: return Colors.orange;
      case _TipoRespuesta.solucion: return Colors.green;
      case _TipoRespuesta.documento: return Colors.purple;
      case _TipoRespuesta.validacion: return Colors.teal;
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Página principal de detalle de ticket
// ─────────────────────────────────────────────────────────────────────────────

class TicketGlpiDetallePage extends ConsumerStatefulWidget {
  final GerenciaTheme theme;
  final int ticketId;

  const TicketGlpiDetallePage({
    super.key,
    required this.theme,
    required this.ticketId,
  });

  @override
  ConsumerState<TicketGlpiDetallePage> createState() =>
      _TicketGlpiDetallePageState();
}

class _TicketGlpiDetallePageState
    extends ConsumerState<TicketGlpiDetallePage> {
  final _commentCtrl = TextEditingController();
  bool _sendingComment = false;

  @override
  void dispose() {
    _commentCtrl.dispose();
    super.dispose();
  }

  // ── Colores / iconos de status ────────────────────────────────────────────

  Color _statusColor(int s) {
    switch (s) {
      case 1: return Colors.orange;
      case 2: return Colors.blue;
      case 3: return Colors.amber[700]!;
      case 4: return Colors.purple;
      case 5: return Colors.green;
      case 6: return Colors.grey;
      default: return Colors.grey;
    }
  }

  IconData _statusIcon(int s) {
    switch (s) {
      case 1: return Icons.fiber_new;
      case 2: return Icons.play_circle_outline;
      case 3: return Icons.schedule;
      case 4: return Icons.pause_circle_outline;
      case 5: return Icons.check_circle_outline;
      case 6: return Icons.lock_outline;
      default: return Icons.help_outline;
    }
  }

  Color _tipoColor(String tipo) {
    switch (tipo) {
      case 'followup': return Colors.blue;
      case 'task': return Colors.orange;
      case 'solution': return Colors.green;
      case 'validation': return Colors.teal;
      default: return Colors.grey;
    }
  }

  IconData _tipoIcon(String tipo) {
    switch (tipo) {
      case 'followup': return Icons.chat_bubble_outline;
      case 'task': return Icons.task_alt;
      case 'solution': return Icons.check_circle;
      case 'validation': return Icons.verified_user;
      default: return Icons.circle;
    }
  }

  String _tipoLabel(String tipo) {
    switch (tipo) {
      case 'followup': return 'Seguimiento';
      case 'task': return 'Tarea';
      case 'solution': return 'Solución';
      case 'validation': return 'Validación';
      default: return tipo;
    }
  }

  String _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return '';
    try {
      return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(raw));
    } catch (_) {
      return raw;
    }
  }

  // ── Envío rápido de seguimiento (barra inferior) ──────────────────────────

  Future<void> _sendComment() async {
    final text = _commentCtrl.text.trim();
    if (text.isEmpty) return;
    setState(() => _sendingComment = true);
    try {
      await ref
          .read(glpiTicketApiRepositoryProvider)
          .agregarComentario(widget.ticketId, text);
      _commentCtrl.clear();
      ref.invalidate(glpiTicketTimelineProvider(widget.ticketId));
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Seguimiento enviado')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _sendingComment = false);
    }
  }

  // ── Hoja de respuesta principal ───────────────────────────────────────────

  void _abrirHojaRespuesta(GlpiTicket ticket) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _GlpiReplySheet(
        theme: widget.theme,
        ticketId: widget.ticketId,
        ticket: ticket,
        onSuccess: () {
          ref.invalidate(glpiTicketTimelineProvider(widget.ticketId));
          ref.invalidate(glpiTicketDetalleProvider(widget.ticketId));
          ref.invalidate(glpiTicketDocumentosProvider(widget.ticketId));
        },
      ),
    );
  }

  // ── Edición de comentarios ───────────────────────────────────────────────

  void _editarComentario(TareaTimelineItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: _EditarComentarioSheet(
          item: item,
          onGuardar: (nuevoContenido) async {
            await ref
                .read(glpiTicketApiRepositoryProvider)
                .editarComentario(item.id, nuevoContenido);
            ref.invalidate(glpiTicketTimelineProvider(widget.ticketId));
          },
        ),
      ),
    );
  }

  // ── Gestión de documentos ────────────────────────────────────────────────

  void _showDocumentoMenu(GlpiDocumento doc) {
    final currentUserId = ref.read(currentGlpiUserIdProvider);
    final esCreador = currentUserId != null && doc.usuarioId == currentUserId;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _sheetHandle(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                doc.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.visibility, color: Colors.blue),
              title: const Text('Ver documento'),
              onTap: () { Navigator.pop(ctx); _verDocumento(doc); },
            ),
            ListTile(
              leading: const Icon(Icons.download, color: Colors.green),
              title: const Text('Descargar'),
              onTap: () { Navigator.pop(ctx); _descargarDocumento(doc); },
            ),
            if (esCreador) ...[
              ListTile(
                leading: const Icon(Icons.swap_horiz, color: Colors.orange),
                title: const Text('Actualizar documento'),
                onTap: () { Navigator.pop(ctx); _reemplazarDocumento(doc); },
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: const Text('Eliminar documento'),
                onTap: () { Navigator.pop(ctx); _eliminarDocumento(doc); },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _verDocumento(GlpiDocumento doc) async {
    if (!mounted) return;
    final snack = ScaffoldMessenger.of(context);
    try {
      final bytes = await ref
          .read(glpiTicketApiRepositoryProvider)
          .descargarDocumentoBytes(doc.id);
      if (!mounted) return;

      if (doc.mime.startsWith('image/')) {
        showDialog(
          context: context,
          builder: (ctx) => _ImagenPreviewDialog(nombre: doc.nombre, bytes: bytes),
        );
      } else if (doc.mime == 'application/pdf') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => _PdfViewer(nombre: doc.nombre, bytes: bytes),
          ),
        );
      } else {
        await _abrirConApp(bytes, doc.filename.isNotEmpty ? doc.filename : doc.nombre);
      }
    } catch (e) {
      snack.showSnackBar(SnackBar(content: Text('Error al abrir: $e')));
    }
  }

  Future<void> _descargarDocumento(GlpiDocumento doc) async {
    if (!mounted) return;
    final snack = ScaffoldMessenger.of(context);
    try {
      final bytes = await ref
          .read(glpiTicketApiRepositoryProvider)
          .descargarDocumentoBytes(doc.id);
      final nombre = doc.filename.isNotEmpty ? doc.filename : doc.nombre;
      await _abrirConApp(bytes, nombre);
    } catch (e) {
      snack.showSnackBar(SnackBar(content: Text('Error al descargar: $e')));
    }
  }

  Future<void> _abrirConApp(Uint8List bytes, String nombre) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$nombre');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  Future<void> _reemplazarDocumento(GlpiDocumento doc) async {
    if (!mounted) return;
    final snack = ScaffoldMessenger.of(context);
    final result = await FilePicker.platform.pickFiles(withData: true);
    if (result == null || result.files.isEmpty) return;
    final f = result.files.first;
    if (f.bytes == null) return;

    try {
      await ref.read(glpiTicketApiRepositoryProvider).reemplazarDocumento(
        widget.ticketId,
        docId: doc.id,
        nombre: f.name,
        bytes: f.bytes!,
        mimeType: mimeFromExt(f.extension ?? ''),
      );
      ref.invalidate(glpiTicketDocumentosProvider(widget.ticketId));
      if (mounted) snack.showSnackBar(const SnackBar(content: Text('Documento actualizado')));
    } catch (e) {
      snack.showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future<void> _eliminarDocumento(GlpiDocumento doc) async {
    if (!mounted) return;
    final snack = ScaffoldMessenger.of(context);

    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar documento'),
        content: Text('¿Eliminar "${doc.nombre}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmar != true) return;

    try {
      await ref.read(glpiTicketApiRepositoryProvider).eliminarDocumento(doc.id);
      ref.invalidate(glpiTicketDocumentosProvider(widget.ticketId));
      if (mounted) snack.showSnackBar(const SnackBar(content: Text('Documento eliminado')));
    } catch (e) {
      snack.showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  // ── Cambio de estado ──────────────────────────────────────────────────────

  void _showCambiarStatus(GlpiTicket ticket) {
    final statuses = [
      (1, 'Nuevo', Colors.orange),
      (2, 'En proceso', Colors.blue),
      (4, 'Pendiente', Colors.purple),
      (5, 'Resuelto', Colors.green),
      (6, 'Cerrado', Colors.grey),
    ];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _sheetHandle(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Cambiar estado',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            ...statuses.map((s) => ListTile(
                  leading: Icon(_statusIcon(s.$1), color: s.$3),
                  title: Text(s.$2),
                  trailing:
                      ticket.status == s.$1 ? Icon(Icons.check, color: s.$3) : null,
                  onTap: () async {
                    Navigator.pop(ctx);
                    if (ticket.status == s.$1) return;
                    try {
                      await ref
                          .read(glpiTicketApiRepositoryProvider)
                          .cambiarStatus(widget.ticketId, s.$1);
                      ref.invalidate(glpiTicketDetalleProvider(widget.ticketId));
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Estado → ${s.$2}')));
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Error: $e')));
                      }
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget _sheetHandle() => Container(
        width: 40,
        height: 4,
        margin: const EdgeInsets.only(top: 12, bottom: 4),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(2),
        ),
      );

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final detalleAsync = ref.watch(glpiTicketDetalleProvider(widget.ticketId));
    final timelineAsync = ref.watch(glpiTicketTimelineProvider(widget.ticketId));
    final documentosAsync = ref.watch(glpiTicketDocumentosProvider(widget.ticketId));
    final currentUserId = ref.watch(currentGlpiUserIdProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: widget.theme.colorPrimario,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Ticket #${widget.ticketId}',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          detalleAsync.when(
            data: (t) => IconButton(
              icon: const Icon(Icons.swap_horiz, color: Colors.white),
              tooltip: 'Cambiar estado',
              onPressed: () => _showCambiarStatus(t),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Column(
        children: [
          // ── Header del ticket ─────────────────────────────────────────────
          detalleAsync.when(
            loading: () => const LinearProgressIndicator(),
            error: (e, _) => Padding(
              padding: const EdgeInsets.all(8),
              child: Text('Error: $e',
                  style: const TextStyle(color: Colors.red, fontSize: 12)),
            ),
            data: (ticket) => _TicketHeader(
              ticket: ticket,
              theme: widget.theme,
              statusColor: _statusColor(ticket.status),
              statusIcon: _statusIcon(ticket.status),
              formatDate: _formatDate,
            ),
          ),

          // ── Timeline + Documentos con pull-to-refresh ─────────────────────
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(glpiTicketTimelineProvider(widget.ticketId));
                ref.invalidate(glpiTicketDetalleProvider(widget.ticketId));
                ref.invalidate(glpiTicketDocumentosProvider(widget.ticketId));
              },
              child: timelineAsync.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (e, _) =>
                    Center(child: Text('Error cargando timeline: $e')),
                data: (timelineItems) {
                  final docs = documentosAsync.valueOrNull ?? [];

                  // Agrupa documentos usando los docIds nativos de GLPI
                  final docById = <int, GlpiDocumento>{
                    for (final d in docs) d.id: d,
                  };
                  final itemAttachments =
                      <TareaTimelineItem, List<GlpiDocumento>>{};
                  for (final item in timelineItems) {
                    if ((item.tipo != 'followup' && item.tipo != 'solution') ||
                        item.docIds.isEmpty) continue;
                    final attached = item.docIds
                        .map((id) => docById[id])
                        .whereType<GlpiDocumento>()
                        .toList();
                    if (attached.isNotEmpty) {
                      itemAttachments[item] = attached;
                    }
                  }
                  final attachedDocIds = itemAttachments.values
                      .expand((list) => list)
                      .map((d) => d.id)
                      .toSet();

                  final merged =
                      <({DateTime fecha, Object item, List<GlpiDocumento> attachments})>[
                    for (final i in timelineItems)
                      (
                        fecha: DateTime.tryParse(i.fecha) ?? DateTime(0),
                        item: i as Object,
                        attachments: itemAttachments[i] ?? [],
                      ),
                    for (final d in docs)
                      if (!attachedDocIds.contains(d.id))
                        (
                          fecha: DateTime.tryParse(d.fecha) ?? DateTime(0),
                          item: d as Object,
                          attachments: <GlpiDocumento>[],
                        ),
                  ]..sort((a, b) => a.fecha.compareTo(b.fecha));

                  if (merged.isEmpty) {
                    return const CustomScrollView(
                      slivers: [SliverFillRemaining(child: _EmptyTimeline())],
                    );
                  }

                  return CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (_, i) {
                              final entry = merged[i];
                              final obj = entry.item;

                              if (obj is TareaTimelineItem) {
                                final esEditable = obj.tipo == 'followup' &&
                                    currentUserId != null &&
                                    obj.usuarioId == currentUserId;
                                return _TimelineItem(
                                  item: obj,
                                  tipoColor: _tipoColor(obj.tipo),
                                  tipoIcon: _tipoIcon(obj.tipo),
                                  tipoLabel: _tipoLabel(obj.tipo),
                                  formatDate: _formatDate,
                                  onLongPress: esEditable
                                      ? () => _editarComentario(obj)
                                      : null,
                                  attachments: entry.attachments,
                                  onDocMenu: (doc) => _showDocumentoMenu(doc),
                                );
                              }

                              if (obj is GlpiDocumento) {
                                final esCreador = currentUserId != null &&
                                    obj.usuarioId == currentUserId;
                                return _DocumentoTimelineItem(
                                  doc: obj,
                                  formatDate: _formatDate,
                                  esCreador: esCreador,
                                  onMenu: () => _showDocumentoMenu(obj),
                                );
                              }

                              return const SizedBox.shrink();
                            },
                            childCount: merged.length,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          // ── Barra inferior ────────────────────────────────────────────────
          detalleAsync.when(
            data: (ticket) => _BottomBar(
              controller: _commentCtrl,
              sending: _sendingComment,
              theme: widget.theme,
              onSend: _sendComment,
              onReply: () => _abrirHojaRespuesta(ticket),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Hoja de Respuesta — Selector de tipo + formulario dinámico
// ─────────────────────────────────────────────────────────────────────────────

class _GlpiReplySheet extends ConsumerStatefulWidget {
  final GerenciaTheme theme;
  final int ticketId;
  final GlpiTicket ticket;
  final VoidCallback onSuccess;

  const _GlpiReplySheet({
    required this.theme,
    required this.ticketId,
    required this.ticket,
    required this.onSuccess,
  });

  @override
  ConsumerState<_GlpiReplySheet> createState() => _GlpiReplySheetState();
}

class _GlpiReplySheetState extends ConsumerState<_GlpiReplySheet> {
  _TipoRespuesta? _tipo; // null = no seleccionado aún
  bool _loading = false;

  // ── Campos por tipo ───────────────────────────────────────────────────────

  // Seguimiento
  final _seguimientoCtrl = TextEditingController();
  bool _seguimientoPrivado = false;
  int? _fuenteId;
  final List<_DocEntry> _seguimientoDocs = [];

  // Tarea
  final _tareaDescCtrl = TextEditingController();
  int _tareaEstado = 1;
  int? _tareaAsignadoId;
  String? _tareaFechaFin;
  bool _tareaPrivada = false;

  // Solución
  final _solucionCtrl = TextEditingController();
  int _solucionTipoId = 1;
  final List<_DocEntry> _solucionDocs = [];

  // Documento
  final List<_DocEntry> _documentos = [];

  // Validación
  int? _validadorId;
  final _validacionComCtrl = TextEditingController();

  @override
  void dispose() {
    _seguimientoCtrl.dispose();
    _tareaDescCtrl.dispose();
    _solucionCtrl.dispose();

    _validacionComCtrl.dispose();
    super.dispose();
  }

  void _snack(String msg, {bool error = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: error ? Colors.red[700] : null,
    ));
  }

  // ── Envío ─────────────────────────────────────────────────────────────────

  Future<void> _enviar() async {
    if (_tipo == null) {
      _snack('Selecciona el tipo de respuesta', error: true);
      return;
    }
    setState(() => _loading = true);
    try {
      final repo = ref.read(glpiTicketApiRepositoryProvider);
      final currentUserId = ref.read(currentGlpiUserIdProvider);

      switch (_tipo!) {
        case _TipoRespuesta.seguimiento:
          final texto = _seguimientoCtrl.text.trim();
          if (texto.isEmpty && _seguimientoDocs.isEmpty) {
            _snack('Escribe un mensaje o adjunta al menos un archivo', error: true);
            return;
          }
          int? followupId;
          if (texto.isNotEmpty) {
            followupId = await repo.agregarComentario(
              widget.ticketId,
              texto,
              esPrivado: _seguimientoPrivado,
              requesttypesId: _fuenteId,
            );
          }
          for (final doc in _seguimientoDocs) {
            await repo.subirDocumento(
              widget.ticketId,
              nombre: doc.fileName,
              bytes: doc.bytes,
              mimeType: doc.mime,
              usuarioId: currentUserId,
              followupId: followupId,
            );
          }
          _snack('Seguimiento añadido correctamente');

        case _TipoRespuesta.tarea:
          final desc = _tareaDescCtrl.text.trim();
          if (desc.isEmpty) {
            _snack('Escribe la descripción de la tarea', error: true);
            return;
          }
          await repo.crearTarea(
            widget.ticketId,
            descripcion: desc,
            estado: _tareaEstado,
            usuarioTecnicoId: _tareaAsignadoId,
            fechaFin: _tareaFechaFin,
            esPrivado: _tareaPrivada,
          );
          _snack('Tarea creada en GLPI');

        case _TipoRespuesta.solucion:
          final contenido = _solucionCtrl.text.trim();
          if (contenido.isEmpty) {
            _snack('Escribe el contenido de la solución', error: true);
            return;
          }
          final solutionId = await repo.crearSolucion(
            widget.ticketId,
            content: contenido,
            tipoId: _solucionTipoId,
          );
          for (final doc in _solucionDocs) {
            await repo.subirDocumento(
              widget.ticketId,
              nombre: doc.fileName,
              bytes: doc.bytes,
              mimeType: doc.mime,
              usuarioId: currentUserId,
              solutionId: solutionId > 0 ? solutionId : null,
            );
          }
          _snack('Solución enviada — pendiente de aprobación del supervisor');

        case _TipoRespuesta.documento:
          if (_documentos.isEmpty) {
            _snack('Selecciona al menos un archivo', error: true);
            return;
          }
          for (final doc in _documentos) {
            await repo.subirDocumento(
              widget.ticketId,
              nombre: doc.fileName,
              bytes: doc.bytes,
              mimeType: doc.mime,
              usuarioId: currentUserId,
            );
          }
          _snack(
            _documentos.length == 1
                ? 'Archivo adjuntado al ticket'
                : '${_documentos.length} archivos adjuntados al ticket',
          );

        case _TipoRespuesta.validacion:
          if (_validadorId == null) {
            _snack('Selecciona un validador', error: true);
            return;
          }
          final comentario = _validacionComCtrl.text.trim();
          if (comentario.isEmpty) {
            _snack('Escribe el motivo de la solicitud', error: true);
            return;
          }
          await repo.solicitarValidacion(
            widget.ticketId,
            validatorUserId: _validadorId!,
            comment: comentario,
          );
          _snack('Solicitud de validación enviada');
      }

      widget.onSuccess();
      if (mounted) Navigator.pop(context);
    } catch (e) {
      _snack('Error: $e', error: true);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  // ── Selectores de archivo ─────────────────────────────────────────────────

  Future<void> _addFiles(List<_DocEntry> target) async {
    final result = await FilePicker.platform.pickFiles(
      withData: true,
      allowMultiple: true,
    );
    if (result == null || result.files.isEmpty) return;
    final entries = <_DocEntry>[];
    for (final f in result.files) {
      Uint8List? bytes = f.bytes != null ? Uint8List.fromList(f.bytes!) : null;
      if ((bytes == null || bytes.isEmpty) && f.path != null) {
        try { bytes = await File(f.path!).readAsBytes(); } catch (_) {}
      }
      if (bytes == null || bytes.isEmpty) continue;
      entries.add(_DocEntry(
        fileName: f.name,
        bytes: bytes,
        mime: _mimeFromExt(f.extension ?? ''),
      ));
    }
    if (entries.isEmpty) {
      _snack('No se pudo leer ningún archivo', error: true);
      return;
    }
    setState(() => target.addAll(entries));
  }

  Future<void> _addPhoto(List<_DocEntry> target, ImageSource source) async {
    final picked = await ImagePicker().pickImage(
      source: source,
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 80,
    );
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    setState(() => target.add(_DocEntry(
      fileName: picked.name,
      bytes: bytes,
      mime: picked.name.toLowerCase().endsWith('.png') ? 'image/png' : 'image/jpeg',
    )));
  }

  String _mimeFromExt(String ext) => mimeFromExt(ext);

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final usuariosAsync = ref.watch(glpiUsuariosProvider);
    final fuentesAsync = ref.watch(glpiFuentesSolicitudProvider);
    final tiposAsync = ref.watch(glpiTiposSolucionProvider);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Header ────────────────────────────────────────────────────
              Container(
                decoration: BoxDecoration(
                  color: widget.theme.colorPrimario,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
                child: Row(
                  children: [
                    const Icon(Icons.reply, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _tipo == null
                            ? 'Responder al ticket'
                            : '${_tipo!.label} →',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (_tipo != null)
                      TextButton(
                        onPressed: () => setState(() => _tipo = null),
                        child: const Text('Cambiar',
                            style: TextStyle(color: Colors.white70, fontSize: 13)),
                      ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              // ── Selector de tipo O formulario ─────────────────────────────
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.60,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: _tipo == null
                      ? _buildSelector()
                      : _buildForm(usuariosAsync, fuentesAsync, tiposAsync),
                ),
              ),

              // ── Botón enviar (solo cuando hay tipo seleccionado) ──────────
              if (_tipo != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _tipo!.color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: _loading ? null : _enviar,
                      icon: _loading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2),
                            )
                          : Icon(_tipo!.icon),
                      label: _loading
                          ? const Text('Enviando...',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                          : Text('Enviar ${_tipo!.label}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  // ── Selector de tipo (pantalla inicial) ────────────────────────────────────

  Widget _buildSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '¿Qué tipo de respuesta deseas agregar?',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...(_TipoRespuesta.values.map((t) => _TipoCard(
              tipo: t,
              onTap: () => setState(() => _tipo = t),
            ))),
      ],
    );
  }

  // ── Formulario dinámico por tipo ──────────────────────────────────────────

  Widget _buildForm(
    AsyncValue<dynamic> usuariosAsync,
    AsyncValue<List<Map<String, dynamic>>> fuentesAsync,
    AsyncValue<List<Map<String, dynamic>>> tiposAsync,
  ) {
    switch (_tipo!) {
      case _TipoRespuesta.seguimiento:
        return _FormSeguimiento(
          ctrl: _seguimientoCtrl,
          esPrivado: _seguimientoPrivado,
          onPrivadoChanged: (v) => setState(() => _seguimientoPrivado = v),
          fuenteId: _fuenteId,
          onFuenteChanged: (v) => setState(() => _fuenteId = v),
          fuentesAsync: fuentesAsync,
          theme: widget.theme,
          docs: _seguimientoDocs,
          onAddFiles: () => _addFiles(_seguimientoDocs),
          onAddPhoto: (src) => _addPhoto(_seguimientoDocs, src),
          onRemoveDoc: (i) => setState(() => _seguimientoDocs.removeAt(i)),
        );

      case _TipoRespuesta.tarea:
        return _FormTarea(
          ctrl: _tareaDescCtrl,
          estado: _tareaEstado,
          onEstadoChanged: (v) => setState(() => _tareaEstado = v),
          asignadoId: _tareaAsignadoId,
          onAsignadoChanged: (v) => setState(() => _tareaAsignadoId = v),
          fechaFin: _tareaFechaFin,
          onFechaFinChanged: (v) => setState(() => _tareaFechaFin = v),
          esPrivada: _tareaPrivada,
          onPrivadaChanged: (v) => setState(() => _tareaPrivada = v),
          usuariosAsync: usuariosAsync,
          theme: widget.theme,
        );

      case _TipoRespuesta.solucion:
        return _FormSolucion(
          ctrl: _solucionCtrl,
          tipoId: _solucionTipoId,
          onTipoChanged: (v) => setState(() => _solucionTipoId = v),
          tiposAsync: tiposAsync,
          docs: _solucionDocs,
          onAddFiles: () => _addFiles(_solucionDocs),
          onAddPhoto: (src) => _addPhoto(_solucionDocs, src),
          onRemoveDoc: (i) => setState(() => _solucionDocs.removeAt(i)),
        );

      case _TipoRespuesta.documento:
        return _FormDocumento(
          docs: _documentos,
          onAddFiles: () => _addFiles(_documentos),
          onAddPhoto: (src) => _addPhoto(_documentos, src),
          onRemoveDoc: (i) => setState(() => _documentos.removeAt(i)),
        );

      case _TipoRespuesta.validacion:
        return _FormValidacion(
          validadorId: _validadorId,
          onValidadorChanged: (v) => setState(() => _validadorId = v),
          commentCtrl: _validacionComCtrl,
          usuariosAsync: usuariosAsync,
        );
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Tarjeta de selector de tipo
// ─────────────────────────────────────────────────────────────────────────────

class _TipoCard extends StatelessWidget {
  final _TipoRespuesta tipo;
  final VoidCallback onTap;

  const _TipoCard({required this.tipo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: tipo.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: tipo.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: tipo.color.withValues(alpha: 0.4), width: 1.5),
                  ),
                  child: Icon(tipo.icon, color: tipo.color, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    tipo.label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: tipo.color,
                    ),
                  ),
                ),
                Icon(Icons.chevron_right, color: tipo.color.withValues(alpha: 0.6)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Formularios específicos por tipo
// ─────────────────────────────────────────────────────────────────────────────

// ── Seguimiento ────────────────────────────────────────────────────────────

class _FormSeguimiento extends StatelessWidget {
  final TextEditingController ctrl;
  final bool esPrivado;
  final ValueChanged<bool> onPrivadoChanged;
  final int? fuenteId;
  final ValueChanged<int?> onFuenteChanged;
  final AsyncValue<List<Map<String, dynamic>>> fuentesAsync;
  final GerenciaTheme theme;
  final List<_DocEntry> docs;
  final VoidCallback onAddFiles;
  final ValueChanged<ImageSource> onAddPhoto;
  final ValueChanged<int> onRemoveDoc;

  const _FormSeguimiento({
    required this.ctrl,
    required this.esPrivado,
    required this.onPrivadoChanged,
    required this.fuenteId,
    required this.onFuenteChanged,
    required this.fuentesAsync,
    required this.theme,
    required this.docs,
    required this.onAddFiles,
    required this.onAddPhoto,
    required this.onRemoveDoc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _label('Contenido del seguimiento'),
        TextField(
          controller: ctrl,
          decoration: _inputDeco('Escribe aquí tu mensaje o actualización...'),
          maxLines: 5,
          autofocus: true,
        ),
        const SizedBox(height: 14),
        _label('Archivos adjuntos (opcional)'),
        const SizedBox(height: 4),
        _MultiFilePicker(
          docs: docs,
          onAddFiles: onAddFiles,
          onAddPhoto: onAddPhoto,
          onRemove: onRemoveDoc,
        ),
        const SizedBox(height: 14),
        _label('Fuente de la solicitud'),
        fuentesAsync.when(
          loading: () => const _SmallLoader(),
          error: (_, __) => const SizedBox.shrink(),
          data: (fuentes) => DropdownButtonFormField<int>(
            value: fuenteId,
            decoration: _inputDeco('Seleccionar...'),
            items: [
              const DropdownMenuItem<int>(value: null, child: Text('Sin especificar')),
              ...fuentes.map((f) => DropdownMenuItem(
                    value: f['id'] as int,
                    child: Text(f['nombre'] as String),
                  )),
            ],
            onChanged: onFuenteChanged,
          ),
        ),
        const SizedBox(height: 12),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          title: const Text('Seguimiento privado',
              style: TextStyle(fontWeight: FontWeight.w600)),
          subtitle: const Text('Solo visible para técnicos',
              style: TextStyle(fontSize: 12)),
          value: esPrivado,
          activeColor: theme.colorPrimario,
          onChanged: onPrivadoChanged,
        ),
      ],
    );
  }
}

// ── Tarea ──────────────────────────────────────────────────────────────────

class _FormTarea extends StatelessWidget {
  final TextEditingController ctrl;
  final int estado;
  final ValueChanged<int> onEstadoChanged;
  final int? asignadoId;
  final ValueChanged<int?> onAsignadoChanged;
  final String? fechaFin;
  final ValueChanged<String?> onFechaFinChanged;
  final bool esPrivada;
  final ValueChanged<bool> onPrivadaChanged;
  final AsyncValue<dynamic> usuariosAsync;
  final GerenciaTheme theme;

  const _FormTarea({
    required this.ctrl,
    required this.estado,
    required this.onEstadoChanged,
    required this.asignadoId,
    required this.onAsignadoChanged,
    required this.fechaFin,
    required this.onFechaFinChanged,
    required this.esPrivada,
    required this.onPrivadaChanged,
    required this.usuariosAsync,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _label('Descripción de la tarea *'),
        TextField(
          controller: ctrl,
          decoration: _inputDeco('¿Qué se debe hacer?'),
          maxLines: 4,
          autofocus: true,
        ),
        const SizedBox(height: 14),
        _label('Estado'),
        DropdownButtonFormField<int>(
          value: estado,
          decoration: _inputDeco(null),
          items: const [
            DropdownMenuItem(value: 1, child: Text('Por hacer (Todo)')),
            DropdownMenuItem(value: 2, child: Text('En curso')),
            DropdownMenuItem(value: 0, child: Text('Información')),
          ],
          onChanged: (v) => onEstadoChanged(v ?? 1),
        ),
        const SizedBox(height: 14),
        _label('Asignar a (técnico)'),
        usuariosAsync.when(
          loading: () => const _SmallLoader(),
          error: (_, __) => const SizedBox.shrink(),
          data: (users) {
            final list = users as List;
            return DropdownButtonFormField<int>(
              value: asignadoId,
              decoration: _inputDeco('Sin asignar'),
              items: [
                const DropdownMenuItem<int>(value: null, child: Text('Sin asignar')),
                ...list.map((u) {
                  final id = u.id as int;
                  final name = (u.name as String).isNotEmpty
                      ? u.name as String
                      : u.realname as String;
                  return DropdownMenuItem(value: id, child: Text(name));
                }),
              ],
              onChanged: onAsignadoChanged,
            );
          },
        ),
        const SizedBox(height: 14),
        _label('Fecha límite (opcional)'),
        GestureDetector(
          onTap: () async {
            final d = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );
            if (d != null) {
              final s = '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
              onFechaFinChanged(s);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  fechaFin ?? 'Seleccionar fecha...',
                  style: TextStyle(
                      color: fechaFin != null ? Colors.black87 : Colors.grey[500]),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          title: const Text('Tarea privada',
              style: TextStyle(fontWeight: FontWeight.w600)),
          value: esPrivada,
          activeColor: theme.colorPrimario,
          onChanged: onPrivadaChanged,
        ),
      ],
    );
  }
}

// ── Solución ───────────────────────────────────────────────────────────────

class _DocEntry {
  final String fileName;
  final Uint8List bytes;
  final String mime;
  const _DocEntry({required this.fileName, required this.bytes, required this.mime});
}

class _FormSolucion extends StatelessWidget {
  final TextEditingController ctrl;
  final int tipoId;
  final ValueChanged<int> onTipoChanged;
  final AsyncValue<List<Map<String, dynamic>>> tiposAsync;
  final List<_DocEntry> docs;
  final VoidCallback onAddFiles;
  final ValueChanged<ImageSource> onAddPhoto;
  final ValueChanged<int> onRemoveDoc;

  const _FormSolucion({
    required this.ctrl,
    required this.tipoId,
    required this.onTipoChanged,
    required this.tiposAsync,
    required this.docs,
    required this.onAddFiles,
    required this.onAddPhoto,
    required this.onRemoveDoc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.green[200]!),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.green[700], size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Al enviar la solución, el ticket cambiará a estado Resuelto y quedará pendiente de aprobación.',
                  style: TextStyle(fontSize: 12, color: Colors.green[800]),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        _label('Tipo de solución'),
        tiposAsync.when(
          loading: () => const _SmallLoader(),
          error: (_, __) => const SizedBox.shrink(),
          data: (tipos) => DropdownButtonFormField<int>(
            value: tipoId,
            decoration: _inputDeco(null),
            items: tipos.map((t) => DropdownMenuItem(
                  value: t['id'] as int,
                  child: Text(t['nombre'] as String),
                )).toList(),
            onChanged: (v) => onTipoChanged(v ?? 1),
          ),
        ),
        const SizedBox(height: 14),
        _label('Descripción de la solución *'),
        TextField(
          controller: ctrl,
          decoration: _inputDeco('¿Cómo se resolvió el problema?'),
          maxLines: 5,
          autofocus: true,
        ),
        const SizedBox(height: 14),
        _label('Archivos adjuntos (opcional)'),
        const SizedBox(height: 4),
        _MultiFilePicker(
          docs: docs,
          onAddFiles: onAddFiles,
          onAddPhoto: onAddPhoto,
          onRemove: onRemoveDoc,
        ),
      ],
    );
  }
}

// ── Documento (multi-archivo) ───────────────────────────────────────────────

class _FormDocumento extends StatelessWidget {
  final List<_DocEntry> docs;
  final VoidCallback onAddFiles;
  final ValueChanged<ImageSource> onAddPhoto;
  final ValueChanged<int> onRemoveDoc;

  const _FormDocumento({
    required this.docs,
    required this.onAddFiles,
    required this.onAddPhoto,
    required this.onRemoveDoc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _label('Archivos *'),
        const SizedBox(height: 4),
        _MultiFilePicker(
          docs: docs,
          onAddFiles: onAddFiles,
          onAddPhoto: onAddPhoto,
          onRemove: onRemoveDoc,
        ),
      ],
    );
  }
}

// ── Selector multi-archivo reutilizable ────────────────────────────────────

class _MultiFilePicker extends StatelessWidget {
  final List<_DocEntry> docs;
  final VoidCallback onAddFiles;
  final ValueChanged<ImageSource> onAddPhoto;
  final ValueChanged<int> onRemove;

  const _MultiFilePicker({
    required this.docs,
    required this.onAddFiles,
    required this.onAddPhoto,
    required this.onRemove,
  });

  IconData _iconForMime(String mime) {
    if (mime.startsWith('image/')) return Icons.image_outlined;
    if (mime == 'application/pdf') return Icons.picture_as_pdf_outlined;
    if (mime.contains('word')) return Icons.description_outlined;
    if (mime.contains('sheet') || mime.contains('excel'))
      return Icons.table_chart_outlined;
    return Icons.insert_drive_file_outlined;
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Lista de archivos seleccionados
        ...docs.asMap().entries.map((e) {
          final i = e.key;
          final doc = e.value;
          final isImage = doc.mime.startsWith('image/');
          return Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Row(
              children: [
                Icon(_iconForMime(doc.mime),
                    color: Colors.blue[700], size: 22),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doc.fileName,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis),
                      Text(
                        '${isImage ? 'Imagen' : 'Archivo'} · ${_formatSize(doc.bytes.length)}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 18, color: Colors.red),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => onRemove(i),
                ),
              ],
            ),
          );
        }),

        // Botones para agregar
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onAddFiles,
                icon: const Icon(Icons.folder_open, size: 18),
                label: Text(
                  docs.isEmpty ? 'Agregar archivo' : 'Otro archivo',
                  style: const TextStyle(fontSize: 13),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 46),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _showPhotoSource(context),
                icon: const Icon(Icons.photo_camera, size: 18),
                label: Text(
                  docs.isEmpty ? 'Agregar foto' : 'Otra foto',
                  style: const TextStyle(fontSize: 13),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 46),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
        if (docs.isEmpty) ...[
          const SizedBox(height: 4),
          Text(
            'Imágenes, PDF, Word, Excel, video...',
            style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  void _showPhotoSource(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Tomar foto'),
              onTap: () {
                Navigator.pop(ctx);
                onAddPhoto(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Elegir de galería'),
              onTap: () {
                Navigator.pop(ctx);
                onAddPhoto(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ── Validación ─────────────────────────────────────────────────────────────

class _FormValidacion extends StatelessWidget {
  final int? validadorId;
  final ValueChanged<int?> onValidadorChanged;
  final TextEditingController commentCtrl;
  final AsyncValue<dynamic> usuariosAsync;

  const _FormValidacion({
    required this.validadorId,
    required this.onValidadorChanged,
    required this.commentCtrl,
    required this.usuariosAsync,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.teal[200]!),
          ),
          child: Row(
            children: [
              Icon(Icons.verified_outlined, color: Colors.teal[700], size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Solicita a un usuario que apruebe o rechace el cierre de este ticket.',
                  style: TextStyle(fontSize: 12, color: Colors.teal[800]),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _label('Validador *'),
        usuariosAsync.when(
          loading: () => const _SmallLoader(),
          error: (_, __) => const SizedBox.shrink(),
          data: (users) {
            final list = users as List;
            return DropdownButtonFormField<int>(
              value: validadorId,
              decoration: _inputDeco('Seleccionar validador...'),
              items: list.map((u) {
                final id = u.id as int;
                final name = (u.name as String).isNotEmpty
                    ? u.name as String
                    : u.realname as String;
                return DropdownMenuItem(value: id, child: Text(name));
              }).toList(),
              onChanged: onValidadorChanged,
            );
          },
        ),
        const SizedBox(height: 14),
        _label('Motivo de la solicitud *'),
        TextField(
          controller: commentCtrl,
          decoration:
              _inputDeco('¿Por qué solicitas validación para cerrar este ticket?'),
          maxLines: 4,
          autofocus: true,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Widgets compartidos
// ─────────────────────────────────────────────────────────────────────────────

Widget _label(String text) => Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );

InputDecoration _inputDeco(String? hint) => InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    );

class _SmallLoader extends StatelessWidget {
  const _SmallLoader();
  @override
  Widget build(BuildContext context) => const Center(
        child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2)),
      );
}

// ── Header del ticket ──────────────────────────────────────────────────────

class _TicketHeader extends StatelessWidget {
  final GlpiTicket ticket;
  final GerenciaTheme theme;
  final Color statusColor;
  final IconData statusIcon;
  final String Function(String?) formatDate;

  const _TicketHeader({
    required this.ticket,
    required this.theme,
    required this.statusColor,
    required this.statusIcon,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.colorPrimario,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 6,
                offset: const Offset(0, 2)),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _badge(ticket.statusLabel, statusColor, statusIcon),
                const SizedBox(width: 8),
                _badge(ticket.typeLabel, Colors.blueGrey, Icons.label_outline),
                const Spacer(),
                Text(ticket.priorityLabel,
                    style: TextStyle(
                        fontSize: 12,
                        color: _priorityColor(ticket.priority),
                        fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: 10),
            Text(ticket.name,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            if (ticket.content.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(ticket.content,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
            ],
            const SizedBox(height: 6),
            Text(formatDate(ticket.date),
                style: TextStyle(fontSize: 11, color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }

  Widget _badge(String label, Color color, IconData icon) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 11, color: color, fontWeight: FontWeight.bold)),
          ],
        ),
      );

  Color _priorityColor(int p) {
    switch (p) {
      case 5: case 6: return Colors.red;
      case 4: return Colors.orange;
      case 3: return Colors.amber[700]!;
      default: return Colors.grey;
    }
  }
}

// ── Timeline Item ──────────────────────────────────────────────────────────

class _TimelineItem extends StatelessWidget {
  final TareaTimelineItem item;
  final Color tipoColor;
  final IconData tipoIcon;
  final String tipoLabel;
  final String Function(String?) formatDate;
  final VoidCallback? onLongPress;
  final List<GlpiDocumento> attachments;
  final void Function(GlpiDocumento)? onDocMenu;

  const _TimelineItem({
    required this.item,
    required this.tipoColor,
    required this.tipoIcon,
    required this.tipoLabel,
    required this.formatDate,
    this.onLongPress,
    this.attachments = const [],
    this.onDocMenu,
  });

  IconData _iconForMime(String mime) {
    if (mime.startsWith('image/')) return Icons.image_outlined;
    if (mime == 'application/pdf') return Icons.picture_as_pdf_outlined;
    if (mime.contains('word')) return Icons.description_outlined;
    if (mime.contains('sheet') || mime.contains('excel'))
      return Icons.table_chart_outlined;
    return Icons.insert_drive_file_outlined;
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024)
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    final esPrivado = item.esPrivado;
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  color: tipoColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(tipoIcon, size: 18, color: tipoColor),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _chip(tipoLabel, tipoColor),
                      if (esPrivado) ...[
                        const SizedBox(width: 4),
                        _chip('Privado', Colors.grey),
                      ],
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.usuarioNombre ?? 'Desconocido',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(item.contenido,
                      style: TextStyle(fontSize: 13, color: Colors.grey[800])),
                  // Archivos adjuntos al seguimiento
                  if (attachments.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    const Divider(height: 1),
                    const SizedBox(height: 8),
                    ...attachments.map((doc) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Icon(_iconForMime(doc.mime),
                              size: 16, color: Colors.blue[600]),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              doc.filename.isNotEmpty ? doc.filename : doc.nombre,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            _formatSize(doc.size),
                            style: TextStyle(
                                fontSize: 11, color: Colors.grey[500]),
                          ),
                          if (onDocMenu != null)
                            GestureDetector(
                              onTap: () => onDocMenu!(doc),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Icon(Icons.more_vert,
                                    size: 16, color: Colors.grey[500]),
                              ),
                            ),
                        ],
                      ),
                    )),
                  ],
                  const SizedBox(height: 4),
                  Text(formatDate(item.fecha),
                      style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                  if (onLongPress != null)
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text('Mantén presionado para editar',
                          style: TextStyle(fontSize: 10, color: Colors.blue, fontStyle: FontStyle.italic)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget _chip(String label, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Text(label,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: color)),
      );
}

// ── Documento en Timeline ─────────────────────────────────────────────────

class _DocumentoTimelineItem extends StatelessWidget {
  final GlpiDocumento doc;
  final String Function(String?) formatDate;
  final bool esCreador;
  final VoidCallback onMenu;

  const _DocumentoTimelineItem({
    required this.doc,
    required this.formatDate,
    required this.esCreador,
    required this.onMenu,
  });

  static const _color = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: esCreador ? onMenu : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: _color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(_iconForMime(doc.mime), size: 18, color: _color),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _chip('Documento', _color),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            doc.usuarioNombre ?? 'Desconocido',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: onMenu,
                          child: Icon(Icons.more_vert,
                              size: 18, color: Colors.grey[500]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doc.nombre,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${_formatSize(doc.size)} · ${formatDate(doc.fecha)}',
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey[500]),
                    ),
                    if (esCreador)
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          'Mantén presionado para opciones',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconForMime(String mime) {
    if (mime.startsWith('image/')) return Icons.image_outlined;
    if (mime == 'application/pdf') return Icons.picture_as_pdf_outlined;
    if (mime.contains('word')) return Icons.description_outlined;
    if (mime.contains('sheet') || mime.contains('excel'))
      return Icons.table_chart_outlined;
    return Icons.insert_drive_file_outlined;
  }

  String _formatSize(int bytes) {
    if (bytes <= 0) return '—';
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Widget _chip(String label, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: color),
        ),
      );
}

// ── Barra inferior ────────────────────────────────────────────────────────

class _BottomBar extends StatelessWidget {
  final TextEditingController controller;
  final bool sending;
  final GerenciaTheme theme;
  final VoidCallback onSend;
  final VoidCallback onReply;

  const _BottomBar({
    required this.controller,
    required this.sending,
    required this.theme,
    required this.onSend,
    required this.onReply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          12, 8, 12, MediaQuery.of(context).padding.bottom + 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, -2)),
        ],
      ),
      child: Row(
        children: [
          Material(
            color: theme.colorPrimario,
            borderRadius: BorderRadius.circular(22),
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: onReply,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.reply, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text('Responder',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Seguimiento rápido...',
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide.none),
              ),
              maxLines: 3,
              minLines: 1,
            ),
          ),
          const SizedBox(width: 6),
          sending
              ? const SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(strokeWidth: 2))
              : GestureDetector(
                  onTap: onSend,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: theme.colorPrimario, shape: BoxShape.circle),
                    child: const Icon(Icons.send, color: Colors.white, size: 18),
                  ),
                ),
        ],
      ),
    );
  }
}

// ── Timeline vacío ────────────────────────────────────────────────────────

class _EmptyTimeline extends StatelessWidget {
  const _EmptyTimeline();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Icon(Icons.forum_outlined, size: 64, color: Colors.grey[300]),
              const SizedBox(height: 12),
              Text('Sin actividad aún',
                  style: TextStyle(color: Colors.grey[500], fontSize: 16)),
              const SizedBox(height: 6),
              Text('Desliza hacia abajo para actualizar',
                  style: TextStyle(color: Colors.grey[400], fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}


// ─────────────────────────────────────────────────────────────────────────────
//  Hoja de edición de comentario
// ─────────────────────────────────────────────────────────────────────────────

class _EditarComentarioSheet extends StatefulWidget {
  final TareaTimelineItem item;
  final Future<void> Function(String) onGuardar;

  const _EditarComentarioSheet({required this.item, required this.onGuardar});

  @override
  State<_EditarComentarioSheet> createState() => _EditarComentarioSheetState();
}

class _EditarComentarioSheetState extends State<_EditarComentarioSheet> {
  late final TextEditingController _ctrl;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.item.contenido);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40, height: 4,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
          ),
          const Text('Editar comentario',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextField(
            controller: _ctrl,
            maxLines: 5,
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _loading ? null : _guardar,
              icon: _loading
                  ? const SizedBox(width: 18, height: 18,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Icon(Icons.save_outlined),
              label: _loading ? const Text('Guardando...') : const Text('Guardar cambios'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _guardar() async {
    final texto = _ctrl.text.trim();
    if (texto.isEmpty) return;
    setState(() => _loading = true);
    try {
      await widget.onGuardar(texto);
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Preview de imagen
// ─────────────────────────────────────────────────────────────────────────────

class _ImagenPreviewDialog extends StatelessWidget {
  final String nombre;
  final Uint8List bytes;

  const _ImagenPreviewDialog({required this.nombre, required this.bytes});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: Text(nombre, overflow: TextOverflow.ellipsis),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            automaticallyImplyLeading: false,
          ),
          InteractiveViewer(
            child: Image.memory(bytes),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Visor de PDF
// ─────────────────────────────────────────────────────────────────────────────

class _PdfViewer extends StatelessWidget {
  final String nombre;
  final Uint8List bytes;

  const _PdfViewer({required this.nombre, required this.bytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre, overflow: TextOverflow.ellipsis),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SfPdfViewer.memory(bytes),
    );
  }
}
