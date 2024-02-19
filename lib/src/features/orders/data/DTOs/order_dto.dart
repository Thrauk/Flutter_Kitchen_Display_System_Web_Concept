part of orders;

class OrderDTO {
  OrderDTO({
    required this.idOspatar,
    required this.idComanda,
    required this.numeOspatar,
    required this.tipComanda,
    required this.tableNo,
    required this.valoareComanda,
    required this.observatiiComanda,
    required this.produseComanda,
    required this.numarComanda,
    required this.dataComanda,
  });

  final String idOspatar;
  final String idComanda;
  final String numeOspatar;
  final String tipComanda;
  final String tableNo;
  final String valoareComanda;
  final String observatiiComanda;
  final List<OrderProductDTO> produseComanda;
  final String numarComanda;
  final String dataComanda;

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      idOspatar: json['id_ospatar'],
      idComanda: json['id_comanda'],
      numeOspatar: json['nume_ospatar'],
      tipComanda: json['tip_comanda'],
      tableNo: json['table_no'],
      valoareComanda: json['valoare_comanda'],
      observatiiComanda: json['observatii_comanda'],
      produseComanda: List<OrderProductDTO>.from(json['produse_comanda'].map((x) => OrderProductDTO.fromJson(x))),
      numarComanda: json['numar_comanda'],
      dataComanda: json['data_comanda'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_ospatar': idOspatar,
      'id_comanda': idComanda,
      'nume_ospatar': numeOspatar,
      'tip_comanda': tipComanda,
      'table_no': tableNo,
      'valoare_comanda': valoareComanda,
      'observatii_comanda': observatiiComanda,
      'produse_comanda': produseComanda.map((x) => x.toJson()).toList(),
      'numar_comanda': numarComanda,
      'data_comanda': dataComanda,
    };
  }
}