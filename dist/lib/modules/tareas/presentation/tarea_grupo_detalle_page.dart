import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/auth/auth_models.dart';
import '../../../core/auth/auth_providers.dart';
import '../../../core/auth/role_utils.dart';
import '../../../core/database/database_providers.dart';
import '../../../core/network/providers.dart';
import '../../../core/users/users_providers.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../data/tarea_avances_api_repository.dart';
import '../data/tarea_timeline_api_repository.dart';
import '../domain/tarea.dart';
import '../domain/tarea_adjunto.dart';
import '../domain/tarea_comentario.dart';
import 'tarea_glpi_actions.dart';
import 'tareas_providers.dart';

class TareaGrupoDetallePage extends ConsumerStatefulWidget {
  final GerenciaTheme theme;
  final String groupId;
  final Tarea? fallback;

  const TareaGrupoDetallePage({
    super.key,
    required this.theme,
    required this.groupId,
    this.fallback,
  });

  @override
  ConsumerState<TareaGrupoDetallePage> createState() =>
      _TareaGrupoDetallePageState();
}

class _TareaGrupoDetallePageState extends ConsumerState<TareaGrupoDetallePage> {
  final _comentarioCtrl = TextEditingController();
  final _picker = ImagePicker();

  @override
  void dispose() {
    _comentarioCtrl.dispose();
    super.dispose();
  }

  void _submitComentario(String currentUserId) {
    final txt = _comentarioCtrl.text.trim();
    if (txt.isEmpty) return;
    _comentarioCtrl.clear();
    ref.read(tareaComentariosRepositoryProvider).agregarComentario(
      tareaId: widget.groupId,
      autorId: currentUserId,
      mensaje: txt,
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final user = auth.user;

    if (auth.status != AuthStatus.authenticated || user == null) {
      return const Scaffold(body: Center(child: Text('Debes iniciar sesión')));
    }

    final allAsync = ref.watch(todasLasTareasProvider);
    final comentariosAsync = ref.watch(
      tareaComentariosProvider(widget.groupId),
    );
    final adjuntosAsync = ref.watch(tareaAdjuntosProvider(widget.groupId));

    final headTarea = ref.watch(todasLasTareasProvider).valueOrNull
        ?.where(
          (t) =>
              (t.groupId?.trim().isNotEmpty ?? false) &&
              t.groupId == widget.groupId,
        )
        .firstOrNull;
    final hasGlpiTicket = false; // We'll check the tarea from API later
    if (headTarea != null) {
      // hasGlpiTicket = headTarea.glpiTicketId != null;
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      floatingActionButton: TareaGlpiFab(
        theme: widget.theme,
        tareaId: widget.groupId,
      ),
      appBar: AppBar(
        backgroundColor: widget.theme.colorPrimario,
        elevation: 4,
        shadowColor: widget.theme.colorPrimario.withValues(alpha: 0.15),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detalle de tarea',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: allAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (all) {
          final group = all
              .where(
                (t) =>
                    (t.groupId?.trim().isNotEmpty ?? false) &&
                    t.groupId == widget.groupId,
              )
              .toList(growable: false);

          final effective = group.isNotEmpty
              ? group
              : (widget.fallback != null
                    ? <Tarea>[widget.fallback!]
                    : const <Tarea>[]);

          if (effective.isEmpty) {
            return const Center(child: Text('No se encontró la tarea'));
          }

          // Tomamos el primero como "cabecera".
          final head = effective.first;

          final gerenciaId = user.resolvedGerenciaId;
          final usersAsync = ref.watch(usersListByGerenciaProvider(gerenciaId));

          String displayEstado(TareaEstado estado) {
            return switch (estado) {
              TareaEstado.pendiente => 'Pendiente',
              TareaEstado.enProceso => 'En proceso',
              TareaEstado.completada => 'Completada',
            };
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final isTablet = constraints.maxWidth >= 600;
              final horizontalPadding = constraints.maxWidth >= 1200
                  ? 120.0
                  : constraints.maxWidth >= 900
                  ? 80.0
                  : constraints.maxWidth >= 600
                  ? 60.0
                  : 24.0;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isTablet ? 32 : 24,
                ),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            isTablet ? 20 : 16,
                          ),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                head.titulo,
                                style: TextStyle(
                                  fontSize: isTablet ? 22 : 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _row('Descripción', head.descripcion),
                              _row(
                                'Reporte',
                                head.reporteId.isEmpty ? '-' : head.reporteId,
                              ),
                              _row(
                                'Asignadores',
                                (head.creadoPor ?? '').isEmpty
                                    ? '-'
                                    : head.creadoPor!,
                              ),
                              _row('Grupo', widget.groupId),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: isTablet ? 16 : 12),
                      const TabBar(
                        tabs: [
                          Tab(text: 'Asignados'),
                          Tab(text: 'Comentarios'),
                          Tab(text: 'Adjuntos'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: TabBarView(
                          children: [
                            usersAsync.when(
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              error: (error, stackTrace) => _assigneesList(
                                context,
                                effective,
                                displayEstado,
                                theme: widget.theme,
                                nameForUserId: (id) => id,
                                canEdit: (t) =>
                                    user.isSupervisor ||
                                    t.asignadoA == user.id ||
                                    t.creadoPor == user.id,
                              ),
                              data: (users) {
                                final byId = <String, String>{
                                  for (final u in users) u.id: u.name,
                                };
                                return _assigneesList(
                                  context,
                                  effective,
                                  displayEstado,
                                  theme: widget.theme,
                                  nameForUserId: (id) => byId[id] ?? id,
                                  canEdit: (t) =>
                                      user.isSupervisor ||
                                      t.asignadoA == user.id ||
                                      t.creadoPor == user.id,
                                onEstadoChanged: (t, next) async {
                                  // Try to get the backend numeric ID for API call
                                  String? backendId;
                                  try {
                                    final db = ref.read(appDatabaseProvider);
                                    final rows = await (db.select(db.tareasTable)
                                          ..where(
                                            (tbl) => tbl.id.equals(t.id),
                                          ))
                                        .get();
                                    if (rows.isNotEmpty) {
                                      backendId = rows.first.remoteId;
                                    }
                                  } catch (_) {}
                                  final dio = ref.read(dioProvider);
                                  final apiId = backendId ?? t.id;
                                  try {
                                    await dio.patch(
                                      '/tareas/$apiId/estado',
                                      data: {
                                        'estado': next.name == 'enProceso'
                                            ? 'en_proceso'
                                            : next.name,
                                      },
                                    );
                                  } catch (_) {}
                                  await ref
                                      .read(tareaRepositoryProvider)
                                      .actualizarEstado(
                                        tareaId: t.id,
                                        estado: next,
                                      );
                                  ref.invalidate(todasLasTareasProvider);
                                },
                                );
                              },
                            ),
                            _comentariosTab(
                              context,
                              comentariosAsync,
                              currentUserId: user.id,
                              tareaId: widget.groupId,
                            ),
                            _adjuntosTab(context, adjuntosAsync),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _comentariosTab(
    BuildContext context,
    AsyncValue<List<TareaComentario>> comentariosAsync, {
    required String currentUserId,
    String? tareaId,
  }) {
    final apiAvancesAsync = (tareaId != null)
        ? ref.watch(tareaAvancesApiProvider(tareaId))
        : null;
    final timelineAsync = (tareaId != null)
        ? ref.watch(tareaTimelineApiProvider(tareaId))
        : null;

    Future<void> _onRefresh() async {
      if (tareaId != null) {
        ref.invalidate(tareaComentariosProvider(tareaId));
        ref.invalidate(tareaAvancesApiProvider(tareaId));
        ref.invalidate(tareaTimelineApiProvider(tareaId));
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }

    return Column(
      children: [
        Expanded(
          child: comentariosAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (comentarios) {
              return apiAvancesAsync?.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, _) => const SizedBox.shrink(),
                    data: (apiAvances) {
                      return _buildComentariosList(
                        comentarios,
                        apiAvances,
                        timelineAsync,
                        currentUserId,
                        _onRefresh,
                      );
                    },
                  ) ??
                  _buildComentariosList(
                    comentarios,
                    [],
                    null,
                    currentUserId,
                    _onRefresh,
                  );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _comentarioCtrl,
                decoration: const InputDecoration(
                  hintText: 'Escribe un comentario…',
                  isDense: true,
                ),
                minLines: 1,
                maxLines: 3,
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              tooltip: 'Enviar',
              icon: const Icon(Icons.send),
              onPressed: () => _submitComentario(currentUserId),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildComentariosList(
    List<TareaComentario> comentarios,
    List<TareaAvanceApi> apiAvances,
    AsyncValue<List<TareaTimelineItem>>? timelineAsync,
    String currentUserId,
    Future<void> Function() onRefresh,
  ) {
    final items = <_ComentarioItem>[
      for (final c in comentarios)
        _ComentarioItem(
          texto: c.mensaje,
          autor: c.autorId == currentUserId ? 'Tú' : c.autorId,
          fecha: c.creadoEn.toLocal().toString(),
          autorId: c.autorId,
        ),
      for (final a in apiAvances)
        _ComentarioItem(
          texto: a.descripcion,
          autor: a.usuarioNombre ?? a.usuarioId ?? '?',
          fecha: a.fechaCreacion ?? '',
          autorId: a.usuarioId,
        ),
      if (timelineAsync != null)
        ...timelineAsync.maybeWhen(
          data: (items) => items.map((t) => _ComentarioItem(
            texto: t.contenido,
            autor: t.usuarioNombre ?? 'GLPI',
            fecha: t.fecha,
            tipo: t.tipo,
          )),
          orElse: () => <_ComentarioItem>[],
        ),
    ];
    items.sort((a, b) => a.fecha.compareTo(b.fecha));
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: _buildCommentList(items),
    );
  }

  String _tipoLabel(String tipo) {
    switch (tipo) {
      case 'followup':
        return 'Comentario';
      case 'task':
        return 'Tarea';
      case 'solution':
        return 'Solución';
      case 'validation':
        return 'Validación';
      default:
        return tipo;
    }
  }

  Widget _buildCommentList(List<_ComentarioItem> items) {
    if (items.isEmpty) {
      return const Center(child: Text('Sin comentarios'));
    }
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final item = items[i];
        final cs = Theme.of(context).colorScheme;
        final isGlpi = item.tipo != null;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (isGlpi)
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Icon(
                          Icons.cloud_sync,
                          size: 16,
                          color: cs.primary,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        isGlpi
                            ? '${item.autor} - ${_tipoLabel(item.tipo!)}'
                            : item.autor,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(item.texto),
                const SizedBox(height: 6),
                Text(
                  item.fecha,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _adjuntosTab(
    BuildContext context,
    AsyncValue<List<TareaAdjunto>> adjuntosAsync,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {
                  final source = await showModalBottomSheet<ImageSource>(
                    context: context,
                    builder: (ctx) => SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.photo_camera),
                            title: const Text('Cámara'),
                            onTap: () =>
                                Navigator.of(ctx).pop(ImageSource.camera),
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Galería'),
                            onTap: () =>
                                Navigator.of(ctx).pop(ImageSource.gallery),
                          ),
                        ],
                      ),
                    ),
                  );
                  if (source == null) return;
                  final file = await _picker.pickImage(
                    source: source,
                    imageQuality: 85,
                  );
                  if (file == null) return;
                  await ref
                      .read(tareaAdjuntosRepositoryProvider)
                      .agregarAdjunto(
                        tareaId: widget.groupId,
                        tipo: TareaAdjuntoTipo.foto,
                        nombre: file.name,
                        localPath: file.path,
                        mimeType: 'image/${file.path.split('.').last}',
                      );
                },
                icon: const Icon(Icons.add_a_photo),
                label: const Text('Foto'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                    withData: false,
                  );
                  final picked = result?.files.single;
                  final path = picked?.path;
                  if (picked == null || path == null) return;
                  await ref
                      .read(tareaAdjuntosRepositoryProvider)
                      .agregarAdjunto(
                        tareaId: widget.groupId,
                        tipo: TareaAdjuntoTipo.documento,
                        nombre: picked.name,
                        localPath: path,
                        mimeType: null,
                      );
                },
                icon: const Icon(Icons.attach_file),
                label: const Text('Documento'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: adjuntosAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (adjuntos) {
              final list = adjuntos;
              if (list.isEmpty) {
                return const Center(child: Text('Sin adjuntos'));
              }
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final a = list[i];
                  final tipo = a.tipo;
                  final nombre = a.nombre;
                  final localPath = a.localPath;
                  final remoteUrl = a.remoteUrl;
                  final icon = (tipo.toString().contains('foto'))
                      ? Icons.image
                      : Icons.description;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(icon),
                      title: Text(nombre),
                      subtitle: Text(remoteUrl ?? localPath),
                      trailing: remoteUrl == null
                          ? const Text('Pendiente')
                          : const Text('OK'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  static Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              '$label:',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  static Widget _assigneesList(
    BuildContext context,
    List<Tarea> tasks,
    String Function(TareaEstado) displayEstado, {
    required GerenciaTheme theme,
    required String Function(String userId) nameForUserId,
    required bool Function(Tarea tarea) canEdit,
    Future<void> Function(Tarea tarea, TareaEstado next)? onEstadoChanged,
  }) {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final t = tasks[i];
        final editable = canEdit(t);
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(nameForUserId(t.asignadoA)),
            subtitle: Text(displayEstado(t.estado)),
            trailing: editable && onEstadoChanged != null
                ? TextButton.icon(
                    onPressed: () => _showEstadoDialog(
                      context,
                      theme: theme,
                      current: t.estado,
                      onSelected: (next) async {
                        if (onEstadoChanged != null) {
                          await onEstadoChanged(t, next);
                        }
                      },
                    ),
                    icon: const Icon(Icons.edit),
                    label: const Text('Cambiar'),
                  )
                : null,
          ),
        );
      },
    );
  }

  static void _showEstadoDialog(
    BuildContext context, {
    required GerenciaTheme theme,
    required TareaEstado current,
    required Future<void> Function(TareaEstado) onSelected,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cambiar estatus'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: TareaEstado.values.map((estado) {
            final selected = estado == current;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        selected ? theme.colorPrimario.withValues(alpha: 0.1) : null,
                    side: BorderSide(
                      color: selected ? theme.colorPrimario : Colors.grey[300]!,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(ctx);
                    if (estado != current) {
                      await onSelected(estado);
                    }
                  },
                  child: Text(
                    {
                      TareaEstado.pendiente: 'Pendiente',
                      TareaEstado.enProceso: 'En proceso',
                      TareaEstado.completada: 'Completada',
                    }[estado]!,
                    style: TextStyle(
                      color: selected ? theme.colorPrimario : null,
                      fontWeight: selected ? FontWeight.bold : null,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}

class _ComentarioItem {
  final String texto;
  final String autor;
  final String fecha;
  final String? autorId;
  final String? tipo;

  _ComentarioItem({
    required this.texto,
    required this.autor,
    required this.fecha,
    this.autorId,
    this.tipo,
  });
}
