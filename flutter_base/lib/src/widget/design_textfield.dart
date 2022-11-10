import 'design.dart';

class DesignTextfield extends StatefulWidget {
  DesignTextfield({
    this.autofocus = false,
    this.labelText = '',
    this.errorText = '',
    this.hintText = '',
    this.descriptionText = '',
    this.actionText = '',
    this.action,
    this.inputType,
    this.maxLines,
    this.hideInputText = false,
    this.borderColor,
    this.fillColor,
    this.controller,
    this.onTextChanged,
    this.onEditingChange,
    this.validator,
    this.enableIconPath = '',
    this.disableIconPath = '',
    this.iconColor,
    this.hasBorder = true,
    this.borderRadius = 10,
    this.titleStyle,
    this.errorStyle,
    this.fieldStyle,
    this.paddingLabelTextfield = const EdgeInsets.only(bottom: 4),
    this.textCapitalization = TextCapitalization.none,
    Key? key,
  }) : super(key: key);

  final bool autofocus;
  final String labelText;
  final EdgeInsets paddingLabelTextfield;
  final TextStyle? titleStyle;
  final TextStyle? errorStyle;
  final TextStyle? fieldStyle;
  final String errorText;
  final String hintText;
  final TextInputType? inputType;
  bool hideInputText;
  final Color? borderColor;
  final Color? fillColor;
  final int? maxLines;
  final TextEditingController? controller;
  final Function(String)? onTextChanged;
  final Function(bool)? onEditingChange;

  final String descriptionText;
  final String actionText;
  final VoidCallback? action;
  final FormFieldValidator<String>? validator;
  final String enableIconPath;
  final String disableIconPath;
  final Color? iconColor;
  final bool hasBorder;
  final double borderRadius;
  final TextCapitalization textCapitalization;

  @override
  State<StatefulWidget> createState() {
    return DesignTextfieldState();
  }
}

class DesignTextfieldState extends State<DesignTextfield> {
  late FocusNode _focusNode;

  bool _isObscureActive = false;
  final GlobalKey<FormFieldState<String>> _searchFormKey =
      GlobalKey<FormFieldState<String>>();
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _isObscureActive = widget.hideInputText;
    _focusNode.addListener(() {
      widget.onEditingChange?.call(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) _createTopText(context),
        _createTextfield(context),
      ],
    );
  }

  Widget _createTextfield(BuildContext context) {
    return TextFormField(
      key: _searchFormKey,
      style: widget.fieldStyle ?? Theme.of(context).textTheme.bodyText1,
      autocorrect: false,

      // validator: widget.validator,
      decoration: InputDecoration(
          filled: true,
          hintText: widget.hintText,
          fillColor: widget.fillColor ?? Colors.transparent,
          enabledBorder: widget.borderColor != null
              ? _createInputBorder(
                  color: widget.borderColor ?? Color(0xFFEBEDEF),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
          border: widget.borderColor != null
              ? _createInputBorder(
                  color: widget.borderColor ?? Color(0xFFEBEDEF),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
          focusedBorder: widget.borderColor != null
              ? _createInputBorder(
                  color: widget.borderColor ?? Color(0xFFEBEDEF),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
          errorText: widget.errorText,
          errorStyle: widget.errorStyle ?? TextStyle(height: 0),
          isDense: true,
          suffixIconConstraints: BoxConstraints(
            minWidth: 3,
            minHeight: 3,
          ),
          suffixIcon: widget.hideInputText
              ? IconButton(
                  icon: _isObscureActive
                      ? SvgPicture.asset(
                          widget.enableIconPath,
                          // width: 19.5,
                          // height: 13,
                          // color: widget.borderColor ??
                          //     Color(0XFF1E2328).withOpacity(0.5),
                        )
                      : SvgPicture.asset(
                          widget.disableIconPath,
                          // width: 19.5,
                          // height: 13,
                          // color: widget.borderColor ??
                          //     Color(0XFF1E2328).withOpacity(0.5),
                        ),
                  onPressed: () => setState(() {
                    _isObscureActive = !_isObscureActive;
                  }),
                )
              : null),
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      keyboardType: widget.inputType,
      obscureText: _isObscureActive,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
      minLines: 1,
      onChanged: widget.onTextChanged,
      textCapitalization: widget.textCapitalization,
      // onEditingComplete: () {
      //   print('someeee');
      // },
      onFieldSubmitted: (text) {
        print('endme');
      },
    );
  }

  Widget _createTopText(BuildContext context) {
    return Padding(
      padding: widget.paddingLabelTextfield,
      child: Text(
        widget.labelText,
        style: widget.titleStyle ?? Theme.of(context).textTheme.caption,
      ),
    );
  }

  OutlineInputBorder _createInputBorder({
    Color color = Colors.black,
  }) {
    return !widget.hasBorder
        ? OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.borderRadius))
        : OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? color,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius));
  }
}
