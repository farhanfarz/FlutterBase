import 'design.dart';

class DesignPageIndicator extends StatelessWidget {
  const DesignPageIndicator({
    Key? key,
    required this.buildContext,
    required this.currentIndex,
  }) : super(key: key);

  final BuildContext buildContext;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return _buildIndicators(buildContext);
  }

  Widget _buildIndicators(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const SizedBox(),
        Container(
          child: Row(
            children: [
              for (int i = 0; i < 3; i++)
                _buildPageIndicator(
                  isCurrentPage: i == currentIndex,
                  context: context,
                ),
            ],
          ),
        ),
        const SizedBox(),
      ],
    );
  }

  Widget _buildPageIndicator({
    required bool isCurrentPage,
    required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 7.w,
      width: 7.w,
      decoration: BoxDecoration(
        color: indicatorColor(
          isCurrentPage: isCurrentPage,
          context: context,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Color indicatorColor({
    required bool isCurrentPage,
    required BuildContext context,
  }) {
    if (isCurrentPage) {
      return Theme.of(context).primaryColor;
    }
    return Theme.of(context).indicatorColor;
  }
}
