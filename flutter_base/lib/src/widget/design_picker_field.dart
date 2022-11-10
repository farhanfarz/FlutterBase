import 'design.dart';

class DesignPickerfield extends StatefulWidget {
  DesignPickerfield({
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
    this.validator,
    this.enableIconPath = '',
    this.disableIconPath = '',
    this.iconColor,
    this.hasBorder = true,
    this.borderRadius = 10,
    this.titleStyle,
    this.errorStyle,
    this.paddingLabelTextfield = const EdgeInsets.only(bottom: 4),
    this.imagePath,
    this.onTapPicker,
    this.isOptional = false,
    Key? key,
  }) : super(key: key);

  final bool autofocus;
  final String labelText;
  final EdgeInsets paddingLabelTextfield;
  final TextStyle? titleStyle;
  final TextStyle? errorStyle;
  final String errorText;
  final String hintText;
  final TextInputType? inputType;
  bool hideInputText;
  final Color? borderColor;
  final Color? fillColor;
  final int? maxLines;
  final TextEditingController? controller;
  final Function(String)? onTextChanged;
  final String descriptionText;
  final String actionText;
  final VoidCallback? action;
  final FormFieldValidator<String>? validator;
  final String enableIconPath;
  final String disableIconPath;
  final Color? iconColor;
  final bool hasBorder;
  final double borderRadius;
  final String? imagePath;
  final VoidCallback? onTapPicker;
  final bool isOptional;

  @override
  State<StatefulWidget> createState() {
    return DesignPickerfieldState();
  }
}

class DesignPickerfieldState extends State<DesignPickerfield> {
  late FocusNode _focusNode;

  bool _isObscureActive = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _isObscureActive = widget.hideInputText;
    _focusNode.addListener(() {
      setState(() {});
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
    return GestureDetector(
      onTap: widget.onTapPicker,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            IgnorePointer(
              child: TextFormField(
                readOnly: true,
                style: Theme.of(context).textTheme.bodyText1,
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
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                          ),
                    border: widget.borderColor != null
                        ? _createInputBorder(
                            color: widget.borderColor ?? Color(0xFFEBEDEF),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                          ),
                    focusedBorder: widget.borderColor != null
                        ? _createInputBorder(
                            color: widget.borderColor ?? Color(0xFFEBEDEF),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                          ),
                    errorText: widget.errorText,
                    errorStyle: widget.errorStyle ?? TextStyle(height: 0),
                    isDense: true,
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 2,
                      minHeight: 2,
                    ),
                    suffixIcon: widget.hideInputText
                        ? IconButton(
                            icon: _isObscureActive
                                ? SvgPicture.asset(
                                    widget.enableIconPath,
                                    width: 19.5,
                                    height: 13,
                                  )
                                : SvgPicture.asset(
                                    widget.disableIconPath,
                                    width: 19.5,
                                    height: 13,
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
              ),
            ),
            Container(
              child: Positioned(
                right: 16,
                top: 16,
                child: SvgPicture.asset(
                  widget.imagePath ?? '',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createTopText(BuildContext context) {
    return Padding(
      padding: widget.paddingLabelTextfield,
      child: !widget.isOptional
          ? Text(
              widget.labelText,
              style: widget.titleStyle ?? Theme.of(context).textTheme.caption,
            )
          : Row(
              children: [
                Text(
                  widget.labelText,
                  style:
                      widget.titleStyle ?? Theme.of(context).textTheme.caption,
                ),
                Text(
                  ' (optional)',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Theme.of(context).dividerColor,
                      ),
                ),
              ],
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
