import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_providers.dart';
import '../../../core/network/providers.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../../usuarios_glpi/data/glpi_user_model.dart';

final _glpiUsersProvider = FutureProvider<List<GlpiUserModel>>((ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/tareas/glpi-users');
  final list = response.data as List;
  return list
      .map((json) => GlpiUserModel(
            id: (json['id'] ?? 0) is int
                ? json['id'] as int
                : int.tryParse(json['id'].toString()) ?? 0,
            name: (json['name'] as String?) ?? '',
            firstname: (json['firstname'] as String?) ?? '',
            realname: (json['realname'] as String?) ?? '',
          ))
      .toList();
});

Future<T?> _showFormSheet<T>({
  required BuildContext context,
  required GerenciaTheme theme,
  required String title,
  required Widget body,
  required Widget actions,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) => SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorPrimario,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: body,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: actions,
            ),
          ],
        ),
      ),
    ),
  );
}

class TareaGlpiFab extends ConsumerWidget {
  final GerenciaTheme theme;
  final String tareaId;

  const TareaGlpiFab({
    super.key,
    required this.theme,
    required this.tareaId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      backgroundColor: theme.colorPrimario,
      onPressed: () => _showOptions(context, ref),
      icon: const Icon(Icons.reply, color: Colors.white),
      label: const Text(
        'Responder',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _showOptions(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Responder',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _option(
                ctx,
                icon: Icons.task_alt,
                label: 'Crear tarea',
                onTap: () {
                  Navigator.pop(ctx);
                  _showCrearTarea(context, ref);
                },
              ),
              _option(
                ctx,
                icon: Icons.check_circle_outline,
                label: 'Añadir solución',
                onTap: () {
                  Navigator.pop(ctx);
                  _showAnadirSolucion(context, ref);
                },
              ),
              _option(
                ctx,
                icon: Icons.attach_file,
                label: 'Añadir documento',
                onTap: () {
                  Navigator.pop(ctx);
                  _showAnadirDocumento(context, ref);
                },
              ),
              _option(
                ctx,
                icon: Icons.verified_outlined,
                label: 'Solicitar validación',
                onTap: () {
                  Navigator.pop(ctx);
                  _showSolicitarValidacion(context, ref);
                },
              ),
              _option(
                ctx,
                icon: Icons.approval,
                label: 'Aprobar solución',
                onTap: () {
                  Navigator.pop(ctx);
                  _showAprobarSolucion(context, ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _option(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: theme.colorPrimario),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _showCrearTarea(BuildContext context, WidgetRef ref) {
    final descCtrl = TextEditingController();
    final fechaCtrl = TextEditingController();
    String estatus = 'por_hacer';
    String? archivoPath;

    _showFormSheet(
      context: context,
      theme: theme,
      title: 'Crear tarea',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: descCtrl,
            decoration: const InputDecoration(
              labelText: 'Descripción de la tarea',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: fechaCtrl,
            decoration: const InputDecoration(
              labelText: 'Fecha límite',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (date != null) {
                fechaCtrl.text =
                    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
              }
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: estatus,
            decoration: const InputDecoration(
              labelText: 'Estatus',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'por_hacer', child: Text('Por hacer')),
              DropdownMenuItem(value: 'realizado', child: Text('Realizado')),
            ],
            onChanged: (v) => estatus = v ?? 'por_hacer',
          ),
          const SizedBox(height: 12),
          _ArchivoPicker(
            onPicked: (p) => archivoPath = p,
          ),
        ],
      ),
      actions: _ActionButtons(
        theme: theme,
        onSubmit: () async {
          final desc = descCtrl.text.trim();
          if (desc.isEmpty) return;
          try {
            final db = ref.read(appDatabaseProvider);
            await db.into(db.syncQueueTable).insert(
              SyncQueueTableCompanion.insert(
                entidad: 'glpi_task',
                entidadId: const Uuid().v4(),
                accion: 'create',
                payload: Value({
                  'tareaId': tareaId,
                  'descripcion': desc,
                  if (fechaCtrl.text.isNotEmpty)
                    'fechaLimite': fechaCtrl.text,
                  'estatus': estatus,
                }),
              ),
            );
            if (archivoPath != null) {
              await db.into(db.syncQueueTable).insert(
                SyncQueueTableCompanion.insert(
                  entidad: 'glpi_document',
                  entidadId: const Uuid().v4(),
                  accion: 'upload',
                  payload: Value({
                    'tareaId': tareaId,
                    'encabezado': 'Evidencia tarea',
                    'localPath': archivoPath!,
                  }),
                ),
              );
            }
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tarea en cola de sincronización'),
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $e')),
              );
            }
          }
        },
      ),
    );
  }

  void _showAnadirSolucion(BuildContext context, WidgetRef ref) {
    final contenidoCtrl = TextEditingController();
    String estatus = 'realizada';
    String? archivoPath;

    _showFormSheet(
      context: context,
      theme: theme,
      title: 'Añadir solución',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: contenidoCtrl,
            decoration: const InputDecoration(
              labelText: '¿Cómo lo solucionaste?',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: estatus,
            decoration: const InputDecoration(
              labelText: 'Estatus',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: 'realizada',
                child: Text('Realizada'),
              ),
              DropdownMenuItem(
                value: 'propuesta',
                child: Text('Propuesta'),
              ),
              DropdownMenuItem(
                value: 'cancelada',
                child: Text('Cancelada'),
              ),
            ],
            onChanged: (v) => estatus = v ?? 'realizada',
          ),
          const SizedBox(height: 12),
          _ArchivoPicker(
            onPicked: (p) => archivoPath = p,
          ),
        ],
      ),
      actions: _ActionButtons(
        theme: theme,
        onSubmit: () async {
          final contenido = contenidoCtrl.text.trim();
          if (contenido.isEmpty) return;
          try {
            final db = ref.read(appDatabaseProvider);
            await db.into(db.syncQueueTable).insert(
              SyncQueueTableCompanion.insert(
                entidad: 'glpi_solution',
                entidadId: const Uuid().v4(),
                accion: 'create',
                payload: Value({
                  'tareaId': tareaId,
                  'contenido': contenido,
                  'estatus': estatus,
                }),
              ),
            );
            if (archivoPath != null) {
              await db.into(db.syncQueueTable).insert(
                SyncQueueTableCompanion.insert(
                  entidad: 'glpi_document',
                  entidadId: const Uuid().v4(),
                  accion: 'upload',
                  payload: Value({
                    'tareaId': tareaId,
                    'encabezado': 'Evidencia solución',
                    'localPath': archivoPath!,
                  }),
                ),
              );
            }
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Solución en cola de sincronización'),
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $e')),
              );
            }
          }
        },
      ),
    );
  }

  void _showAnadirDocumento(BuildContext context, WidgetRef ref) {
    final encabezadoCtrl = TextEditingController();
    String? archivoPath;

    _showFormSheet(
      context: context,
      theme: theme,
      title: 'Añadir documento',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: encabezadoCtrl,
            decoration: const InputDecoration(
              labelText: 'Encabezado',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          _ArchivoPicker(
            maxSizeMb: 2,
            onPicked: (p) => archivoPath = p,
          ),
        ],
      ),
      actions: _ActionButtons(
        theme: theme,
        onSubmit: () async {
          final encabezado = encabezadoCtrl.text.trim();
          if (encabezado.isEmpty || archivoPath == null) return;
          try {
            final db = ref.read(appDatabaseProvider);
            await db.into(db.syncQueueTable).insert(
              SyncQueueTableCompanion.insert(
                entidad: 'glpi_document',
                entidadId: const Uuid().v4(),
                accion: 'upload',
                payload: Value({
                  'tareaId': tareaId,
                  'encabezado': encabezado,
                  'localPath': archivoPath!,
                }),
              ),
            );
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Documento en cola de sincronización'),
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $e')),
              );
            }
          }
        },
      ),
    );
  }

  void _showSolicitarValidacion(BuildContext context, WidgetRef ref) {
    final comentarioCtrl = TextEditingController();
    int? responsableId;
    String? archivoPath;

    _showFormSheet(
      context: context,
      theme: theme,
      title: 'Solicitar validación',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ref.watch(_glpiUsersProvider).when(
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Text('Error: $e'),
            data: (users) => DropdownButtonFormField<int>(
              value: responsableId,
              decoration: const InputDecoration(
                labelText: 'Responsable de validación',
                border: OutlineInputBorder(),
              ),
              items: users
                  .map(
                    (u) => DropdownMenuItem(
                      value: u.id,
                      child: Text(u.name.isNotEmpty ? u.name : u.realname),
                    ),
                  )
                  .toList(),
              onChanged: (v) => responsableId = v,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: comentarioCtrl,
            decoration: const InputDecoration(
              labelText: 'Motivo de la validación',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 12),
          _ArchivoPicker(
            onPicked: (p) => archivoPath = p,
          ),
        ],
      ),
      actions: _ActionButtons(
        theme: theme,
        onSubmit: () async {
          if (responsableId == null) return;
          final comentario = comentarioCtrl.text.trim();
          if (comentario.isEmpty) return;
          try {
            final db = ref.read(appDatabaseProvider);
            await db.into(db.syncQueueTable).insert(
              SyncQueueTableCompanion.insert(
                entidad: 'glpi_validation',
                entidadId: const Uuid().v4(),
                accion: 'create',
                payload: Value({
                  'tareaId': tareaId,
                  'responsableId': responsableId,
                  'comentario': comentario,
                }),
              ),
            );
            if (archivoPath != null) {
              await db.into(db.syncQueueTable).insert(
                SyncQueueTableCompanion.insert(
                  entidad: 'glpi_document',
                  entidadId: const Uuid().v4(),
                  accion: 'upload',
                  payload: Value({
                    'tareaId': tareaId,
                    'encabezado': 'Evidencia validación',
                    'localPath': archivoPath!,
                  }),
                ),
              );
            }
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Validación en cola de sincronización'),
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $e')),
              );
            }
          }
        },
      ),
    );
  }

  void _showAprobarSolucion(BuildContext context, WidgetRef ref) {
    final contenidoCtrl = TextEditingController();
    String accion = 'aprobar';

    _showFormSheet(
      context: context,
      theme: theme,
      title: 'Aprobar solución',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Escribe la solución final y aprueba el ticket',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: contenidoCtrl,
            decoration: const InputDecoration(
              labelText: 'Solución final',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: accion,
            decoration: const InputDecoration(
              labelText: 'Acción',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: 'aprobar',
                child: Text('Aprobar'),
              ),
              DropdownMenuItem(
                value: 'rechazar',
                child: Text('Rechazar'),
              ),
            ],
            onChanged: (v) => accion = v ?? 'aprobar',
          ),
        ],
      ),
      actions: _ActionButtons(
        theme: theme,
        onSubmit: () async {
          final contenido = contenidoCtrl.text.trim();
          if (accion == 'aprobar' && contenido.isEmpty) return;
          try {
            final db = ref.read(appDatabaseProvider);
            await db.into(db.syncQueueTable).insert(
              SyncQueueTableCompanion.insert(
                entidad: 'glpi_solution_approve',
                entidadId: const Uuid().v4(),
                accion: 'approve',
                payload: Value({
                  'tareaId': tareaId,
                  'accion': accion,
                  if (contenido.isNotEmpty) 'contenido': contenido,
                }),
              ),
            );
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    accion == 'aprobar'
                        ? 'Aprobación en cola de sincronización'
                        : 'Rechazo en cola de sincronización',
                  ),
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $e')),
              );
            }
          }
        },
      ),
    );
  }
}

// -- Supporting widgets ------------------------------------------------

class _ActionButtons extends StatelessWidget {
  final GerenciaTheme theme;
  final VoidCallback onSubmit;
  const _ActionButtons({required this.theme, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorPrimario,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onSubmit,
        child: const Text('Enviar', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

class _ArchivoPicker extends StatelessWidget {
  final void Function(String path) onPicked;
  final double maxSizeMb;

  const _ArchivoPicker({required this.onPicked, this.maxSizeMb = 10});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
              final path = result?.files.single.path;
              if (path != null) {
                final sizeMb =
                    (result!.files.single.size ?? 0) / (1024 * 1024);
                if (sizeMb > maxSizeMb) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'El archivo excede el límite de ${maxSizeMb.toInt()}MB',
                        ),
                      ),
                    );
                  }
                  return;
                }
                onPicked(path);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Archivo seleccionado: ${result.files.single.name}',
                      ),
                    ),
                  );
                }
              }
            },
            icon: const Icon(Icons.upload_file),
            label: const Text('Seleccionar archivo'),
          ),
        ),
      ],
    );
  }
}
