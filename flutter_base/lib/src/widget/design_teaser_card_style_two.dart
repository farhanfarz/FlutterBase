import 'design.dart';

class TeaserCardStyleTwo extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final double? imageHeight;
  final EdgeInsets? padding;
  final EdgeInsets? textPadding;
  final String? banner;
  final int? titleMaxLines;
  final int? subTitleMaxLines;
  final String placeholderImage;
  final Widget? child;

  const TeaserCardStyleTwo({
    Key? key,
    this.title,
    this.subTitle,
    this.imagePath,
    this.imageHeight,
    this.padding,
    this.textPadding,
    this.titleStyle,
    this.subTitleStyle,
    this.banner,
    this.titleMaxLines,
    this.subTitleMaxLines,
    this.placeholderImage = '',
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget subtitleWidget = Text(
      subTitle ?? '',
      maxLines: subTitleMaxLines,
      overflow: TextOverflow.ellipsis,
      style: this.subTitleStyle ?? Theme.of(context).textTheme.caption,
    );

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
          ),
          // height: 226,
          width: 1.sw - 32,
          clipBehavior: Clip.antiAlias,
          height: 186.h,
          child: imagePath == null
              ? FadeInImage.assetNetwork(
                  placeholder: placeholderImage,
                  fit: BoxFit.fill,
                  //,
                  image: banner ?? '',
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image(
                      image: AssetImage(placeholderImage),
                      fit: BoxFit.fill,
                    );
                  },
                )
              : Image(
                  image: AssetImage(imagePath ?? ''),
                  fit: BoxFit.fill,
                ),
        ),
        Container(
          width: 1.sw - 32,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
              0.1,
              0.9
            ], colors: [
              Color(0xFFFFFFFF).withOpacity(.100),
              Colors.black.withOpacity(.100)
            ]),
            // boxShadow: [
            //   BoxShadow(
            //     color:
            //     //Theme.of(context).shadowColor.withOpacity(.30),
            //     blurRadius: 10.0, // soften the shadow
            //     spreadRadius: 0.0, //extend the shadow
            //     offset: Offset(
            //       0.0, // Move to right 10  horizontally
            //       4.0, // Move to bottom 10 Vertically
            //     ),
            //   ),
            // ],
            borderRadius: BorderRadius.circular(24.0),
          ),
          // child: banner != null
          //     ? SizedBox(
          //         height: imageHeight,
          //         child: banner!,
          //       )
          //     : null,
        ),
        Container(
          width: 1.sw - 32,
          // height: 226,
          // width: double.infinity,
          //color: Colors.amber,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.55),
                  ],
                  stops: [
                    0.0,
                    0.6,
                  ])),
          child: Padding(
            padding: padding ??
                const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  maxLines: titleMaxLines,
                  style:
                      this.titleStyle ?? Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                child != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 1.sw - 180,
                            child: subtitleWidget,
                          ),
                          child!,
                        ],
                      )
                    : subtitleWidget,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
