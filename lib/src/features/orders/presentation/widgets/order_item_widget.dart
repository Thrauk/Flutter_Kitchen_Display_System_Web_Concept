part of orders;

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
    required this.order,
    this.height = 450,
    this.width = 400,
  });

  final Order order;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
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
            OrderActionButton(),
          ],
        ),
      ),
    );
  }
}

