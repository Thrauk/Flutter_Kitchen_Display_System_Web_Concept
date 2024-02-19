part of orders;

class OrderRepository {
  factory OrderRepository() => _singleton;

  OrderRepository._internal() : super();

  static final OrderRepository _singleton = OrderRepository._internal();



}