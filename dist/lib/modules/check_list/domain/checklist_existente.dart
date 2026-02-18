class WBcR9YHktYr1jJXQ5C {
  final int xF;
  final String el6gcA;
  final int cVkkh0I6e2;
  final int jk6hZl98fG;
  final String snWzQObVgPR;

  const WBcR9YHktYr1jJXQ5C({
    required this.xF,
    required this.el6gcA,
    required this.cVkkh0I6e2,
    required this.jk6hZl98fG,
    required this.snWzQObVgPR,
  });

  factory WBcR9YHktYr1jJXQ5C.qkXdEpJQ(Map<String, dynamic> json) {
    final id = json['id'] ?? json['id_cl'] ?? json['checklist_id'];

    return WBcR9YHktYr1jJXQ5C(
      xF: int.tryParse(id?.toString() ?? '') ?? 0,
      el6gcA: (json['nombre_cl'] ?? json['nombre'] ?? '').toString(),
      cVkkh0I6e2:
          int.tryParse(
            (json['gerencia_cl'] ??
                    json['gerencia_id'] ??
                    json['gerenciaId'] ??
                    '')
                .toString(),
          ) ??
          0,
      jk6hZl98fG:
          int.tryParse(
            (json['jefatura'] ??
                    json['jefatura_id'] ??
                    json['jefaturaId'] ??
                    '')
                .toString(),
          ) ??
          0,
      snWzQObVgPR: (json['funcion_form'] ?? json['funcionForm'] ?? '')
          .toString(),
    );
  }
}
