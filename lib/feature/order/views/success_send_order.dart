import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';

class SuccessSendOrderView extends StatelessWidget {
  const SuccessSendOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image(
            image: const AssetImage("images/approved.png"),
            width: MediaQuery.sizeOf(context).width * 0.2,
          ),
        ),
        const SizedBoxHight(),
        const Text(
          AppString.thankYou,
          style: TextStyle(
              color: AppColor.darkBlue,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        const SizedBoxHight(),
        const Text(
          AppString.orderConfirm,
          style: TextStyle(
              color: AppColor.darkBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
