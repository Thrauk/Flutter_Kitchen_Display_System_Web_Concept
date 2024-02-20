part of common;

class ActionButton extends StatefulWidget {
  const ActionButton({
    super.key,
    required this.backgroundColor,
    required this.hoverColor,
    required this.text,
    required this.onTap,
    this.hoverText,
    this.height,
    this.width,
    this.animationMillisecondDuration = 100,
    this.textStyle,
  });

  final double? height;
  final double? width;
  final Color backgroundColor;
  final Color hoverColor;
  final String text;
  final String? hoverText;
  final VoidCallback onTap;
  final int animationMillisecondDuration;
  final TextStyle? textStyle;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (bool isHover) {
        setState(() {
          this.isHover = isHover;
        });
      },
      child: AnimatedContainer(
        height: 60,
        color: isHover ? widget.hoverColor : widget.backgroundColor,
        duration: Duration(milliseconds: widget.animationMillisecondDuration),
        child: Center(
          child: Text(
            isHover ? widget.hoverText ?? widget.text : widget.text,
            style: widget.textStyle ?? KDSTextStyles.body(
              fontSize: 20,
              color: KDSColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
