part of orders;

class OrdersDTO {
  OrdersDTO({
    required this.status,
    required this.data,
  });

  bool status;
  List<OrderDTO> data;

  factory OrdersDTO.fromJson(Map<String, dynamic> json) {
    return OrdersDTO(
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>).map((e) => OrderDTO.fromJson((e as Map<String,dynamic>)['comanda'])).toList(),
    );
  }

  @override
  String toString() {
    return 'OrdersDTO{status: $status, data: $data}';
  }
}