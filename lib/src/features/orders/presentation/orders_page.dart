part of orders;

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc>(
      create: (context) => OrderBloc(
        onImportError: () {
          showDialog<String?>(
            context: context,
            builder: (BuildContext context) {
              return const ImportJsonErrorDialog();
            },
          );
        },
      ),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: KDSColors.darkRed,
            leadingWidth: 400,
            actions: [
              ElevatedButton(
                onPressed: () {
                  context.read<OrderBloc>().add(DebugPopulateFromAssets());
                },
                child: const Text('Add debug data'),
              ),
              const SizedBox(
                width: 4,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<OrderBloc>().add(DebugClearData());
                },
                child: const Text('Clear data'),
              ),
              const SizedBox(
                width: 4,
              ),
              ImportByJsonButton(
                onImport: (jsonText) {
                  context.read<OrderBloc>().add(ImportFromJson(jsonText: jsonText));
                },
              ),
            ],
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
          body: Padding(
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
                        children: state.orders
                            .map((order) => OrderItemWidget(key: ValueKey<String>(order.orderId), order: order))
                            .toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
