part of orders;

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final ordersDTO = await OrderRepository().getOrders();
              final orders = Order.fromDTO(ordersDTO.data.first);
            },
            child: Text('Test repo'),
          ),
          OrderItemWidget(),
          const SizedBox(height: 8),
          OrderItemWidget(),
        ],
      ),
    );
  }
}
