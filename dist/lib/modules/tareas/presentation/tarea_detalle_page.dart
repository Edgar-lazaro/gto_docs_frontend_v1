import 'package:flutter/material.dart';

import '../../../shared/ui/theme/gerencia_config.dart';
import '../domain/tarea.dart';

class Iom0ztcBxmImKVs2 extends StatelessWidget {
  final GerenciaTheme u4Wka;
  final Tarea aLTtu;

  const Iom0ztcBxmImKVs2({super.key, required this.u4Wka, required this.aLTtu});

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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: u4Wka.colorPrimario,
        elevation: 4,
        shadowColor: u4Wka.colorPrimario.withValues(alpha: 0.15),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(isTablet ? 24 : 20),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isTablet ? 32 : 24,
        ),
        child: Container(
          width: double.infinity,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aLTtu.titulo,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _pJ8('Estado', aLTtu.estado.name),
                _pJ8('Asignado a', aLTtu.asignadoA),
                if (aLTtu.groupId != null && aLTtu.groupId!.trim().isNotEmpty)
                  _pJ8('Grupo', aLTtu.groupId!),
                _pJ8('Descripción', aLTtu.descripcion),
                _pJ8(
                  'Reporte',
                  aLTtu.reporteId.isEmpty ? '-' : aLTtu.reporteId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pJ8(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
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
}
