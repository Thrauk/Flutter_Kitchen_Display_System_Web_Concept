part of orders;

enum OrderType { dineIn, pickUp, invalid }

enum OrderStatus { notStarted, inProgress, finished }

class Order {
  const Order({
    required this.orderId,
    required this.orderPrice,
    required this.orderType,
    required this.orderNumber,
    required this.orderDateTime,
    required this.products,
    required this.observations,
    required this.waiterId,
    required this.waiterName,
    required this.tableNumber,
    required this.orderStatus,
  });

  /// Internal usage, unique order in DB
  final String orderId;

  /// The total price for the order
  final double orderPrice;

  /// The type of order -> dineIn or pickUp
  final OrderType orderType;

  /// Client/Case defined, could repeat itself in time
  final String orderNumber;

  /// Date and Time when the order was placed
  final DateTime orderDateTime;

  /// Products contained by the order
  final List<OrderProduct> products;

  /// Observations about the order
  final String observations;

  /// The current state of our order
  final OrderStatus orderStatus;

  final String waiterId;
  final String waiterName;
  final String tableNumber;

  static Order fromDTO(OrderDTO dto) {
    return Order(
      orderId: dto.idComanda,
      /// We consider that the data is valid
      orderPrice: double.tryParse(dto.valoareComanda)!,
      orderType: getOrderTypeFromString(dto.tipComanda),
      orderNumber: dto.numarComanda,
      orderDateTime: DateTime.parse(dto.dataComanda),
      products:
          List<OrderProduct>.from(dto.produseComanda.map((productDTO) => OrderProduct.fromDTO(productDTO)).toList()),
      observations: dto.observatiiComanda,
      waiterId: dto.idOspatar,
      waiterName: dto.numeOspatar,
      tableNumber: dto.tableNo,
      orderStatus: OrderStatus.notStarted,
    );
  }

  static OrderType getOrderTypeFromString(String orderType) {
    switch (orderType) {
      case 'dinein':
        return OrderType.dineIn;
      case 'pickup':
        return OrderType.pickUp;
      default:
        return OrderType.invalid;
    }
  }
}
