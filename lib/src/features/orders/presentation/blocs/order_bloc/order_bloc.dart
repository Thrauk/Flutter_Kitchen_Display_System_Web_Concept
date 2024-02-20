part of orders;

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState.initial()) {
    on<FetchOrders>(_onFetchAll);
    on<DebugPopulateFromAssets>(_onDebugPopulateFromAssets);
    on<InitializeOrderBloc>(_onInitializeOrderBloc);
    on<OnOrdersUpdate>(_onOnOrdersUpdate);
    on<DebugClearData>(_onDebugClearData);

    add(InitializeOrderBloc());
  }

  final OrderRepository _orderRepository = OrderRepository();

  late final Preference<String> _ordersPreferences;

  late final StreamSubscription<String> _ordersListener;

  Future<void> _onInitializeOrderBloc(InitializeOrderBloc event, Emitter<OrderState> emit) async {
    if (!state.isInitialized) {
      emit(state.copyWith(isLoading: true));

      _ordersPreferences = await _orderRepository.getStartedOrders();

      _ordersListener = _ordersPreferences.listen((value) {
        print(value);
        final newOrders = Order.fromListMap(jsonDecode(value) as List);
        add(
          OnOrdersUpdate(
            orders: newOrders,
          ),
        );
      });

      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onOnOrdersUpdate(OnOrdersUpdate event, Emitter<OrderState> emit) async {
    emit(
      state.copyWith(
        orders: event.orders,
      ),
    );
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

  @override
  Future<void> close() async {
    super.close();
    _ordersListener.cancel();
  }
}
