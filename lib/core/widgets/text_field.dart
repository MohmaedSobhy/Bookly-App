import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatelessWidget {
  final TextEditingController controller;
  // ignore: prefer_typing_uninitialized_variables
  var onValidate;
  final String hint;
  final bool? readOnly;
  final TextInputType textInputType;
  final int? maxLines;
  final bool? obscure;
  final Widget suffixIcon;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  CustomeTextFormField({
    super.key,
    required this.controller,
    this.onValidate,
    required this.hint,
    required this.textInputType,
    this.readOnly,
    this.maxLines,
    this.obscure,
    this.hintStyle,
    this.labelStyle,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: onValidate,
      maxLines: (maxLines == null) ? 1 : maxLines!,
      readOnly: readOnly == null ? false : readOnly!,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: (obscure == null) ? false : obscure!,
      keyboardType: textInputType,

      // autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        suffix: suffixIcon,
        labelStyle: labelStyle,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
