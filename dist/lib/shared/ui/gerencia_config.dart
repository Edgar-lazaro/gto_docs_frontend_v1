import 'package:flutter/material.dart';

class JvByaF7Uwqqha {
  final String fEXiH4;
  final Color cuAERFgvM0I8m;
  final Color lLaDPomRgRwkvpc;
  final IconData u4GxC227bNHkvK;

  const JvByaF7Uwqqha({
    required this.fEXiH4,
    required this.cuAERFgvM0I8m,
    required this.lLaDPomRgRwkvpc,
    required this.u4GxC227bNHkvK,
  });
}

class VB3O229kxsSo8T {
  static JvByaF7Uwqqha eoPiZjRLu(String gerenciaId) {
    final normalized = gerenciaId.trim().toUpperCase();

    switch (normalized) {
      case '1':
      case 'TICS':
        return const JvByaF7Uwqqha(
          fEXiH4: 'Tecnologías de la Información',
          cuAERFgvM0I8m: Color(0xFF4A90E2),
          lLaDPomRgRwkvpc: Color(0xFF6FB1FC),
          u4GxC227bNHkvK: Icons.computer,
        );
      case '3':
      case 'MANTENIMIENTO':
        return const JvByaF7Uwqqha(
          fEXiH4: 'Mantenimiento',
          cuAERFgvM0I8m: Color(0xFFFF6F00),
          lLaDPomRgRwkvpc: Color(0xFFFFB74D),
          u4GxC227bNHkvK: Icons.build,
        );
      case '4':
      case 'FAUNA':
        return const JvByaF7Uwqqha(
          fEXiH4: 'Fauna',
          cuAERFgvM0I8m: Color(0xFF388E3C),
          lLaDPomRgRwkvpc: Color(0xFF66BB6A),
          u4GxC227bNHkvK: Icons.pets,
        );
      case 'OPERACIONES':
        return const JvByaF7Uwqqha(
          fEXiH4: 'Operaciones',
          cuAERFgvM0I8m: Color(0xFF2ECC71),
          lLaDPomRgRwkvpc: Color(0xFF58D68D),
          u4GxC227bNHkvK: Icons.flight_takeoff,
        );
      default:
        return const JvByaF7Uwqqha(
          fEXiH4: 'General',
          cuAERFgvM0I8m: Colors.blue,
          lLaDPomRgRwkvpc: Colors.lightBlue,
          u4GxC227bNHkvK: Icons.business,
        );
    }
  }
}