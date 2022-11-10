import 'dart:math';
import 'package:flutter/foundation.dart';
import 'design.dart';

const double _appBarHeight = 56.0;

class DesignScaffold extends StatefulWidget {
  DesignScaffold({
    this.appBarLeftButton = DesignAppBarLeftButton.none,
    this.useSafeArea = false,
    this.titleMode = DesignAppBarTitleMode.none,
    this.onBackPressed,
    this.pinnedHeaders,
    this.rightButton,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.expandedTitleStyle,
    this.scrollableContent,
    this.scrollableContentBuilder,
    this.body,
    this.allowScroll = true,
    this.contentTopPadding = 13.0,
    this.itemCount,
    this.addContentHorizontalMargin = false,
    this.bottomBar,
    this.nonStickyBottomBar,
    this.backgroundColor,
    this.appBarBackgroundColor,
    this.themeColor,
    this.contentBackgroundColor,
    this.background,
    this.leftButtonTitle = 'Back',
    this.expandedTitleOffset,
    this.allowAppBarShrink,
    this.scrollController,
    this.leftButtonPadding,
    this.backTitleStyle,
    this.showArrow = true,
    this.lineColor,
    Key? key,
  }) : super(key: key);

  final DesignAppBarLeftButton appBarLeftButton;
  final bool useSafeArea;
  final DesignAppBarTitleMode titleMode;
  final VoidCallback? onBackPressed;
  final List<Widget>? pinnedHeaders;
  final Widget? rightButton;
  final bool showArrow;

  final String? title;
  final String? subtitle;
  final TextStyle? expandedTitleStyle;
  final TextStyle? titleStyle;
  final TextStyle? backTitleStyle;

  final IndexedWidgetBuilder? scrollableContentBuilder;
  final List<Widget>? scrollableContent;
  final bool allowScroll;
  final double contentTopPadding;

  final int? itemCount;
  final bool addContentHorizontalMargin;

  final Widget? bottomBar;
  final Widget? nonStickyBottomBar;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final Color? themeColor;
  final Color? contentBackgroundColor;
  final Widget? background;
  final Widget? body;
  final String leftButtonTitle;
  final double? expandedTitleOffset;
  final bool? allowAppBarShrink;
  final ScrollController? scrollController;
  final double? leftButtonPadding;
  final Color? lineColor;

  @override
  State<StatefulWidget> createState() => _DesignScaffoldState();
}

class _DesignScaffoldState extends State<DesignScaffold>
    with PopScopeHost<DesignScaffold>
    implements PopScopeHost<DesignScaffold> {
  @override
  Widget build(BuildContext context) {
    Widget body = widget.useSafeArea
        ? Container(
            color: widget.appBarBackgroundColor ??
                Theme.of(context).backgroundColor,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: _createContent(),
              ),
            ),
          )
        : Column(
            children: _createContent(),
          );
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor:
            widget.backgroundColor ?? Theme.of(context).backgroundColor,
        body: widget.background != null
            ? Stack(
                children: [widget.background!, body],
              )
            : body,
      ),
    );
  }

  List<Widget> _createContent() {
    if (widget.bottomBar != null) {
      return [
        _createScrollView(),
        if (widget.bottomBar != null) widget.bottomBar!,
      ];
    } else {
      return [_createScrollView()];
    }
  }

  Widget _createScrollView() {
    return Expanded(
      child: Container(
        color: widget.backgroundColor,
        child: CustomScrollView(
          controller: widget.scrollController,
          physics: widget.allowScroll
              ? ClampingScrollPhysics()
              : NeverScrollableScrollPhysics(),
          slivers: [
            _createPinnedAppBar(),
            if (widget.body != null)
              SliverFillRemaining(
                child: widget.body,
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                _createContentBuilder() as Widget? Function(BuildContext, int),
                childCount:
                    widget.itemCount ?? widget.scrollableContent?.length ?? 0,
              ),
            ),
            if (widget.nonStickyBottomBar != null)
              SliverFillRemaining(
                child: widget.nonStickyBottomBar!,
              )
          ],
        ),
      ),
    );
  }

  Widget _createPinnedAppBar() {
    return SliverPersistentHeader(
        delegate: _DesignPersistentAppBar(
          contextProvider: () => context,
          expandedTitleOffset: widget.expandedTitleOffset,
          allowAppBarShrink: widget.allowAppBarShrink,
          appBar: _DesignAppBar(
            leftButton: widget.appBarLeftButton,
            title: widget.title,
            leftButtonTitle: widget.leftButtonTitle,
            showArrow: widget.showArrow,
            subtitle: widget.subtitle,
            titleStyle: widget.titleStyle,
            onBackPressed: widget.onBackPressed,
            rightButton: widget.rightButton,
            appBarBackgroundColor: widget.appBarBackgroundColor,
            themeColor: widget.themeColor,
            leftButtonPadding: widget.leftButtonPadding,
            backTitleStyle: widget.backTitleStyle,
            lineColor: widget.lineColor,
          ),
          pinnedHeaders: widget.pinnedHeaders,
          expandedTitleStyle: widget.expandedTitleStyle ??
              Theme.of(context).textTheme.headline2!,
          titleMode: widget.titleMode,
        ),
        pinned: true,
        floating: false);
  }

  Function(BuildContext, int) _createContentBuilder() {
    final builder = widget.scrollableContentBuilder ??
        (context, index) {
          var padding = Padding(
            padding: EdgeInsets.only(
                top: (index == 0 ? widget.contentTopPadding : 0.0)),
            child: widget.scrollableContent![index],
          );
          return widget.contentBackgroundColor != null
              ? Container(
                  color: widget.contentBackgroundColor,
                  child: padding,
                )
              : padding;
        };

    if (widget.addContentHorizontalMargin) {
      return (c, i) => DesignHorizontalMargin(builder(c, i));
    } else {
      return builder;
    }
  }
}

class _DesignPersistentAppBar extends SliverPersistentHeaderDelegate {
  _DesignPersistentAppBar({
    required this.contextProvider,
    required this.appBar,
    required this.expandedTitleStyle,
    required this.titleMode,
    this.pinnedHeaders,
    this.expandedTitleOffset,
    this.titleStyle,
    this.allowAppBarShrink,
  });

  final BuildContext Function() contextProvider;
  final _DesignAppBar appBar;
  final TextStyle expandedTitleStyle;
  final DesignAppBarTitleMode titleMode;
  final List<Widget>? pinnedHeaders;
  final TextStyle? titleStyle;
  final double? expandedTitleOffset;
  final bool? allowAppBarShrink;

  ValueNotifier<bool> _titleVisibility = ValueNotifier(false);

  double _expandedTitleHeight = 0.0;

  // @override
  // double get maxExtent => minExtent + _getExpandedTitleHeight();

  // @override
  // double get minExtent => _getDefaultAppBarSize() + _getPinnedHeaderSize();

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent {
    var height = 0.0;
    if (titleMode == DesignAppBarTitleMode.small ||
        titleMode == DesignAppBarTitleMode.popup) {
      height += _getDefaultAppBarSize();
    }
    if (titleMode == DesignAppBarTitleMode.large) {
      if (!Responsive.isDesktop(contextProvider()))
        height += _getExpandedTitleHeight();
    }
    if (pinnedHeaders != null) {
      height += _getAppBarPadding().bottom;
    }
    if (titleMode == DesignAppBarTitleMode.hybrid) {
      height += _getDefaultAppBarSize();
      if (!Responsive.isDesktop(contextProvider()))
        height += _getExpandedTitleHeight();
    }
    if (pinnedHeaders != null) {
      height += _getPinnedHeaderSize();
    }
    return height;
  }

  EdgeInsets _getAppBarPadding() => EdgeInsets.fromLTRB(
        DesignHorizontalMargin.margin,
        0,
        DesignHorizontalMargin.margin,
        titleMode == DesignAppBarTitleMode.small ||
                titleMode == DesignAppBarTitleMode.popup
            ? 0
            : titleMode == DesignAppBarTitleMode.none
                ? 0
                : 16,
      );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    _titleVisibility.value = !(allowAppBarShrink ?? true)
        ? false
        : titleMode == DesignAppBarTitleMode.hybrid
            ? (shrinkOffset >= _getExpandedTitleHeight())
            : titleMode == DesignAppBarTitleMode.small ||
                titleMode == DesignAppBarTitleMode.popup;

    final children = [
      if (titleMode == DesignAppBarTitleMode.large ||
          titleMode == DesignAppBarTitleMode.hybrid)
        Positioned(
          top: (titleMode == DesignAppBarTitleMode.hybrid
                  ? _getDefaultAppBarSize()
                  : 20.0) -
              (titleMode == DesignAppBarTitleMode.hybrid &&
                      (allowAppBarShrink ?? true)
                  ? shrinkOffset
                  : 0.0),
          child: _createLargeTitle(context),
        ),
      if (titleMode == DesignAppBarTitleMode.small ||
          titleMode == DesignAppBarTitleMode.popup ||
          titleMode == DesignAppBarTitleMode.hybrid)
        Positioned(top: 0.0, child: _createDefaultAppBar(shrinkOffset))
    ];
    if (pinnedHeaders != null) {
      var pinnedExpandedTop = 0.0;
      if (titleMode == DesignAppBarTitleMode.hybrid) {
        pinnedExpandedTop = _getDefaultAppBarSize() + _getExpandedTitleHeight();
        var pinnedTop =
            max(pinnedExpandedTop - shrinkOffset, _getDefaultAppBarSize());
        for (var header in pinnedHeaders!) {
          children.add(Positioned(top: pinnedTop, child: header));
          var pinnedWidget = header as PreferredSizeWidget;
          pinnedTop += pinnedWidget.preferredSize.height;
        }
      } else if (titleMode == DesignAppBarTitleMode.small ||
          titleMode == DesignAppBarTitleMode.popup) {
        pinnedExpandedTop = _getDefaultAppBarSize();
        for (var header in pinnedHeaders!) {
          children.add(Positioned(top: pinnedExpandedTop, child: header));
          var pinnedWidget = header as PreferredSizeWidget;
          pinnedExpandedTop += pinnedWidget.preferredSize.height;
        }
      } else if (titleMode == DesignAppBarTitleMode.large) {
        pinnedExpandedTop = _getExpandedTitleHeight();
        var pinnedExpandedWidth = appBar.rightButton != null ? 80.0 : 0.0;
        for (var header in pinnedHeaders!) {
          if (!Responsive.isDesktop(context))
            children.add(Positioned(top: pinnedExpandedTop, child: header));
          else
            children.add(Positioned(right: pinnedExpandedWidth, child: header));

          var pinnedWidget = header as PreferredSizeWidget;
          pinnedExpandedTop += pinnedWidget.preferredSize.height;
          pinnedExpandedWidth += !Responsive.isDesktop(context)
              ? UiUtils.getWidth(context)
              : UiUtils.getWidth(context) / 4;
        }
      }
    }
    return Container(
      decoration: BoxDecoration(
        border: appBar.showLine
            ? Border(
                bottom:
                    BorderSide(color: appBar.lineColor ?? Color(0xFFEBEDEF)),
              )
            : Border(),
        color: appBar.appBarBackgroundColor,
      ),
      child: Stack(children: children),
    );
  }

  Widget _createDefaultAppBar(double shrinkOffset) {
    return _DesignAppBar(
      leftButton: appBar.leftButton,
      title: appBar.title,
      subtitle: appBar.subtitle,
      leftButtonTitle: appBar.leftButtonTitle,
      showArrow: appBar.showArrow,
      titleVisibility: _titleVisibility,
      onBackPressed: appBar.onBackPressed,
      appBarBackgroundColor: appBar.appBarBackgroundColor,
      themeColor: appBar.themeColor,
      titleStyle: appBar.titleStyle,
      rightButton: appBar.rightButton,
      leftButtonPadding: appBar.leftButtonPadding,
      backTitleStyle: appBar.backTitleStyle,
      lineColor: appBar.lineColor,
    );
  }

  Widget _createLargeTitle(BuildContext context) {
    var text = Text(
      appBar.title ?? '',
      style: expandedTitleStyle,
    );
    final context = contextProvider();
    var titleWithDrawer = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          minWidth: 30.0,
          onPressed: () => Scaffold.of(context).openDrawer(),
          child: Icon(
            Icons.menu,
            color: appBar.themeColor,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        text
      ],
    );
    var expandedTitle = appBar.leftButton == DesignAppBarLeftButton.drawer
        ? titleWithDrawer
        : text;
    return Container(
      width: !Responsive.isDesktop(context)
          ? UiUtils.getWidth(context)
          : (UiUtils.getWidth(context) / 6) * 5,
      child: DesignHorizontalMargin(
        appBar.rightButton == null
            ? expandedTitle
            : titleMode == DesignAppBarTitleMode.large
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      expandedTitle,
                      appBar.rightButton!,
                    ],
                  )
                : expandedTitle,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    if (oldDelegate is _DesignPersistentAppBar) {
      _titleVisibility = oldDelegate._titleVisibility;
      return false;
    }
    return true;
  }

  double _getDefaultAppBarSize() =>
      titleMode != DesignAppBarTitleMode.none ? _appBarHeight : 0;

  double _getPinnedHeaderSize() {
    if (pinnedHeaders != null) {
      var pinnedHeadersHeight = 0.0;
      for (var header in pinnedHeaders!) {
        var pinnedWidget = header as PreferredSizeWidget;
        if (!Responsive.isDesktop(contextProvider()))
          pinnedHeadersHeight += pinnedWidget.preferredSize.height;
        else
          pinnedHeadersHeight = pinnedWidget.preferredSize.height;
      }
      return pinnedHeadersHeight;
    }
    return 0;
  }

  double _getExpandedTitleHeight() {
    if (_expandedTitleHeight == 0.0) {
      final context = contextProvider();
      _expandedTitleHeight = UiUtils.getTextHeight(
          context, appBar.title ?? '', expandedTitleStyle,
          horizontalPadding: DesignHorizontalMargin.margin * 2);
    }
    return _expandedTitleHeight + (expandedTitleOffset ?? 20);
  }

  double _getExpandedTitleWidth() {
    if (_expandedTitleHeight == 0.0) {
      final context = contextProvider();
      _expandedTitleHeight = UiUtils.getTextWidth(
          context, appBar.title ?? '', expandedTitleStyle,
          horizontalPadding: DesignHorizontalMargin.margin * 2);
    }
    return _expandedTitleHeight;
  }
}

class _DesignAppBar extends StatefulWidget {
  _DesignAppBar({
    this.leftButton = DesignAppBarLeftButton.none,
    this.title,
    this.subtitle,
    this.titleVisibility,
    this.onBackPressed,
    this.rightButton,
    this.appBarBackgroundColor,
    this.themeColor,
    this.titleStyle,
    this.leftButtonPadding,
    this.backTitleStyle,
    this.showArrow = true,
    this.showLine = true,
    this.lineColor,
    this.borderLineColor,
    required this.leftButtonTitle,
  });

  final DesignAppBarLeftButton leftButton;
  final VoidCallback? onBackPressed;

  final String? title;
  final String? subtitle;

  final ValueListenable<bool>? titleVisibility;
  final Widget? rightButton;
  final Color? appBarBackgroundColor;
  final Color? themeColor;
  final TextStyle? titleStyle;
  final TextStyle? backTitleStyle;

  final String leftButtonTitle;
  final double? leftButtonPadding;
  final bool showArrow;
  final bool showLine;
  final Color? lineColor;
  final Color? borderLineColor;

  @override
  State<StatefulWidget> createState() => _DesignAppBarState();
}

class _DesignAppBarState extends State<_DesignAppBar> {
  bool _isTitleVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.titleVisibility != null) {
      widget.titleVisibility?.addListener(onTitleVisibilityChanged);
      _isTitleVisible = widget.titleVisibility?.value ?? false;
    } else {
      _isTitleVisible = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.titleVisibility != null) {
      widget.titleVisibility?.removeListener(onTitleVisibilityChanged);
    }
  }

  void onTitleVisibilityChanged() {
    setState(() {
      _isTitleVisible = widget.titleVisibility?.value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var padding = 0.0;
    var children = <Widget>[];
    if (widget.leftButton != DesignAppBarLeftButton.none) {
      padding = 48.0;
      if (widget.leftButton == DesignAppBarLeftButton.back) {
        children.add(
          Align(
            alignment: Alignment.centerLeft,
            child: _buidBackButton(widget.leftButtonTitle, widget.showArrow),
          ),
        );
        if (widget.rightButton != null) {
          children.add(
            Container(
              margin: EdgeInsets.only(left: 1.sw - 100),
              alignment: Alignment.centerRight,
              child: widget.rightButton,
            ),
          );
        }
      } else if (widget.leftButton == DesignAppBarLeftButton.close) {
        children.add(
          Align(
            alignment: Alignment.centerLeft,
            child: _buidCloseButton(widget.leftButtonTitle),
          ),
        );
      }

      // if (widget.leftButton == DesignAppBarLeftButton.drawer)
      //   children.add(
      //     Align(
      //       alignment: Alignment.centerLeft,
      //       child: MaterialButton(
      //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //         padding: const EdgeInsets.only(left: 0.0),
      //         onPressed: widget.onBackPressed,
      //         child: const SizedBox(
      //           width: 30,
      //           height: 30,
      //           child: Icon(
      //             Icons.drag_handle,
      //             color: Design.white,
      //           ),
      //         ),
      //       ),
      //     ),
      //   );
    }

    if (widget.title != null) {
      children.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: padding),
          alignment: Alignment.center,
          child: _buildTitle(
            widget.title ?? '',
            subtitle: widget.subtitle,
          ),
        ),
      );
    }
    return Container(
      width: UiUtils.getWidth(context),
      height: _appBarHeight,
      child: Material(
        color:
            widget.appBarBackgroundColor ?? Theme.of(context).backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: children,
        ),
      ),
    );
  }

  Widget _buidBackButton(String title, bool showArrow) {
    return DesignBackButton(
      context: context,
      backTitle: title,
      showArrow: showArrow,
      color: widget.themeColor,
      padding: widget.leftButtonPadding,
      textStyle: widget.backTitleStyle,
    );
  }

  Widget _buidCloseButton(
    String title,
  ) {
    return DesignBackButton(
      context: context,
      backTitle: title,
      showArrow: false,
      color: widget.themeColor,
      padding: widget.leftButtonPadding,
      textStyle: widget.backTitleStyle,
    );
  }

  Widget _buildTitle(String title, {String? subtitle}) {
    var text = Text(
      widget.title ?? ' ',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: widget.titleStyle ?? Theme.of(context).textTheme.bodyText1,
    );
    return AnimatedOpacity(
      opacity: _isTitleVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: subtitle == null
          ? text
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text,
                Text(
                  widget.subtitle ?? ' ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
    );
  }
}

enum DesignAppBarLeftButton { none, back, drawer, close }

enum DesignAppBarTitleMode { small, large, hybrid, popup, none }
