import 'design.dart';

class DesignVerticalSegment extends StatelessWidget {
  const DesignVerticalSegment({
    Key? key,
    required this.onChanged,
    this.index = 0,
    this.children = const [],
  }) : super(key: key);
  final ValueChanged<int> onChanged;
  final int index;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    final color = Color(0xFF808080);
    final shape = RoundedRectangleBorder(
      side: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8),
    );
    return ClipPath(
      clipper: ShapeBorderClipper(shape: shape),
      child: Container(
        color: Colors.white,
        foregroundDecoration: ShapeDecoration(
          shape: shape,
        ),
        child: IntrinsicWidth(
          child: Column(
            children: [..._buildChildren(context)],
          ),
        ),
      ),
    );
  }

  Iterable<Widget> _buildChildren(BuildContext context) sync* {
    final theme = Theme.of(context);
    final color = Color(0xFF1E2328);
    final textColor = theme.accentTextTheme.button?.color;
    final style1 =
        theme.textTheme.button?.copyWith(color: color.withOpacity(0.7));
    final style2 = theme.textTheme.button?.copyWith(color: textColor);
    final data1 = theme.iconTheme.copyWith(color: color);
    final data2 = theme.iconTheme.copyWith(color: textColor);
    final duration = kThemeAnimationDuration;
    for (int i = 0; i < children.length; i++) {
      if (i > 0) {
        yield Container(
          color: color.withOpacity(0.7),
          height: 1,
        );
      }
      final selected = i == index;
      yield SizedBox(
        height: 44,
        width: 44,
        child: GestureDetector(
          onTap: onChanged != null ? () => onChanged(i) : null,
          child: AnimatedContainer(
            duration: duration,
            color: selected ? Color(0xFF203979) : color.withAlpha(0),
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            child: AnimatedTheme(
              data: theme.copyWith(
                iconTheme: selected ? data2 : data1,
              ),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: selected ? style2! : style1!,
                child: children[i],
              ),
            ),
          ),
        ),
      );
    }
  }
}
