import 'glpi_ticket_user.dart';

class Ro5fGjn4Vu {
  final String sLG4c1;
  final String tUEfz7M6b23;
  /// Fecha/hora de creación (ISO-8601 esperado por backend)
  final DateTime pZrRr;

  /// M:M: varios pueden asignar
  final List<String> c1RpVvAn6XR;

  /// M:M: varios pueden ejecutar/hacer la tarea
  final List<String> oOtjbQPSn;

  final String d4iUVqGxP;
  final String l7jd3z7Ls;
  final List<N1UoL2JwYVelFG> cndE4;
  final Map<String, dynamic>? dD43OIsV;

  Ro5fGjn4Vu({
    required this.sLG4c1,
    required this.tUEfz7M6b23,
    required this.pZrRr,
    required this.c1RpVvAn6XR,
    required this.oOtjbQPSn,
    required this.d4iUVqGxP,
    required this.l7jd3z7Ls,
    required this.cndE4,
    this.dD43OIsV,
  });

  Map<String, dynamic> lUgIea() => {
        'titulo': sLG4c1,
        'descripcion': tUEfz7M6b23,
        'fecha': pZrRr.toIso8601String(),
        'asignadores': c1RpVvAn6XR,
        'asignados': oOtjbQPSn,
        'categoria': d4iUVqGxP,
        'prioridad': l7jd3z7Ls,
        'users': cndE4.map((u) => u.qirj5T()).toList(),
        if (dD43OIsV != null) 'metadata': dD43OIsV,
      };
}