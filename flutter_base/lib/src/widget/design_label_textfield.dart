import 'package:flutter/services.dart';
import 'design.dart';

class LabelTextfield extends StatelessWidget {
  final String? labelname;

  final String? text;
  final void Function()? press;
  final Color? color, textColor, borderColor, textfieldColor;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final TextEditingController? controller;
  final bool isDropdown;
  final String? errorMessage;
  final void Function(String)? onChanged;
  final Widget? textField;
  final TextStyle? labelTextstyle;
  final TextStyle? textfieldTextstyle;

  final Widget? accessory;
  final bool autofocus;
  final bool isReadOnly;
  final double rightContentValue;
  final bool isPassword;
  final bool isNumber;
  final int length;
  final String? arrowImage;

  LabelTextfield({
    Key? key,
    this.text,
    this.labelname,
    this.press,
    this.color,
    this.textColor = Colors.white,
    this.textfieldColor = Colors.black,
    this.keyboardType = TextInputType.name,
    this.textAlign = TextAlign.left,
    this.validator,
    this.hintText,
    this.controller,
    this.isDropdown = false,
    this.errorMessage,
    this.onChanged,
    this.accessory,
    this.textField,
    this.inputFormatters,
    this.onSaved,
    this.isReadOnly = false,
    this.autofocus = false,
    this.rightContentValue = 10,
    this.borderColor,
    this.isPassword = false,
    this.isNumber = false,
    this.length = 1,
    this.arrowImage,
    this.labelTextstyle,
    this.textfieldTextstyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget field = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.transparent,
              child: Text(
                labelname ?? '',
                style: labelTextstyle ??
                    Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: color),
              ),
            ),
            Container(
              width: 1.sw / 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child:
                    // textField != null
                    //     ? textField
                    //     : isReadOnly != null
                    //         ? SizedBox(
                    //             // height: 44,
                    //             child: Align(
                    //               alignment: Alignment.centerRight,
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.end,
                    //                 children: [
                    //                   Text(
                    //                     controller?.text ?? '',
                    //                     textAlign: TextAlign.right,
                    //                     style: Theme.of(context)
                    //                         .textTheme
                    //                         .bodyText1
                    //                         ?.copyWith(
                    //                           color: color,
                    //                         ),
                    //                   ),
                    //                   if (accessory != null)
                    //                     Padding(
                    //                       padding:
                    //                           const EdgeInsets.only(left: 11.0),
                    //                       child: accessory,
                    //                     ),
                    //                 ],
                    //               ),
                    //             ),
                    //           )
                    //  :
                    _buildTextField(hintText ?? '', context),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 1.sw,
          height: 1,
          child: Container(color: borderColor),
        ),
      ],
    );

    return SizedBox(
      height: errorMessage != null ? 50 : 50,
      child: isDropdown
          ? Stack(
              children: [
                field,
                Positioned(
                  right: 16,
                  top: 16,
                  child: SvgPicture.asset(
                    arrowImage ?? '',
                  ),
                )
              ],
            )
          : field,
    );
  }

  Widget _buildTextField(
    String hintText,
    BuildContext context,
  ) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        // autofocus: true,
        textDirection: TextDirection.ltr,
        controller: controller,
        textInputAction: TextInputAction.done,
        // enabled: enable,
        // maxLength: length,

        // LengthLimitingTextInputFormatter(length),

        autofocus: autofocus,
        decoration: InputDecoration(
          suffixIcon: accessory,
          suffixIconConstraints: BoxConstraints(
            minHeight: 10,
            minWidth: 10,
          ),
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(bottom: 12, top: 12, right: rightContentValue),
        ),
        obscureText: isPassword,

        keyboardType: keyboardType,
        textAlign: textAlign,
        readOnly: isDropdown,
        onTap: isDropdown ? press : null,

        style: textfieldTextstyle ??
            Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: textfieldColor,
                ),
        validator: validator,

        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onSaved: onSaved,
      ),
    );
  }
}
