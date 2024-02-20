part of orders;

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrders extends OrderEvent {}

class OnOrdersUpdate extends OrderEvent {
  const OnOrdersUpdate({
    required this.orders,
  });

  final List<Order> orders;

  @override
  List<Object?> get props => [orders];
}

class InitializeOrderBloc extends OrderEvent {}

class StartOrder extends OrderEvent {
  const StartOrder({
    required this.orderID,
  });

  final String orderID;

  @override
  List<Object?> get props => [orderID];
}

class FinishOrder extends OrderEvent {
  const FinishOrder({
    required this.orderID,
  });

  final String orderID;

  @override
  List<Object?> get props => [orderID];
}

class DebugPopulateFromAssets extends OrderEvent {}

class DebugClearData extends OrderEvent {}
