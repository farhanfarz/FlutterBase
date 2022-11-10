import 'design.dart';

class TeaserCard extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final double? imageHeight;
  final EdgeInsets? padding;
  final EdgeInsets? textPadding;

  const TeaserCard({
    Key? key,
    this.title,
    this.subTitle,
    this.imagePath,
    this.imageHeight,
    this.padding,
    this.textPadding,
    this.titleStyle,
    this.subTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ??
          EdgeInsets.only(
            left: 16,
            right: 16,
          ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              7.0, // Move to bottom 10 Vertically
            ),
          ),
        ],
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (imagePath != null)
              SizedBox(
                height: imageHeight ?? 222.h,
                child: Image(
                  image: AssetImage(
                    imagePath ?? '',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: textPadding ??
                  EdgeInsets.all(
                    16.0,
                  ),
              child: Column(
                children: [
                  if (title != null)
                    Text(
                      title ?? '',
                      maxLines: 2,
                      style: this.titleStyle ??
                          Theme.of(context).textTheme.headline2,
                    ),
                  if (subTitle != null)
                    SizedBox(
                      height: 16,
                    ),
                  if (subTitle != null)
                    Text(
                      subTitle ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: this.subTitleStyle ??
                          Theme.of(context).textTheme.bodyText1,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
