part of orders;

class OrderRepository {
  factory OrderRepository() => _singleton;

  OrderRepository._internal() : super();

  static const String _ordersKey = 'orders';
  static const String _defaultOrderResponse = '[]';

  static final OrderRepository _singleton = OrderRepository._internal();
  StreamingSharedPreferences? _sharedPreferencesInstance;

  /// Function that "mocks" the response from POS by reading a json from assets.
  Future<OrdersDTO> getOrdersFromAssetsPOS() async {
    final String response = await rootBundle.loadString('assets/sample_data.json');
    final jsonData = await json.decode(response) as Map<String, dynamic>;
    return OrdersDTO.fromJson(jsonData);
  }

  /// Saves the orders to our "database".
  Future<void> saveOrders(List<Order> startedOrders) async {
    final sharedPreferences = await _getPreferencesInstance();

    final startedOrdersMapList = startedOrders.map((order) => order.toMap()).toList();

    await sharedPreferences.setString(_ordersKey, jsonEncode(startedOrdersMapList));
  }

  /// Loads the  orders "from our database".
  Future<Preference<String>> getStartedOrders() async =>
      await _getStringValueFromPreferences(_ordersKey, _defaultOrderResponse);


  /// Get a specific key with string value "from the database".
  Future<Preference<String>> _getStringValueFromPreferences(String key, String defaultValue) async {
    final sharedPreferences = await _getPreferencesInstance();
    return sharedPreferences.getString(key, defaultValue: defaultValue);
  }

  /// Clear the shared preferences "database".
  Future<void> debugClearAllOrders() async {
    final sharedPreferences = await _getPreferencesInstance();
    await sharedPreferences.clear();
  }

  /// Caches the SharedPreferences instance to be usable in the singleton.
  Future<StreamingSharedPreferences> _getPreferencesInstance() async {
    _sharedPreferencesInstance ??= await StreamingSharedPreferences.instance;
    return _sharedPreferencesInstance!;
  }
}
