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
}
