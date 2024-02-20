part of orders;

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      backgroundColor: KDSColors.buttonBlue,
      hoverColor: KDSColors.buttonBlueHover,
      text: 'START',
      onTap: () {},
    );
  }
}
