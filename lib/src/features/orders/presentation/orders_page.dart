part of orders;

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      runSpacing: 4,
                      children: state.orders.map((order) => OrderItemWidget(order: order)).toList(),
                    ),
                  ),
                ),
              );
              // return GridView.builder(
              //   itemCount: state.orders.length,
              //   shrinkWrap: true,
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 20,
              //   ),
              //   physics: const ClampingScrollPhysics(),
              //   scrollDirection: Axis.horizontal,
              //   itemBuilder: (context, index) {
              //     return OrderItemWidget(order: state.orders[index]);
              //   },
              // );
            },
          ),
        ),
      ),
    );
  }
}
