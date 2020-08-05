class ListarConcorrente {
  String cODCONC;
  String cONCORR;

  ListarConcorrente({this.cODCONC, this.cONCORR});

  ListarConcorrente.fromJson(Map<String, dynamic> json) {
    cODCONC = json['CODCONC'];
    cONCORR = json['CONCORR'];
  }
}
