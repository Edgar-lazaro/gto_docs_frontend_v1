import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/auth/role_utils.dart';
import '../../../core/pdfs/generated_pdf.dart';
import '../../../core/pdfs/generated_pdf_providers.dart';
import '../../../core/reports_engine/checklist_report_form.dart';
import '../../../core/reports_engine/checklist_models.dart';
import '../../../core/reports_engine/etp_checklist_pdf.dart';
import '../../../core/reports_engine/etp_models.dart';
import '../../../core/reports_engine/etp_report_form.dart';
import '../../../core/reports_engine/maintenance_preventivo_pdf.dart';
import '../../../core/reports_engine/pdf_file_service.dart';
import '../../../core/reports_engine/reports_catalog.dart';
import '../../../shared/ui/theme/gerencia_config.dart';
import '../../../shared/ui/widgets/gerencia_app_bar.dart';
import '../../tareas/domain/tarea.dart';
import '../../tareas/presentation/tareas_providers.dart';

class KTUDj7AS1yEfeWPdov extends StatelessWidget {
  final GerenciaTheme xPamA;

  const KTUDj7AS1yEfeWPdov({super.key, required this.xPamA});

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

    return Scaffold(
      appBar: GerenciaAppBar(theme: xPamA, title: 'Generador de reportes'),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isTablet ? 32 : 24,
        ),
        children: [
          Text(
            'Selecciona un formato',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
          ),
          SizedBox(height: isTablet ? 20 : 16),
          _CuErs1eNjOM7(
            n2C5H: xPamA,
            oaUX7: 'Mantenimiento - Site',
            dOEO2oYG: 'Formato rep_mantto_sites',
            bHmr: _HMx9jKozd201.rZldct2i9t,
          ),
          _CuErs1eNjOM7(
            n2C5H: xPamA,
            oaUX7: 'Mantenimiento - Mostrador',
            dOEO2oYG: 'Formato rep_mantto_mostra',
            bHmr: _HMx9jKozd201.l3FPqCXDlWTUyZl,
          ),
          _CuErs1eNjOM7(
            n2C5H: xPamA,
            oaUX7: 'Checklist ETP',
            dOEO2oYG: 'Formato cl_etp',
            bHmr: _HMx9jKozd201.ifA,
          ),
        ],
      ),
    );
  }
}

enum _HMx9jKozd201 { rZldct2i9t, l3FPqCXDlWTUyZl, ifA }

class _CuErs1eNjOM7 extends ConsumerWidget {
  final GerenciaTheme n2C5H;
  final String oaUX7;
  final String dOEO2oYG;
  final _HMx9jKozd201 bHmr;

  const _CuErs1eNjOM7({
    required this.n2C5H,
    required this.oaUX7,
    required this.dOEO2oYG,
    required this.bHmr,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final cs = Theme.of(context).colorScheme;

    final (icon, accent) = switch (bHmr) {
      _HMx9jKozd201.rZldct2i9t => (Icons.factory_outlined, cs.primaryContainer),
      _HMx9jKozd201.l3FPqCXDlWTUyZl => (
        Icons.storefront_outlined,
        cs.secondaryContainer,
      ),
      _HMx9jKozd201.ifA => (Icons.checklist_outlined, cs.tertiaryContainer),
    };

    return Card(
      margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final user = ref.read(authControllerProvider).user;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  switch (bHmr) {
                    case _HMx9jKozd201.rZldct2i9t:
                      return RnCxkgoHNv1RjLU7JwbJH3oTbkay5q(
                        rhf0q: n2C5H,
                        z00CsXKuVn: ReportsCatalog.mantenimientoSites,
                        iGOnsX4P: user?.nombre ?? '',
                        y2zWoPIB: user?.area ?? '',
                      );
                    case _HMx9jKozd201.l3FPqCXDlWTUyZl:
                      return RnCxkgoHNv1RjLU7JwbJH3oTbkay5q(
                        rhf0q: n2C5H,
                        z00CsXKuVn: ReportsCatalog.mantenimientoMostrador,
                        iGOnsX4P: user?.nombre ?? '',
                        y2zWoPIB: user?.area ?? '',
                      );
                    case _HMx9jKozd201.ifA:
                      return EhxhpNzmE1p0vjyJcCc56y(
                        fnm2Y: n2C5H,
                        yMbKtsQDOk: ReportsCatalog.checklistEtp,
                        npydikRi: user?.nombre ?? '',
                        oUvNQD8S0PVzV: user?.area ?? '',
                      );
                  }
                },
              ),
            );
          },
          borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 52 : 48,
                  height: isTablet ? 52 : 48,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(isTablet ? 16 : 14),
                  ),
                  child: Icon(
                    icon,
                    color: cs.onPrimaryContainer,
                    size: isTablet ? 28 : 24,
                  ),
                ),
                SizedBox(width: isTablet ? 20 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        oaUX7,
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 16,
                          fontWeight: FontWeight.w800,
                          color: cs.onSurface,
                          letterSpacing: -0.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        dOEO2oYG,
                        style: TextStyle(color: cs.onSurfaceVariant),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Abrir formulario',
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 12,
                          color: cs.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: cs.onSurfaceVariant,
                  size: isTablet ? 22 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RnCxkgoHNv1RjLU7JwbJH3oTbkay5q extends ConsumerStatefulWidget {
  final GerenciaTheme rhf0q;
  final ChecklistReportDefinition z00CsXKuVn;
  final String iGOnsX4P;
  final String y2zWoPIB;

  const RnCxkgoHNv1RjLU7JwbJH3oTbkay5q({
    super.key,
    required this.rhf0q,
    required this.z00CsXKuVn,
    required this.iGOnsX4P,
    required this.y2zWoPIB,
  });

  @override
  ConsumerState<RnCxkgoHNv1RjLU7JwbJH3oTbkay5q> createState() =>
      _Fo12bWHlGwn5aJNEuqDX3OrK1ttUGf93usx();
}

class _Fo12bWHlGwn5aJNEuqDX3OrK1ttUGf93usx
    extends ConsumerState<RnCxkgoHNv1RjLU7JwbJH3oTbkay5q> {
  var _yvsf8fWSKK = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.rhf0q,
        title: widget.z00CsXKuVn.title,
      ),
      body: Stack(
        children: [
          ChecklistReportForm(
            definition: widget.z00CsXKuVn,
            onSubmit: _mz8drC44,
          ),
          if (_yvsf8fWSKK)
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

  Future<void> _mz8drC44(ChecklistReportDraft draft) async {
    if (_yvsf8fWSKK) return;
    setState(() => _yvsf8fWSKK = true);

    try {
      final bytes = await MaintenancePreventivoPdf.build(
        definition: widget.z00CsXKuVn,
        draft: draft,
      );

      final safeId = draft.reportTypeId.replaceAll(
        RegExp(r'[^a-zA-Z0-9_-]'),
        '',
      );
      final filename =
          'reporte_${safeId}_${DateTime.now().millisecondsSinceEpoch}.pdf';

      final file = await PdfFileService.saveToDocuments(
        bytes: bytes,
        filename: filename,
      );

      final user = ref.read(authControllerProvider).user;
      await ref
          .read(generatedPdfRepositoryProvider)
          .add(
            GeneratedPdf(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              filename: filename,
              localPath: file.path,
              createdAt: DateTime.now(),
              createdByUserId: user?.id ?? '',
              createdByName: user?.nombre ?? '',
              area: user?.area ?? '',
              gerenciaId: user?.resolvedGerenciaId,
              source: 'reporte',
            ),
          );
      ref.invalidate(generatedPdfsProvider);

      await PdfFileService.openFile(file);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo generar PDF: $e')));
    } finally {
      if (mounted) setState(() => _yvsf8fWSKK = false);
    }
  }
}

class EhxhpNzmE1p0vjyJcCc56y extends ConsumerStatefulWidget {
  final GerenciaTheme fnm2Y;
  final EtpChecklistDefinition yMbKtsQDOk;
  final String npydikRi;
  final String oUvNQD8S0PVzV;

  const EhxhpNzmE1p0vjyJcCc56y({
    super.key,
    required this.fnm2Y,
    required this.yMbKtsQDOk,
    required this.npydikRi,
    required this.oUvNQD8S0PVzV,
  });

  @override
  ConsumerState<EhxhpNzmE1p0vjyJcCc56y> createState() =>
      _WMCQI09meSePHYFgxKI8bvraYMU();
}

class _WMCQI09meSePHYFgxKI8bvraYMU
    extends ConsumerState<EhxhpNzmE1p0vjyJcCc56y> {
  var _vz8RZexcvU = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GerenciaAppBar(
        theme: widget.fnm2Y,
        title: widget.yMbKtsQDOk.title,
      ),
      body: Stack(
        children: [
          EtpChecklistForm(
            definition: widget.yMbKtsQDOk,
            userName: widget.npydikRi,
            checklistName: widget.oUvNQD8S0PVzV,
            onSubmit: _m7pqDUaf,
          ),
          if (_vz8RZexcvU)
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

  Future<void> _m7pqDUaf(EtpChecklistDraft draft) async {
    if (_vz8RZexcvU) return;
    setState(() => _vz8RZexcvU = true);

    try {
      final bytes = await EtpChecklistPdf.build(
        definition: widget.yMbKtsQDOk,
        draft: draft,
      );

      final safeId = draft.reportTypeId.replaceAll(
        RegExp(r'[^a-zA-Z0-9_-]'),
        '',
      );
      final filename =
          'checklist_${safeId}_${DateTime.now().millisecondsSinceEpoch}.pdf';

      final file = await PdfFileService.saveToDocuments(
        bytes: bytes,
        filename: filename,
      );

      final user = ref.read(authControllerProvider).user;
      await ref
          .read(generatedPdfRepositoryProvider)
          .add(
            GeneratedPdf(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              filename: filename,
              localPath: file.path,
              createdAt: DateTime.now(),
              createdByUserId: user?.id ?? '',
              createdByName: user?.nombre ?? '',
              area: user?.area ?? '',
              gerenciaId: user?.resolvedGerenciaId,
              source: 'reporte',
            ),
          );
      ref.invalidate(generatedPdfsProvider);

      // Crear tarea automáticamente por checklist generado.
      if (user != null && user.id.trim().isNotEmpty) {
        final tarea = Tarea(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          reporteId: 'checklist:$safeId',
          titulo: filename,
          descripcion: filename,
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
      if (mounted) setState(() => _vz8RZexcvU = false);
    }
  }
}
