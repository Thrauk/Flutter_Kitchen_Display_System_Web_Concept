part of orders;


abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrders extends OrderEvent {}

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

