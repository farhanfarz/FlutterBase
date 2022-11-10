import 'design.dart';

class TeaserSlide extends StatelessWidget {
  TeaserSlide({
    required this.imagePath,
    required this.title,
    this.subtitle = '',
    this.style,
  });

  final String imagePath, title, subtitle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250.h,
          child: Image.asset(imagePath),
        ),
        SizedBox(
          height: 44.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            title,
            style: style ?? Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        if (subtitle.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              top: 25.h,
            ),
            child: Text(
              subtitle,
              style: style != null
                  ? style?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )
                  : Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
