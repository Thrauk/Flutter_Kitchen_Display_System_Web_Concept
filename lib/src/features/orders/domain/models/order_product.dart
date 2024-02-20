part of orders;

class OrderProduct {
  const OrderProduct({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.categoryName,
    required this.observations,
    required this.quantity,
    required this.price,
    required this.orderId,
  });

  /// The ID of the product. Could differ from client (numeric or alphaNumeric)
  final String id;
  /// The name of the product.
  final String name;

  final String categoryId;
  final String categoryName;

  /// User/Client observations about the product?
  final String observations;

  /// How many items of this product are in the order
  final int quantity;
  /// The price for each individual item.
  final double price;

  /// The corresponding ID for this order.
  final String orderId;

  static OrderProduct fromDTO(OrderProductDTO dto) {
    return OrderProduct(
      id: dto.idProdus,
      name: dto.denumireProdus,
      categoryId: dto.idCategorieProdus,
      categoryName: dto.denumireCategorieProdus,
      observations: dto.observatiiProdus,
      quantity: dto.cantitateProdus,
      price: dto.pretProdus,
      orderId: dto.idComanda.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'observations': observations,
      'quantity': quantity,
      'price': price,
      'orderId': orderId,
    };
  }

  factory OrderProduct.fromMap(Map<String, dynamic> map) {
    return OrderProduct(
      id: map['id'] as String,
      name: map['name'] as String,
      categoryId: map['categoryId'] as String,
      categoryName: map['categoryName'] as String,
      observations: map['observations'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      orderId: map['orderId'] as String,
    );
  }

  static List<OrderProduct> fromListMap(List<dynamic> list) {
    return list.map((product) => OrderProduct.fromMap(product as Map<String,dynamic>)).toList();
  }
}
