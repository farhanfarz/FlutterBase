import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarDesign extends StatelessWidget {
  final String? middleTitle;
  final TextStyle? middleTitleStyle;
  final Function? onTapTrailing;
  final Function? onTapLeading;
  final Widget? child;
  final String? leadingTitle;
  final String? trailingTitle;
  final Color backgroundColor;
  final bool showArrow;
  final bool isRightActionEnabled;
  final bool useSafeArea;
  final double rightConstraintBox;
  final bool useDarkStatusBar;
  final String? arrowImagePath;
  final String? trailingImage;
  final bool showTrailingImage;

  const CustomAppBarDesign(
      {this.leadingTitle,
      this.trailingTitle,
      this.middleTitle,
      this.onTapTrailing,
      this.onTapLeading,
      this.child,
      this.backgroundColor = Colors.white,
      this.showArrow = true,
      this.isRightActionEnabled = true,
      this.useSafeArea = false,
      this.rightConstraintBox = 80,
      this.useDarkStatusBar = false,
      this.arrowImagePath,
      this.showTrailingImage = false,
      this.trailingImage,
      this.middleTitleStyle})
      : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ConstrainedBox(
              constraints: BoxConstraints.tight(
                const Size.fromWidth(75),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      if (showArrow)
                        SvgPicture.asset(arrowImagePath ?? '')
                      else
                        Container(),
                      if (showArrow)
                        const SizedBox(
                          width: 5,
                        )
                      else
                        Container(),
                      Text(
                        leadingTitle ?? '',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  onTap: () {
                    if (onTapLeading != null) {
                      onTapLeading!();
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Text(
                middleTitle ?? '',
                style:
                    middleTitleStyle ?? Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ConstrainedBox(
              constraints:
                  BoxConstraints.tight(Size.fromWidth(rightConstraintBox)),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: showTrailingImage == false
                      ? GestureDetector(
                          child: trailingTitle != null
                              ? Text(
                                  trailingTitle ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                          color: isRightActionEnabled
                                              ? const Color(0xFF203979)
                                              : const Color(0xFF203979)
                                                  .withAlpha(64),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                )
                              : null,
                          onTap: () {
                            if (isRightActionEnabled) {
                              if (onTapTrailing != null) {
                                onTapTrailing!();
                              }
                            }
                          })
                      : GestureDetector(
                          child: trailingImage != null
                              ? SvgPicture.asset(trailingImage ?? '')
                              : null,
                          onTap: () {
                            if (isRightActionEnabled) {
                              if (onTapTrailing != null) {
                                onTapTrailing!();
                              }
                            }
                          })),
            ),
            // child,
          ]),
        ),
        Expanded(
          child: child ?? Container(),
        )
      ],
    );
  }
}
