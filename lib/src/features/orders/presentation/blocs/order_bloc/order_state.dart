part of orders;


class OrderState extends Equatable {
  const OrderState({
    required this.orders,
    required this.chefName,
    required this.isLoading,
  });

  factory OrderState.initial() {
    return const OrderState(
      isLoading: false,
      orders: <Order>[],
      chefName: "",
    );
  }

  final List<Order> orders;
  final String chefName;
  final bool isLoading;

  OrderState copyWith({
    List<Order>? orders,
    String? chefName,
    bool? isLoading,
  }) {
    return OrderState(
      orders: orders ?? this.orders,
      chefName: chefName ?? this.chefName,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        orders,
        chefName,
        isLoading,
      ];


}
