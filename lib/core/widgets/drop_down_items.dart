import 'package:books_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeDropDownItmes extends StatelessWidget {
  String label;
  String selectedItem;
  List<String> options;
  IconData? prefixIcon;
  // ignore: prefer_typing_uninitialized_variables
  var validator, onChange;
  CustomeDropDownItmes({
    super.key,
    required this.label,
    required this.options,
    required this.selectedItem,
    required this.validator,
    required this.onChange,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      onChanged: onChange,
      validator: validator,
      iconDisabledColor: Theme.of(context).primaryColor,
      iconEnabledColor: Theme.of(context).primaryColor,
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).primaryColor,
        ),
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: AppColor.mainColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: AppColor.mainColor),
        ),
      ),
    );
  }
}
