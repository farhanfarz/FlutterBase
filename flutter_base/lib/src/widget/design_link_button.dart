import 'design.dart';

class DesignLinkButton extends StatelessWidget {
  const DesignLinkButton({
    Key? key,
    this.labelTitle,
    this.buttonTitle,
    this.onPress,
    this.labelStyle,
    this.buttonStyle,
    this.buttonWidth,
  }) : super(key: key);

  final String? labelTitle;
  final String? buttonTitle;
  final VoidCallback? onPress;
  final TextStyle? labelStyle;
  final TextStyle? buttonStyle;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelTitle ?? '',
          style: labelStyle ??
              Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                  ),
        ),
        DesignTransparentButton(
          title: buttonTitle ?? '',
          buttonWidth: buttonWidth ?? 55.w,
          buttonHeight: 36.h,
          titleStyle: buttonStyle ??
              Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
          onPressed: () {
            //Navigator.pushNamed(context, signupRoute);
          },
        ),
      ],
    );
  }
}
