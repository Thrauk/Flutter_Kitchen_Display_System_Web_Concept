part of orders;

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}