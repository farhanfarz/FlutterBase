import 'dart:io';

import 'design.dart';

class DesignSearchBar extends StatelessWidget implements PreferredSizeWidget {
  DesignSearchBar({
    Key? key,
    this.searchPlaceholder = 'Search',
    this.searchBarBackground,
    this.hintStyle,
    this.textStyle,
    this.searchBarHeight = 44.0,
    this.imagePath = "assets/images/svg/search.svg",
    this.searchController,
    this.onSubmitted,
    this.focusNode,
    this.onTap,
    this.topPadding = 16,
    this.bottomPadding = 0,
    this.bottomContentPadding = 0,
  }) : super(key: key);

  //static final _searchBarHeight = 44.0;

  final TextEditingController? searchController;

  final String? searchPlaceholder;
  final Color? searchBarBackground;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final double searchBarHeight;
  final String imagePath;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final double bottomPadding;
  final double topPadding;
  final double bottomContentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: !Responsive.isDesktop(context)
          ? UiUtils.getWidth(context)
          : UiUtils.getWidth(context) / 4,
      padding: _getPadding(),
      child: _buildSearchBar(context),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: searchBarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: searchController ?? TextEditingController(),
        focusNode: focusNode,
        onSubmitted: onSubmitted,
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: searchBarBackground ?? Theme.of(context).backgroundColor,
          contentPadding: EdgeInsets.only(
            bottom: bottomContentPadding,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
            ),
            child: SvgPicture.asset(imagePath),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 20,
            minHeight: 20,
          ),
          hintText: searchPlaceholder,
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(0.5),
                  ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        style: textStyle ??
            Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 13,
                ),
        onChanged: (newTerm) {},
      ),
    );
  }

  @override
  Size get preferredSize {
    final padding = _getPadding();
    final height = searchBarHeight + padding.top + padding.bottom;
    return Size.fromHeight(height);
  }

  EdgeInsets _getPadding() => EdgeInsets.fromLTRB(
        DesignHorizontalMargin.margin,
        topPadding,
        DesignHorizontalMargin.margin,
        bottomPadding,
      );
}
