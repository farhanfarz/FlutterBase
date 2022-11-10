import 'package:flutter/material.dart';

class DesignTransparentButton extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback? onPressed;
  final Color? borderColor;

  const DesignTransparentButton({
    Key? key,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.borderColor,
    this.buttonWidth,
    this.buttonHeight,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          this.title ?? '',
          textAlign: TextAlign.center,
          style: this.titleStyle ?? Theme.of(context).textTheme.caption,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              this.backgroundColor ?? Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                  color: this.borderColor ?? Colors.transparent, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
