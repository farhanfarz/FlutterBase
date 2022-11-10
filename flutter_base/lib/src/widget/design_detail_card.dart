import 'design.dart';

class DesignDetailCard extends StatelessWidget {
  const DesignDetailCard({
    Key? key,
    this.title,
    this.subtitle,
    this.trailing,
    this.titleColor, //Color(0XFF808080)
    this.margin,
    this.padding,
    this.onTap,
    this.children = const [],
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final Color? titleColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Function()? onTap;
  final List<Widget> children;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return buildDetailCard(context);
  }

  Widget buildDetailCard(BuildContext context) {
    return Container(
      padding: margin ??
          const EdgeInsets.only(
            bottom: 16,
            left: 16,
            right: 16,
          ),
      child: GestureDetector(
        onTap: onTap,
        child: DesignShadowContainerBox(
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //contentPadding: EdgeInsets.zero,
                Text(
                  title ?? '',
                  style: titleStyle ?? Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        subtitle ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: subtitleStyle ??
                            Theme.of(context).textTheme.caption?.copyWith(
                                  color: titleColor ??
                                      Theme.of(context).textTheme.caption?.color,
                                ),
                      ),
                    ),
                    if (trailing != null) trailing!,
                  ],
                ),
                if (children.isNotEmpty) ...children
              ],
            ),
          ),
        ),
      ),
    );
  }
}
