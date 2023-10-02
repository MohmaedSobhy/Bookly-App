import 'package:books_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';

// ignore: must_be_immutable
class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  // ignore: prefer_typing_uninitialized_variables
  var onChange;

  SearchTextField({
    super.key,
    required this.controller,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextFormField(
        cursorColor: AppColor.darkBlue,
        keyboardType: TextInputType.text,
        controller: controller,
        onChanged: onChange,
        decoration: const InputDecoration(
          hintText: AppString.search,
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.mainColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.darkBlue,
            ),
          ),
        ),
      ),
    );
  }
}
