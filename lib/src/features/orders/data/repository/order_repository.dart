part of orders;

class OrderRepository {
  factory OrderRepository() => _singleton;

  OrderRepository._internal() : super();

  static final OrderRepository _singleton = OrderRepository._internal();

  Future<OrdersDTO> getOrders() async {
    final String response = await rootBundle.loadString('assets/sample_data.json');
    final jsonData = await json.decode(response) as Map<String, dynamic>;
    return OrdersDTO.fromJson(jsonData);
  }


}