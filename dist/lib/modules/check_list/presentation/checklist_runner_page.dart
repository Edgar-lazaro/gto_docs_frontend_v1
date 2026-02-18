import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/auth/role_utils.dart';
import '../../../core/network/lan_gate.dart';
import '../../../core/pdfs/generated_pdf.dart';
import '../../../core/pdfs/generated_pdf_providers.dart';
import '../../../core/pdfs/pdf_upload_providers.dart';
import '../../../core/reports_engine/checklist_models.dart';
import '../../../core/reports_engine/checklist_report_form.dart';
import '../../../core/reports_engine/etp_models.dart';
import '../../../core/reports_engine/etp_report_form.dart';
import '../../../core/reports_engine/maintenance_preventivo_pdf.dart';
import '../../../core/reports_engine/etp_checklist_pdf.dart';
import '../../../core/reports_engine/pdf_file_service.dart';
import '../../../core/reports_engine/reports_catalog.dart';
import '../domain/checklist_existente.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../../../shared/ui/widgets/gerencia_app_bar.dart';
import '../../tareas/domain/tarea.dart';
import '../../tareas/presentation/tareas_providers.dart';

class UlKJ4tygr7WfnyTNeVB extends ConsumerStatefulWidget {
  final GerenciaTheme dMGUn;
  final int g6e7CskfGn;
  final String gf58FST9dJ9aPv;
  final ChecklistExistente qsQyRlEYj;

  const UlKJ4tygr7WfnyTNeVB({
    super.key,
    required this.dMGUn,
    required this.g6e7CskfGn,
    required this.gf58FST9dJ9aPv,
    required this.qsQyRlEYj,
  });

  @override
  ConsumerState<UlKJ4tygr7WfnyTNeVB> createState() =>
      _E8tubzr4ABcUAajKtdZnaNT9();
}

class _E8tubzr4ABcUAajKtdZnaNT9 extends ConsumerState<UlKJ4tygr7WfnyTNeVB> {
  bool _sBbz = false;
  GeneratedPdf? _j1Om;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kind = _resolveKindForChecklist(
      funcionForm: widget.qsQyRlEYj.funcionForm,
      checklistNombre: widget.qsQyRlEYj.nombre,
    );

    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.dMGUn,
        title: widget.qsQyRlEYj.nombre,
        actions: [
          IconButton(
            tooltip: 'Subir PDF (LAN)',
            icon: const Icon(Icons.cloud_upload),
            onPressed: _sBbz ? null : _aLd5gJ4h,
          ),
        ],
      ),
      body: Stack(
        children: [
          if (kind == _OmdH2VF3IXjjv.jfyHnNDqyQ)
            ChecklistReportForm(
              definition: ReportsCatalog.mantenimientoSites,
              onSubmit: _qfam7IePImWBYWEcCSe,
            )
          else if (kind == _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ)
            ChecklistReportForm(
              definition: ReportsCatalog.mantenimientoMostrador,
              onSubmit: _qfam7IePImWBYWEcCSe,
            )
          else if (kind == _OmdH2VF3IXjjv.oi2)
            EtpChecklistForm(
              definition: ReportsCatalog.checklistEtp,
              userName: ref.read(authControllerProvider).user?.nombre ?? '',
              checklistName: widget.qsQyRlEYj.nombre,
              onSubmit: _f7CVCBzjevV,
            )
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Este checklist aún no está soportado en v2.\nfuncion_form: ${widget.qsQyRlEYj.funcionForm}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          if (_sBbz)
            const Positioned.fill(
              child: ColoredBox(
                color: Color(0x88000000),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _qfam7IePImWBYWEcCSe(ChecklistReportDraft draft) async {
    await _kIkIrW4fvZI0W5dHyi(
      filenamePrefix: 'checklist',
      build: () => MaintenancePreventivoPdf.build(
        definition: _s4VjK5MMu4BzCYQWI8zZO(
          funcionForm: widget.qsQyRlEYj.funcionForm,
          checklistNombre: widget.qsQyRlEYj.nombre,
        ),
        draft: draft,
      ),
    );
  }

  Future<void> _f7CVCBzjevV(EtpChecklistDraft draft) async {
    await _kIkIrW4fvZI0W5dHyi(
      filenamePrefix: 'checklist',
      build: () => EtpChecklistPdf.build(
        definition: ReportsCatalog.checklistEtp,
        draft: draft,
      ),
    );
  }

  ChecklistReportDefinition _s4VjK5MMu4BzCYQWI8zZO({
    required String funcionForm,
    required String checklistNombre,
  }) {
    final kind = _resolveKindForChecklist(
      funcionForm: funcionForm,
      checklistNombre: checklistNombre,
    );
    if (kind == _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ) {
      return ReportsCatalog.mantenimientoMostrador;
    }
    return ReportsCatalog.mantenimientoSites;
  }

  Future<void> _kIkIrW4fvZI0W5dHyi({
    required String filenamePrefix,
    required Future<Uint8List> Function() build,
  }) async {
    if (_sBbz) return;
    setState(() => _sBbz = true);

    try {
      final bytes = await build();
      final filename =
          '${filenamePrefix}_${widget.qsQyRlEYj.id}_${DateTime.now().millisecondsSinceEpoch}.pdf';

      final file = await PdfFileService.saveToDocuments(
        bytes: bytes,
        filename: filename,
      );

      final user = ref.read(authControllerProvider).user;
      final pdf = GeneratedPdf(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        filename: filename,
        localPath: file.path,
        createdAt: DateTime.now(),
        createdByUserId: user?.id ?? '',
        createdByName: user?.nombre ?? '',
        area: user?.area ?? '',
        gerenciaId: user?.resolvedGerenciaId,
        source: 'checklist',
        jefaturaId: widget.g6e7CskfGn,
        checklistId: widget.qsQyRlEYj.id,
        checklistNombre: widget.qsQyRlEYj.nombre,
      );

      await ref.read(generatedPdfRepositoryProvider).add(pdf);
      setState(() => _j1Om = pdf);

      // Crear tarea automáticamente por checklist generado.
      if (user != null && user.id.trim().isNotEmpty) {
        final tarea = Tarea(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          reporteId: 'checklist:${widget.qsQyRlEYj.id}',
          titulo: pdf.filename,
          descripcion: pdf.filename,
          creadoPor: user.id,
          asignadoA: user.id,
          estado: TareaEstado.pendiente,
        );
        await ref.read(tareaControllerProvider).crearTarea(tarea);
      }

      await PdfFileService.openFile(file);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo generar PDF: $e')));
    } finally {
      if (mounted) setState(() => _sBbz = false);
    }
  }

  Future<void> _aLd5gJ4h() async {
    final pdf =
        _j1Om ??
        ref
            .read(generatedPdfRepositoryProvider)
            .latestForChecklist(
              jefaturaId: widget.g6e7CskfGn,
              checklistId: widget.qsQyRlEYj.id,
            );

    if (pdf == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Primero genera el PDF')));
      return;
    }

    if (!await LanGate.isOnLan()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subida disponible solo en LAN corporativa'),
        ),
      );
      return;
    }

    final file = File(pdf.localPath);
    if (!await file.exists()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se encontró el archivo local del PDF'),
        ),
      );
      return;
    }

    setState(() => _sBbz = true);
    try {
      final user = ref.read(authControllerProvider).user;
      final url = await ref
          .read(pdfUploadApiRepositoryProvider)
          .uploadPdf(
            file: file,
            filename: pdf.filename,
            metadata: {
              'usuarioId': user?.id,
              'usuarioNombre': user?.nombre,
              'area': user?.area,
              'gerenciaId': user?.resolvedGerenciaId,
              'jefaturaId': widget.g6e7CskfGn,
              'checklistId': widget.qsQyRlEYj.id,
              'checklistNombre': widget.qsQyRlEYj.nombre,
              'source': 'checklist',
            }..removeWhere((_, v) => v == null),
          );

      await ref
          .read(generatedPdfRepositoryProvider)
          .markUploaded(id: pdf.id, url: url);
      ref.invalidate(generatedPdfsProvider);
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('PDF subido correctamente')));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo subir PDF: $e')));
    } finally {
      if (mounted) setState(() => _sBbz = false);
    }
  }
}

enum _OmdH2VF3IXjjv { jfyHnNDqyQ, hTcocd4wcHMS5ZZ, oi2, lxkETqF }

String _normalizeToken(String text) {
  final raw = text.trim().toLowerCase();
  // Mantiene solo letras/números para tolerar espacios, guiones, underscores, etc.
  return raw.replaceAll(RegExp(r'[^a-z0-9]+'), '');
}

_OmdH2VF3IXjjv _resolveKind(String funcionForm) {
  final f = _normalizeToken(funcionForm);
  if (f.isEmpty) return _OmdH2VF3IXjjv.lxkETqF;
  if (f.contains('etp')) return _OmdH2VF3IXjjv.oi2;

  // Mantto mostrador (ej: "manttoMostra", "mantto_mostrador", etc)
  if (f.contains('mostra') ||
      f.contains('mostrador') ||
      f.contains('mostradores')) {
    return _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ;
  }

  // Mantto sites (ej: "manttoSite", "mantenimiento_sites")
  if (f.contains('site') || f.contains('sites')) {
    return _OmdH2VF3IXjjv.jfyHnNDqyQ;
  }

  // Telecomm/telecom suele ser un subtipo de mantenimiento; por ahora lo tratamos
  // como mantenimiento (site por defecto) para que el formulario abra.
  if (f.contains('telecomm') || f.contains('telecom') || f.contains('telco')) {
    return _OmdH2VF3IXjjv.jfyHnNDqyQ;
  }

  // Mantenimiento genérico (ej: "mantto", "mantenimiento").
  if (f.contains('mantto') ||
      f.contains('mantenimiento') ||
      f.contains('mntto')) {
    return _OmdH2VF3IXjjv.jfyHnNDqyQ;
  }

  return _OmdH2VF3IXjjv.lxkETqF;
}

_OmdH2VF3IXjjv _resolveKindForChecklist({
  required String funcionForm,
  required String checklistNombre,
}) {
  final kind = _resolveKind(funcionForm);
  final name = _normalizeToken(checklistNombre);

  // Si el backend manda funcion_form genérico (mantto/mantenimiento) pero el
  // nombre trae "mostrador/mostradores", abrimos el formulario correcto.
  final isGenericMantto =
      _normalizeToken(funcionForm).contains('mantto') ||
      _normalizeToken(funcionForm).contains('mantenimiento') ||
      _normalizeToken(funcionForm).contains('mntto');
  final nameSaysMostrador =
      name.contains('mostra') ||
      name.contains('mostrador') ||
      name.contains('mostradores');

  if (kind == _OmdH2VF3IXjjv.jfyHnNDqyQ &&
      isGenericMantto &&
      nameSaysMostrador) {
    return _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ;
  }

  if (kind == _OmdH2VF3IXjjv.lxkETqF && nameSaysMostrador) {
    return _OmdH2VF3IXjjv.hTcocd4wcHMS5ZZ;
  }

  return kind;
}
