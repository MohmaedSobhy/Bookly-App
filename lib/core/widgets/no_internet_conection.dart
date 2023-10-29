import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "images/no-wifi.png",
          height: MediaQuery.sizeOf(context).height * 0.2,
        ),
        const SizedBoxHight(),
        const Text(
          "Check Your Network",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.darkBlue,
          ),
        )
      ],
    );
  }
}
