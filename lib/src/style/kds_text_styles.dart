part of style;


class KDSTextStyles {

  static TextStyle body({
    Color? color = KDSColors.black,
    double? fontSize = 14,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      decoration: decoration,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}