part of orders;

class OrderItemHeader extends StatelessWidget {
  const OrderItemHeader({
    super.key,
    required this.orderNumber,
    required this.orderDate,
    required this.orderStatus,
    this.waiterName,
  });

  final String orderNumber;
  final DateTime orderDate;
  final OrderStatus orderStatus;
  final String? waiterName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      color: orderStatus == OrderStatus.inProgress ? Colors.green : Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#$orderNumber',
              style: KDSTextStyles.body(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat('hh:mm:ss').format(orderDate),
                  style: KDSTextStyles.body(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                if (waiterName != null && waiterName!.isNotEmpty)
                  Text(
                    waiterName!,
                    style: KDSTextStyles.body(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
