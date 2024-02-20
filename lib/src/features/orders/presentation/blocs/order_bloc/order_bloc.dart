part of orders;

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState.initial()) {
    on<FetchOrders>(_onFetchAll);
    add(FetchOrders());
  }

  final OrderRepository _orderRepository = OrderRepository();

  Future<void> _onFetchAll(FetchOrders event, Emitter<OrderState> emit) async {
    emit(state.copyWith(isLoading: true));
    final OrdersDTO ordersDTO = await _orderRepository.getOrders();
    final List<Order> orders = Order.listFromDTO(ordersDTO);
    final List<Order> mockOrders = [...orders, ...orders, ...orders, ...orders];
    emit(
      state.copyWith(
        orders: mockOrders,
        isLoading: false,
      ),
    );
  }
}
