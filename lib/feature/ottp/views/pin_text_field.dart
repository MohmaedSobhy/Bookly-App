import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/theme/app_color.dart';

class PinTextField extends StatelessWidget {
  final TextEditingController controller;
  const PinTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      controller: controller,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        activeColor: AppColor.darkBlue,
        disabledColor: AppColor.darkBlue,
        inactiveFillColor: Colors.white,
        inactiveColor: AppColor.mainColor.withOpacity(0.5),
        selectedFillColor: Colors.white,
        selectedColor: AppColor.darkBlue,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      enableActiveFill: true,
      onCompleted: (v) {},
      onChanged: (value) {},
    );
  }
}
