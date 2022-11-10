import 'design.dart';

abstract class DesignColor {
  Color getPrimaryColor(ThemeType type);
  Color getScaffoldBGColor(ThemeType type);
  Color getBackgroundColor(ThemeType type);
  Color getAppBarBGColor(ThemeType type);
  Color getIndicatorColor(ThemeType type);
  Color getTextfieldFillColor(ThemeType type);
  Color getTextfieldBorderColor(ThemeType type);
  Color getDefaultTextColor(ThemeType type);
  Color getDefaultSubTextColor(ThemeType type);
  Color getDefaultButtonTextColor(ThemeType type);
  Color getDefaultBarButtonTextColor(ThemeType type);
  Color getShadowColorTextColor(ThemeType type);
  Color getCardBGColor(ThemeType type);
  Color getDividerColor(ThemeType type);
}

abstract class DesignFont {
  TextStyle textHeadline1();
  TextStyle textHeadline2();
  TextStyle textHeadline3();
  TextStyle textHeadline4();
  TextStyle textHeadline5();
  TextStyle textHeadline6();
  TextStyle textBody();
  TextStyle textBodyText2();
  TextStyle textSubtitle();
  TextStyle textSubtitle2();
  TextStyle textCaption();
  TextStyle textButton();
  TextStyle textOverline();
}
