import 'package:flutter/material.dart';
import 'package:gto_docs_v2_ad/shared/ui/theme/gerencia_config.dart';

class A7ModBQ3DyUTcy extends StatelessWidget {
  final GerenciaTheme nL20Y;
  final String gOCUGqUZ;

  const A7ModBQ3DyUTcy({
    super.key,
    required this.nL20Y,
    required this.gOCUGqUZ,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Container(
      padding: EdgeInsets.fromLTRB(24, isTablet ? 32 : 24, 24, 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [nL20Y.colorPrimario, nL20Y.colorSecundario],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(isTablet ? 40 : 32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('¡Hola! 👋',
              style: TextStyle(
                color: Colors.white70,
                fontSize: isTablet ? 20 : 16,
              )),
          Text(
            gOCUGqUZ,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 32 : 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}