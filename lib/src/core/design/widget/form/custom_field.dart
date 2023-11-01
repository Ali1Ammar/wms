import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wms/src/core/design/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController controller;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final bool obscureText;
  final int? maxLine;
  final int? minLines;
  final Widget? icon;
  final Widget? outerIcon;
  final bool expands;
  final Widget? leading;
  final Color strokeGray;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final TextAlign align;
  final void Function(String)? onChanged;
  final EdgeInsets? contentPadding;
  const CustomTextField({
    super.key,
    this.label,
    required this.controller,
    this.enabled = true,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.textDirection,
    this.hint,
    this.obscureText = false,
    this.maxLine = 1,
    this.minLines,
    this.icon,
    this.expands = false,
    this.leading,
    this.strokeGray = AppColor.greyBorder,
    this.fillColor,
    this.textInputAction = TextInputAction.next,
    this.align = TextAlign.start,
    this.outerIcon,
    this.onChanged,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    // var outlineInputBorder = OutlineInputBorder(
    //     borderSide: BorderSide(color: strokeGray, width: 2),
    //     borderRadius: BorderRadius.circular(AppSpace.radius));

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      textDirection: textDirection,
      textAlign: align,
      enabled: enabled,
      textAlignVertical: TextAlignVertical.top,
      maxLines: expands ? null : maxLine,
      minLines: expands ? null : minLines,
      expands: expands,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.start,
        alignLabelWithHint: true,
        // disabledBorder: outlineInputBorder,
        labelText: label,
        hintText: hint,
        suffixIcon: leading,
        icon: outerIcon,
        fillColor: fillColor,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        filled: true,
        contentPadding: contentPadding,
        isDense: true,
        prefixIcon: icon,
        errorStyle: const TextStyle(height: 0),
        // enabledBorder: outlineInputBorder,
        // border: outlineInputBorder
      ),
    );
  }
}
