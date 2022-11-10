import 'design.dart';

class DesignGradientContainer extends StatelessWidget {
  const DesignGradientContainer({
    Key? key,
    this.colors,
    this.stops,
    this.begin,
    this.end,
    this.transform,
    this.child,
  }) : super(key: key);

  final List<Color>? colors;
  final List<double>? stops;
  final Alignment? begin;
  final Alignment? end;
  final Widget? child;
  final GradientTransform? transform;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin ?? Alignment.topCenter,
          end: end ?? Alignment.bottomCenter,
          stops: stops ?? [0.1, 0.5],
          transform: transform,
          colors: colors ??
              [
                Color(0xffFF8686),
                Color(0xff6A46AF),
              ],
        ),
      ),
      child: child != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [child!],
            )
          : SizedBox(),
    );
  }
}
