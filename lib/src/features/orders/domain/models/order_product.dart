part of orders;

class OrderProduct {
  const OrderProduct({
    required this.productId,
    required this.productName,
    required this.productCategoryId,
    required this.productCategoryName,
    required this.productObservations,
    required this.productQuantity,
    required this.productPrice,
    required this.orderId,
  });

  /// The ID of the product. Could differ from client (numeric or alphaNumeric)
  final String productId;
  /// The name of the product.
  final String productName;

  final String productCategoryId;
  final String productCategoryName;

  /// User/Client observations about the product?
  final String productObservations;

  /// How many items of this product are in the order
  final int productQuantity;
  /// The price for each individual item.
  final double productPrice;

  /// The corresponding ID for this order.
  final String orderId;

  static OrderProduct fromDTO(OrderProductDTO dto) {
    return OrderProduct(
      productId: dto.idProdus,
      productName: dto.denumireProdus,
      productCategoryId: dto.idCategorieProdus,
      productCategoryName: dto.denumireCategorieProdus,
      productObservations: dto.observatiiProdus,
      productQuantity: dto.cantitateProdus,
      productPrice: dto.pretProdus,
      orderId: dto.idComanda.toString(),
    );
  }
}
