part of orders;

class OrderProductDTO {
  OrderProductDTO({
    required this.idProdus,
    required this.denumireProdus,
    required this.idCategorieProdus,
    required this.denumireCategorieProdus,
    required this.observatiiProdus,
    required this.cantitateProdus,
    required this.pretProdus,
    required this.idComanda,
  });

  final String idProdus;
  final String denumireProdus;
  final String idCategorieProdus;
  final String denumireCategorieProdus;
  final String observatiiProdus;
  final int cantitateProdus;
  final double pretProdus;
  final int idComanda;

  factory OrderProductDTO.fromJson(Map<String, dynamic> json) {
    return OrderProductDTO(
      idProdus: json['id_produs'] as String,
      denumireProdus: json['denumire_produs'] as String,
      idCategorieProdus: json['id_categorie_produs'] as String,
      denumireCategorieProdus: json['denumire_categorie_produs'] as String,
      observatiiProdus: json['observatii_produs']  as String,
      cantitateProdus: json['cantitate_produs'] as int,
      pretProdus: (json['pret_produs'] as num).toDouble(),
      idComanda: json['id_comanda'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_produs': idProdus,
      'denumire_produs': denumireProdus,
      'id_categorie_produs': idCategorieProdus,
      'denumire_categorie_produs': denumireCategorieProdus,
      'observatii_produs': observatiiProdus,
      'cantitate_produs': cantitateProdus,
      'pret_produs': pretProdus,
      'id_comanda': idComanda,
    };
  }
}