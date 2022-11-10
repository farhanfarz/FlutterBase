import 'design.dart';

class DesignTitleSubtitle extends StatelessWidget {
  const DesignTitleSubtitle({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontSize: 18.0,
              ),
        ),
        SizedBox(
          height: 15.0.h,
        ),
        Text(
          subtitle ?? '',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.black.withOpacity(0.7),
              ),
        ),
      ],
    );
  }
}
