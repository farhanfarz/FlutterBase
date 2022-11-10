import 'design.dart';

enum ThemeType {
  primary,
  unknown,
}

abstract class AppTheme {
  ThemeType currentTheme = ThemeType.primary;

  void changeTheme({required ThemeType type}) {
    currentTheme = type;
  }
}

ThemeData getTheme({
  required ThemeType type,
  required DesignColor colorPallete,
  required String fontFamily,
}) =>
    ThemeData(
      primaryColor: colorPallete.getPrimaryColor(type),
      fontFamily: fontFamily,
      scaffoldBackgroundColor: colorPallete.getScaffoldBGColor(type),
      indicatorColor: colorPallete.getIndicatorColor(type),
      dividerColor: colorPallete.getDividerColor(type),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        buttonColor: colorPallete.getPrimaryColor(type),
      ),
      // dialogTheme: DialogTheme(
      //   // titleTextStyle: DesignTypography.textButtonContained(
      //   //   color: colorPallete.getDefaultButtonTextColor(type),

      //   //   // shape: RoundedRectangleBorder(
      //   //   //   borderRadius: BorderRadius.circular(12.0),
      //   //   // ),
      //   // ),
      // ),
      appBarTheme: AppBarTheme(
        color: colorPallete.getAppBarBGColor(type),
      ),
      textTheme: TextTheme(
        headline1: DesignTypography.textHeadline1(
          color: colorPallete.getDefaultTextColor(type),
        ),
        headline2: DesignTypography.textHeadline2(
          color: colorPallete.getDefaultTextColor(type),
        ),
        headline3: DesignTypography.textHeadline3(
          color: colorPallete.getDefaultTextColor(type),
        ),
        headline4: DesignTypography.textHeadline4(
          color: colorPallete.getDefaultTextColor(type),
        ),
        bodyText1: DesignTypography.textBody(
          color: colorPallete.getDefaultTextColor(type),
        ),
        subtitle1: DesignTypography.textSubtitle(
          color: colorPallete.getDefaultTextColor(type),
        ),
        subtitle2: DesignTypography.textSubtitle2(
          color: colorPallete.getDefaultBarButtonTextColor(type),
        ),
        caption: DesignTypography.textCaption(
          color: colorPallete.getDefaultSubTextColor(type),
        ),
        button: DesignTypography.textButtonContained(
          color: colorPallete.getDefaultButtonTextColor(type),
        ),
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: MaterialStateProperty.all(
      //       DesignTypography.textButtonPlain().copyWith(color: Colors.white),
      //     ),

      //     // foregroundColor: MaterialStateProperty.all(
      //     //   colorPallete.getPrimaryColor(type),
      //     // ),
      //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //     overlayColor: MaterialStateProperty.all(
      //       Colors.transparent,
      //     ),
      //     backgroundColor: MaterialStateProperty.all(
      //       colorPallete.getPrimaryColor(type),
      //     ),
      //     // minimumSize: MaterialStateProperty.all(
      //     //   Size(
      //     //     double.infinity,
      //     //     44.h,
      //     //   ),
      //     // ),
      //     padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 6)),
      //     shape: MaterialStateProperty.all(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12.w),
      //         side: BorderSide.none,
      //       ),
      //     ),
      //   ),
      // ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        fillColor: colorPallete.getTextfieldFillColor(type),
        border: _createInputBorder(hasBorder: false),
        focusedBorder: _createInputBorder(
          color: colorPallete.getTextfieldBorderColor(type),
        ),
        hintStyle: DesignTypography.textBody(),
      ),
      backgroundColor: colorPallete.getBackgroundColor(type),
      shadowColor: colorPallete.getShadowColorTextColor(type),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.zero,
        color: colorPallete.getCardBGColor(type),
        elevation: 10,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            DesignTypography.textButtonPlain(
              color: colorPallete.getDefaultTextColor(type),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            colorPallete.getBackgroundColor(type),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // overlayColor: MaterialStateProperty.all(
          //   Colors.transparent,
          // ),
          backgroundColor: MaterialStateProperty.all(
            colorPallete.getBackgroundColor(type),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              double.infinity,
              44.h,
            ),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: colorPallete.getDefaultTextColor(type),
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );

ThemeData getAppTheme({
  required ThemeType type,
  required DesignColor colorPallete,
  required DesignFont fontManager,
  required String fontFamily,
}) =>
    ThemeData(
      primaryColor: colorPallete.getPrimaryColor(type),
      fontFamily: fontFamily,
      scaffoldBackgroundColor: colorPallete.getScaffoldBGColor(type),
      indicatorColor: colorPallete.getIndicatorColor(type),
      dividerColor: colorPallete.getDividerColor(type),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        buttonColor: colorPallete.getPrimaryColor(type),
      ),
      // dialogTheme: DialogTheme(
      //   // titleTextStyle: DesignTypography.textButtonContained(
      //   //   color: colorPallete.getDefaultButtonTextColor(type),

      //   //   // shape: RoundedRectangleBorder(
      //   //   //   borderRadius: BorderRadius.circular(12.0),
      //   //   // ),
      //   // ),
      // ),
      appBarTheme: AppBarTheme(
        color: colorPallete.getAppBarBGColor(type),
      ),
      textTheme: TextTheme(
        headline1: fontManager.textHeadline1(),
        headline2: fontManager.textHeadline2(),
        headline3: fontManager.textHeadline3(),
        headline4: fontManager.textHeadline4(),
        headline5: fontManager.textHeadline5(),
        headline6: fontManager.textHeadline6(),
        bodyText1: fontManager.textBody(),
        bodyText2: fontManager.textBodyText2(),
        subtitle1: fontManager.textSubtitle(),
        subtitle2: fontManager.textSubtitle2(),
        caption: fontManager.textCaption(),
        button: fontManager.textButton(),
        overline: fontManager.textOverline(),
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: MaterialStateProperty.all(
      //       DesignTypography.textButtonPlain().copyWith(color: Colors.white),
      //     ),

      //     // foregroundColor: MaterialStateProperty.all(
      //     //   colorPallete.getPrimaryColor(type),
      //     // ),
      //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //     overlayColor: MaterialStateProperty.all(
      //       Colors.transparent,
      //     ),
      //     backgroundColor: MaterialStateProperty.all(
      //       colorPallete.getPrimaryColor(type),
      //     ),
      //     // minimumSize: MaterialStateProperty.all(
      //     //   Size(
      //     //     double.infinity,
      //     //     44.h,
      //     //   ),
      //     // ),
      //     padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 6)),
      //     shape: MaterialStateProperty.all(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12.w),
      //         side: BorderSide.none,
      //       ),
      //     ),
      //   ),
      // ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        fillColor: colorPallete.getTextfieldFillColor(type),
        border: _createInputBorder(hasBorder: false),
        focusedBorder: _createInputBorder(
          color: colorPallete.getTextfieldBorderColor(type),
        ),
        hintStyle: fontManager.textBodyText2(),
      ),
      backgroundColor: colorPallete.getBackgroundColor(type),
      shadowColor: colorPallete.getShadowColorTextColor(type),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.zero,
        color: colorPallete.getCardBGColor(type),
        elevation: 10,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            fontManager.textHeadline4(),
          ),
          foregroundColor: MaterialStateProperty.all(
            colorPallete.getBackgroundColor(type),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // overlayColor: MaterialStateProperty.all(
          //   Colors.transparent,
          // ),
          backgroundColor: MaterialStateProperty.all(
            colorPallete.getBackgroundColor(type),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              double.infinity,
              44.h,
            ),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: colorPallete.getDefaultTextColor(type),
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );

OutlineInputBorder _createInputBorder({
  Color color = Colors.black,
  bool hasBorder = true,
}) {
  return OutlineInputBorder(
    borderSide: hasBorder
        ? BorderSide(
            color: color,
            width: 2,
          )
        : BorderSide.none,
    borderRadius: BorderRadius.circular(8),
  );
}
