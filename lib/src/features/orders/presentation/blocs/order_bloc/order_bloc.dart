part of orders;

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc({required this.onImportError}) : super(OrderState.initial()) {
    on<FetchOrders>(_onFetchAll);
    on<DebugPopulateFromAssets>(_onDebugPopulateFromAssets);
    on<InitializeOrderBloc>(_onInitializeOrderBloc);
    on<OnOrdersUpdate>(_onOnOrdersUpdate);
    on<DebugClearData>(_onDebugClearData);
    on<StartOrder>(_onStartOrder);
    on<FinishOrder>(_onFinishOrder);
    on<ImportFromJson>(_onImportFromJson);

    _orderStream = _orderRepository.getStream();
    _orderSubscription = _orderStream.listen((event) {
      _onOrderFirebaseSnapshot(event);
    });

    add(InitializeOrderBloc());
  }

  final OrderRepository _orderRepository = OrderRepository();
  final VoidCallback onImportError;
  late final Stream<DocumentSnapshot<Map<String, dynamic>>> _orderStream;
  late final StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> _orderSubscription;

  Future<void> _onInitializeOrderBloc(InitializeOrderBloc event, Emitter<OrderState> emit) async {
    emit(state.copyWith(isLoading: true));

    final orders = await _orderRepository.getOrders();

    emit(
      state.copyWith(
        orders: orders,
        isLoading: false,
      ),
    );
  }

  Future<void> _onOnOrdersUpdate(OnOrdersUpdate event, Emitter<OrderState> emit) async {
    emit(
      state.copyWith(
        orders: event.orders,
      ),
    );
  }

  Future<void> _onStartOrder(StartOrder event, Emitter<OrderState> emit) async {
    final selectedOrder = state.orders.firstWhereOrNull((element) => element.orderId == event.orderID);
    if (selectedOrder != null) {
      final newOrder = selectedOrder.copyWith(orderStatus: OrderStatus.inProgress);
      final newOrders = List<Order>.from(state.orders);
      newOrders.removeWhere((element) => element.orderId == event.orderID);
      newOrders.insert(0, newOrder);
      _orderRepository.saveOrders(newOrders);
    }
  }

  Future<void> _onImportFromJson(ImportFromJson event, Emitter<OrderState> emit) async {
    try {
      final jsonBody = jsonDecode(event.jsonText);
      final ordersDTOS = OrdersDTO.fromJson(jsonBody);
      final ordersToImport = ordersDTOS.data.map((e) => Order.fromDTO(e)).toList();
      for (Order order in ordersToImport) {
        if (state.orders.any((stateOrder) => stateOrder.orderId == order.orderId)) {
          throw (Exception('Order already exists!'));
        }
      }
      _orderRepository.saveOrders([...ordersToImport, ...state.orders]);
    } catch (_) {
      print(_);
      onImportError.call();
    }
  }

  Future<void> _onFinishOrder(FinishOrder event, Emitter<OrderState> emit) async {
    final selectedOrder = state.orders.firstWhereOrNull((element) => element.orderId == event.orderID);
    if (selectedOrder != null) {
      final newOrders = List<Order>.from(state.orders);
      newOrders.removeWhere((element) => element.orderId == event.orderID);
      _orderRepository.saveOrders(newOrders);
    }
  }

  Future<void> _onFetchAll(FetchOrders event, Emitter<OrderState> emit) async {
    emit(state.copyWith(isLoading: true));
    final OrdersDTO ordersDTO = await _orderRepository.getOrdersFromAssetsPOS();
    final List<Order> orders = Order.listFromDTO(ordersDTO);
    final List<Order> mockOrders = [...orders, ...orders, ...orders, ...orders];
    emit(
      state.copyWith(
        orders: mockOrders,
        isLoading: false,
      ),
    );
  }

  Future<void> _onDebugPopulateFromAssets(DebugPopulateFromAssets event, Emitter<OrderState> emit) async {
    emit(state.copyWith(isLoading: true));
    final OrdersDTO ordersDTO = await _orderRepository.getOrdersFromAssetsPOS();
    final List<Order> orders = Order.listFromDTO(ordersDTO);

    await _orderRepository.debugClearAllOrders();
    await _orderRepository.saveOrders(orders);

    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }

  Future<void> _onDebugClearData(DebugClearData event, Emitter<OrderState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _orderRepository.debugClearAllOrders();

    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }

  void _onOrderFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> event) {
    final data = event.data();
    final firebaseOrders = data?['values'] ?? [];
    final newOrders = Order.fromListMap(firebaseOrders);

    add(OnOrdersUpdate(orders: newOrders));
  }

  @override
  Future<void> close() async {
    _orderSubscription.cancel();
    super.close();
  }
}
