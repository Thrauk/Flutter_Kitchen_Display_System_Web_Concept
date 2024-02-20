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
              orderStatus: order.orderStatus,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    order.tableNumber.isNotEmpty ? Icons.table_restaurant_outlined : Icons.shopping_bag_outlined,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    order.tableNumber.isNotEmpty ? 'Table ${order.tableNumber}' : 'Pickup',
                    style: KDSTextStyles.body(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
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
            ActionButton(
              backgroundColor: order.orderStatus == OrderStatus.inProgress ? KDSColors.buttonGreen : KDSColors.buttonBlue,
              hoverColor: order.orderStatus == OrderStatus.inProgress ? KDSColors.buttonGreenHover : KDSColors.buttonBlueHover,
              text: order.orderStatus == OrderStatus.inProgress ? 'FINISH' : 'START',
              onTap: () {
                if(order.orderStatus == OrderStatus.notStarted) {
                  context.read<OrderBloc>().add(
                    StartOrder(
                      orderID: order.orderId,
                    ),
                  );
                } else if(order.orderStatus == OrderStatus.inProgress) {
                  context.read<OrderBloc>().add(
                    FinishOrder(
                      orderID: order.orderId,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
