import 'design.dart';

class LeadingIconButton extends StatelessWidget {
  LeadingIconButton({
    required this.buttonOnPress,
    required this.buttonLabel,
    required this.imagePath,
    this.borderColor,
  });
  final Function buttonOnPress;
  final String buttonLabel;
  final String imagePath;
  final Color? borderColor;

  Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20.w,
                height: 20.w,
                child: SvgPicture.asset(
                  'assets/svg/$imagePath.svg',
                ),
              ),
              Expanded(
                // Here your column with texts
                child: Column(
                  children: [
                    Text(
                      buttonLabel,
                      style: Theme.of(context)
                          .outlinedButtonTheme
                          .style
                          ?.textStyle
                          ?.resolve(interactiveStates),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                  color: this.borderColor ?? Colors.transparent, width: 1.0),
            ),
          ),
        ),
        onPressed: () {
          buttonOnPress();
        },
      ),
    );
  }
}
