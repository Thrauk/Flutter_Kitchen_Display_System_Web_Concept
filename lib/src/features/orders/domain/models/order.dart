part of orders;

enum OrderType { dineIn, pickUp, invalid }

enum OrderStatus { notStarted, inProgress, finished, invalid }

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
      orderType: _getOrderTypeFromString(dto.tipComanda),
      orderNumber: _defaultOrderNumberConvert(dto.numarComanda),
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


  

  static List<Order> listFromDTO(OrdersDTO dto) {
    return dto.data.map((orderDTO) => Order.fromDTO(orderDTO)).toList();
  }
  
  static String _defaultOrderNumberConvert(String orderNumber) {
    try{
      final processedOrderNumber = orderNumber.substring(8);
      return processedOrderNumber;
    } catch(_) {
      return orderNumber;
    }
  }
  
  static OrderType _getOrderTypeFromString(String orderType) {
    switch (orderType) {
      case 'dinein':
        return OrderType.dineIn;
      case 'pickup':
        return OrderType.pickUp;
      default:
        return OrderType.invalid;
    }
  }

  static String _getOrderTypeStringFromEnum(OrderType type) {
    switch (type) {
      case OrderType.dineIn:
        return 'dinein';
      case OrderType.pickUp:
        return 'pickup';
      default:
        return 'invalid';
    }
  }

  static OrderStatus _getOrderStatusFromString(String orderStatus) {
    switch (orderStatus) {
      case 'notStarted':
        return OrderStatus.notStarted;
      case 'inProgress':
        return OrderStatus.inProgress;
      case 'finished':
        return OrderStatus.finished;
      default:
        return OrderStatus.invalid;
    }
  }

  static String _getOrderStatusStringFromEnum(OrderStatus status) {
    switch (status) {
      case OrderStatus.notStarted:
        return 'notStarted';
      case OrderStatus.inProgress:
        return 'inProgress';
      case OrderStatus.finished:
        return 'finished';
      default:
        return 'invalid';
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'orderPrice': orderPrice,
      'orderType': _getOrderTypeStringFromEnum(orderType),
      'orderStatus': _getOrderStatusStringFromEnum(orderStatus),
      'orderNumber': orderNumber,
      'orderDateTime': orderDateTime.millisecondsSinceEpoch,
      'products': products.map((product) => product.toMap()).toList(),
      'observations': observations,
      'waiterId': waiterId,
      'waiterName': waiterName,
      'tableNumber': tableNumber,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderId: map['orderId'] as String,
      orderPrice: map['orderPrice'] as double,
      orderType: _getOrderTypeFromString(map['orderType'] as String),
      orderStatus: _getOrderStatusFromString(map['orderStatus'] as String),
      orderNumber: map['orderNumber'] as String,
      orderDateTime: DateTime.fromMillisecondsSinceEpoch(map['orderDateTime'] as int),
      products: OrderProduct.fromListMap(map['products'] as List),
      observations: map['observations'] as String,
      waiterId: map['waiterId'] as String,
      waiterName: map['waiterName'] as String,
      tableNumber: map['tableNumber'] as String,
    );
  }

  static List<Order> fromListMap(List<dynamic> list) {
    return list.map((order) => Order.fromMap(order as Map<String,dynamic>)).toList();
  }
}
