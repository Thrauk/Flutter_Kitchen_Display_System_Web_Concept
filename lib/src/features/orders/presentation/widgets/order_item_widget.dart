part of orders;

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 400,
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
            orderNumber: order.orderNumber,
            orderDate: order.orderDateTime,
            waiterName: order.waiterName,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              order.tableNumber.isNotEmpty ? 'Table ${order.tableNumber}' : 'Pickup',
              style: KDSTextStyles.body(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return OrderProductItem(
                    product: order.products[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(),
                  );
                },
                itemCount: order.products.length,
              ),
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
