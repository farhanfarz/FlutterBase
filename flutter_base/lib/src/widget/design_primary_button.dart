import 'design.dart';

class DesignPrimaryButton extends StatelessWidget {
  DesignPrimaryButton({
    required this.buttonOnPress,
    required this.buttonLabel,
    this.horizontalPadding,
    this.backgroundColor,
    this.textStyle,
    this.borderSide = BorderSide.none,
  });
  final Function()? buttonOnPress;
  final String buttonLabel;
  final double? horizontalPadding;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16.0,
      ),
      child: TextButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            textStyle ??
                DesignTypography.textButtonPlain()
                    .copyWith(color: Colors.white),
          ),
          foregroundColor: MaterialStateProperty.all(
            Theme.of(context).primaryColor,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Theme.of(context).primaryColor,
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              double.infinity,
              44.h,
            ),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.w),
              side: borderSide ?? BorderSide.none,
            ),
          ),
        ),
        child: Text(
          buttonLabel,
          style: textStyle ?? Theme.of(context).textTheme.button,
        ),
        onPressed: buttonOnPress,
      ),
    );
  }
}
