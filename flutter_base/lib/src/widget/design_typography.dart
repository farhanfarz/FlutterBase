import 'design.dart';

abstract class DesignTypography {
  static TextStyle textHeadline1({
    double fontSize = 28.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.21,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textHeadline2({
    double fontSize = 24.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.41,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textHeadline3({
    double fontSize = 18.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.11,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textHeadline4({
    double fontSize = 16.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.25,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textBody({
    double fontSize = 14.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.42,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textSubtitle({
    double fontSize = 14.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.28,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textSubtitle2({
    double fontSize = 14.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.21,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textCaption({
    double fontSize = 12.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color.withOpacity(0.5),
      fontSize: fontSize,
      height: 1.22,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textButtonContained({
    double fontSize = 14.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.22,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textButtonPlain({
    double fontSize = 14.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      height: 1.36,
      fontWeight: FontWeight.w500,
    );
  }
}
