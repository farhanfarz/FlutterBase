import 'design.dart';

class DesignBackButton extends StatelessWidget {
  const DesignBackButton({
    Key? key,
    required this.context,
    this.color,
    this.backTitle,
    this.showArrow = true,
    this.padding,
    this.textStyle,
  }) : super(key: key);

  final BuildContext context;
  final Color? color;
  final String? backTitle;
  final bool showArrow;
  final double? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.only(left: padding ?? 20.0),
      onPressed: () {
        var handler = context.findAncestorStateOfType<BackPressHandler>();
        if (handler != null) {
          handler.onBackPressed();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showArrow
              ? SizedBox(
                  width: 17,
                  height: 21,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: color ?? Theme.of(context).primaryColor,
                  ),
                )
              : SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 4,
              ),
              Text(
                backTitle ?? 'Back',
                style: textStyle ??
                    Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: color ?? Theme.of(context).primaryColor,
                        ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
