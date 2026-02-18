import 'package:flutter/material.dart';

import '../theme/gerencia_config.dart';

class YgZFetYh1vLyAe extends StatelessWidget implements PreferredSizeWidget {
  final GerenciaTheme vGZ4q;
  final String fBFkV;
  final List<Widget>? bQCu54C;
  final bool bPUFmYe3;

  const YgZFetYh1vLyAe({
    super.key,
    required this.vGZ4q,
    required this.fBFkV,
    this.bQCu54C,
    this.bPUFmYe3 = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final radius = isTablet ? 24.0 : 20.0;

    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.2,
    );

    return AppBar(
      backgroundColor: vGZ4q.colorPrimario,
      elevation: 4,
      scrolledUnderElevation: 0,
      centerTitle: true,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: bPUFmYe3
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(fBFkV, style: titleStyle),
      actions: bQCu54C,
      shadowColor: vGZ4q.colorPrimario.withAlpha(60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
      ),
    );
  }
}
