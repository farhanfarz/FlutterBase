import 'design.dart';

class DesignShadowContainerBox extends StatelessWidget {
  DesignShadowContainerBox({
    Key? key,
    this.child,
    this.shadowColor = const Color.fromARGB(23, 0, 0, 0),
    this.blurRadius = 10.0,
    this.spreadRadius = 0.0,
    this.offset = const Offset(
      0.0, // Move to right 10  horizontally
      4.0, // Move to bottom 10 Vertically
    ),
    this.borderRadius = 15.0,
    this.backgroundColor,
  }) : super(key: key);
  final Widget? child;
  final Color shadowColor;
  final double blurRadius;
  final double spreadRadius;
  final Offset offset;
  final double borderRadius;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor ?? Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: blurRadius, // soften the shadow
            spreadRadius: spreadRadius, //extend the shadow
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }
}
