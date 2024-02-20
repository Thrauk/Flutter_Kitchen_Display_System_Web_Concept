part of orders;

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          OrderItemHeader(
            orderNumber: '#0001',
            orderDate: DateTime.now(),
            waiterName: 'Gogu',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Table 15",
              style: KDSTextStyles.body(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return OrderProductItem(
                  product: widget.order.products[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                );
              },
              itemCount: widget.order.products.length,
            ),
          ),
          Container(
            height: 60,
            color: Colors.blue,
            child: Center(
              child: Text(
                'START',
                style: KDSTextStyles.body(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
