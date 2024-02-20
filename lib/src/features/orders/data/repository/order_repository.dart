part of orders;

class OrderRepository {
  factory OrderRepository() => _singleton;

  OrderRepository._internal() : super();

  static const String _ordersFirebasePath = 'orders';
  /// For safety purposes, the maximum number of orders is set to 50.
  static const int _maxDemoOrdersLength = 50;

  static final OrderRepository _singleton = OrderRepository._internal();

  final firebaseOrdersDocument = FirebaseFirestore.instance.collection(_ordersFirebasePath).doc('kds-orders');

  /// Function that "mocks" the response from POS by reading a json from assets.
  Future<OrdersDTO> getOrdersFromAssetsPOS() async {
    final String response = await rootBundle.loadString('assets/sample_data.json');
    final jsonData = await json.decode(response) as Map<String, dynamic>;
    return OrdersDTO.fromJson(jsonData);
  }

  Stream<DocumentSnapshot<Map<String,dynamic>>> getStream() => firebaseOrdersDocument.snapshots();

  /// Saves the orders to our firestore database.
  Future<void> saveOrders(List<Order> startedOrders) async {
    final startedOrdersMapList = startedOrders.map((order) => order.toMap()).toList().take(_maxDemoOrdersLength);
    await firebaseOrdersDocument.set({'values': startedOrdersMapList});
  }

  /// Loads the  orders from firestore database;
  Future<List<Order>> getOrders() async {
    final values = (await firebaseOrdersDocument.get()).data()?['values'] as List?;
    return Order.fromListMap(values ?? []);
  }

  /// Clear the shared preferences "database".
  Future<void> debugClearAllOrders() async {
    await firebaseOrdersDocument.set({'values' : []});
  }

}
