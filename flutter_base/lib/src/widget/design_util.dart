import 'design.dart';

class DesignHorizontalMargin extends StatelessWidget {
  DesignHorizontalMargin(
    this.content, {
    Key? key,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: margin),
      child: content,
    );
  }

  static const margin = 16.0;
}

abstract class UiUtils {
  static double getTextHeight(
      BuildContext context, String text, TextStyle style,
      {double horizontalPadding = 0, double? availableWidth}) {
    var mqd = MediaQuery.of(context);
    var rp = RenderParagraph(
      TextSpan(style: style, text: text, children: null, recognizer: null),
      textScaleFactor: mqd.textScaleFactor,
      textDirection: TextDirection.ltr,
    );
    var width = availableWidth ?? mqd.size.width;
    var ret = rp.computeMinIntrinsicHeight(width - horizontalPadding);
    return ret;
  }

  static double getTextWidth(BuildContext context, String text, TextStyle style,
      {double horizontalPadding = 0, double? availableWidth}) {
    var mqd = MediaQuery.of(context);
    var rp = RenderParagraph(
      TextSpan(style: style, text: text, children: null, recognizer: null),
      textScaleFactor: mqd.textScaleFactor,
      textDirection: TextDirection.ltr,
    );
    var height = getTextHeight(
      context,
      text,
      style,
    );
    var ret = rp.computeMinIntrinsicHeight(height);
    return ret;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
