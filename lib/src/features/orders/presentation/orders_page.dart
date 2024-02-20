part of orders;

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KDSColors.darkRed,
        leadingWidth: 400,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'KDS - Demo platform',
              style: KDSTextStyles.body(
                fontSize: 20,
                color: KDSColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black12,
      body: BlocProvider<OrderBloc>(
        create: (context) => OrderBloc(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Center(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: state.orders.map((order) => OrderItemWidget(order: order)).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
