import 'design.dart';

class DesignCardDetails extends StatelessWidget {
  const DesignCardDetails({
    super.key,
    this.title,
    this.subTitle,
    this.imagePath,
    this.imageHeight,
    this.padding,
    this.textPadding,
    this.titleStyle,
    this.subTitleStyle,
  });

  final String? imagePath;
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final double? imageHeight;
  final EdgeInsets? padding;
  final EdgeInsets? textPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              4.0, // Move to bottom 10 Vertically
            ),
          ),
        ],
        borderRadius: BorderRadius.circular(24.0),
        image: imagePath == null
            ? null
            : DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath ?? ''),
              ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ListTile(
          title: Text(
            title ?? '',
            style: this.titleStyle ?? Theme.of(context).textTheme.headline1,
          ),
          subtitle: Text(
            subTitle ?? '',
            style: this.subTitleStyle ?? Theme.of(context).textTheme.caption,
          ),
        ),
      ),
    );
  }
}
