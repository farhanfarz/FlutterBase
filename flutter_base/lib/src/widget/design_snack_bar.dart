import 'design.dart';

class DesignSnackBar {
  const DesignSnackBar({
    this.title,
    this.subtitle,
    this.icon,
    this.height,
  }) : super();

  final String? title, subtitle, icon;
  final double? height;

  SnackBar snackBar(BuildContext context) {
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        margin: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: DesignShadowContainerBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            child: Wrap(
              // height: height ?? 57,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/$icon.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 1.sw - 122,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.22,
                                      ),
                                ),
                                if (subtitle != null)
                                  const SizedBox(
                                    height: 2,
                                  ),
                                if (subtitle != null)
                                  Text(
                                    subtitle!,
                                    // maxLines: 2,
                                    // overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: const Color(0xFF808080),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.22,
                                        ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      //   },
                      //   child: Row(
                      //     children: [],
                      //   ),
                      // )
                    ]),
              ],
            ),
          ),
        ));
  }
}
