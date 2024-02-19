part of orders;

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({super.key});

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  final orderItems = [
    OrderProduct(
      id: '551',
      name: 'Mamaliga cu branza',
      categoryId: '5',
      categoryName: 'Minuturi',
      observations: '',
      quantity: 2,
      price: 18.0,
      orderId: '55',
    ),
    OrderProduct(
      id: '551',
      name: 'Burger',
      categoryId: '5',
      categoryName: 'burger',
      observations: 'fara carne',
      quantity: 2,
      price: 18.0,
      orderId: '55',
    ),
    OrderProduct(
      id: '551',
      name: 'Burger',
      categoryId: '5',
      categoryName: 'burger',
      observations: 'fara carne',
      quantity: 2,
      price: 18.0,
      orderId: '55',
    ),
    OrderProduct(
      id: '551',
      name: 'Burger',
      categoryId: '5',
      categoryName: 'burger',
      observations: 'fara carne',
      quantity: 2,
      price: 18.0,
      orderId: '55',
    ),
    OrderProduct(
      id: '551',
      name: 'Burger',
      categoryId: '5',
      categoryName: 'burger',
      observations: 'fara carne',
      quantity: 2,
      price: 18.0,
      orderId: '55',
    ),
    OrderProduct(
      id: '551',
      name: 'Burger',
      categoryId: '5',
      categoryName: 'burger',
      observations: 'fara carne',
      quantity: 2,
      price: 18.0,
      orderId: '55',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 75,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#0001',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '18:01:15',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Gigel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Text(
            "Table 15",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return OrderProductItem(
                  product: orderItems[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                );
              },
              itemCount: orderItems.length,
            ),
          ),
          Container(
            height: 60,
            color: Colors.blue,
            child: Center(
              child: Text(
                'START',
                style: TextStyle(
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
