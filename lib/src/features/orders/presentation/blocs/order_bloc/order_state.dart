part of orders;

class OrderState extends Equatable {
  const OrderState({
    required this.orders,
    required this.chefName,
    required this.isLoading,
    required this.isInitialized,
  });

  factory OrderState.initial() {
    return const OrderState(
      orders: <Order>[],
      chefName: "",
      isLoading: false,
      isInitialized: false,
    );
  }

  final List<Order> orders;
  final String chefName;
  final bool isLoading;
  final bool isInitialized;

  OrderState copyWith({
    List<Order>? orders,
    String? chefName,
    bool? isLoading,
    bool? isInitialized,
  }) {
    return OrderState(
      orders: orders ?? this.orders,
      chefName: chefName ?? this.chefName,
      isLoading: isLoading ?? this.isLoading,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }

  @override
  List<Object> get props => [
        orders,
        chefName,
        isLoading,
        isInitialized,
      ];
}
