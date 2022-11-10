import 'package:cupertino_tabbar/cupertino_tabbar.dart' as cupertino_tab_bar;
import 'design.dart';

class DesignFlowSegmentBar extends StatelessWidget
    implements PreferredSizeWidget {
  DesignFlowSegmentBar(
      {Key? key,
      this.items = const [],
      this.selectedColor,
      this.unSelectedColor,
      this.selectedTextStyle,
      this.unSelectedTextStyle,
      this.background,
      this.segmentHeight = 44.0,
      this.segmentTab = 0,
      required this.onPressSegment,
      this.useShadow = true,
      this.topPadding = 16.0,
      this.bottomPadding = 0.0})
      : super(key: key);

  final List<String> items;
  final Color? background;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;
  final double segmentHeight;
  final int segmentTab;
  final Function(int) onPressSegment;
  final bool useShadow;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: !Responsive.isDesktop(context)
          ? UiUtils.getWidth(context)
          : UiUtils.getWidth(context) / 4,
      padding: _getPadding(),
      child: SizedBox(
        height: segmentHeight,
        child: _buildSegmentBar(context),
      ),
    );
  }

  Widget _buildSegmentBar(
    BuildContext context,
  ) {
    return cupertino_tab_bar.CupertinoTabBar(
      unSelectedColor ?? Theme.of(context).disabledColor,
      unSelectedColor ?? Theme.of(context).disabledColor,
      [
        ...items
            .asMap()
            .map(
              (index, title) => MapEntry(
                index,
                _buildTab(
                  context,
                  title: items[index],
                  index: index,
                ),
              ),
            )
            .values
            .toList()
      ],
      () => segmentTab,
      (int index) {
        onPressSegment(index);
      },
      duration: const Duration(microseconds: 0),
      allowExpand: true,
      useShadow: false,
      useSeparators: true,
      // innerHorizontalPadding: 4.0,
      // innerVerticalPadding: 4.0,
    );
  }

  Widget _buildTab(
    BuildContext context, {
    required String title,
    required int index,
  }) {
    return Container(
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: segmentTab == index
            ? (selectedColor ?? Theme.of(context).primaryColor)
            : (unSelectedColor ?? Theme.of(context).disabledColor),
        borderRadius: segmentTab == index
            ? BorderRadius.circular(10)
            : (index == (items.length - 1)
                ? const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                : index == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                    : BorderRadius.zero),
        boxShadow: useShadow && segmentTab == index
            ? [
                const BoxShadow(
                  color: Color.fromARGB(36, 0, 0, 0),
                  blurRadius: 22.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    9.0, // Move to bottom 10 Vertically
                  ),
                )
              ]
            : [],
      ),
      child: Center(
        child: Text(
          title,
          style: segmentTab == index
              ? selectedTextStyle ?? Theme.of(context).textTheme.bodyText1
              : unSelectedTextStyle ?? Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    final padding = _getPadding();
    final height = segmentHeight + padding.top + padding.bottom;
    return Size.fromHeight(height);
  }

  EdgeInsets _getPadding() => EdgeInsets.fromLTRB(
        DesignHorizontalMargin.margin,
        topPadding,
        DesignHorizontalMargin.margin,
        bottomPadding,
      );
}

// class SegmentCubit extends Cubit<SegmentState> {
//   SegmentCubit()
//       : super(
//           SegmentState.initial(
//             selectedTab: 0,
//           ),
//         );

//   void onTabSelected(int index) {
//     emit(state.copyWith(selectedTab: index));
//   }
// }

// class SegmentState {
//   final int selectedTab;

//   SegmentState({
//     this.selectedTab = 0,
//   });

//   SegmentState copyWith({
//     int? selectedTab,
//   }) {
//     return SegmentState(
//       selectedTab: selectedTab ?? this.selectedTab,
//     );
//   }

//   factory SegmentState.initial({
//     required int selectedTab,
//   }) {
//     return SegmentState(
//       selectedTab: selectedTab,
//     );
//   }
// }
