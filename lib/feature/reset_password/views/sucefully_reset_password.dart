import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/sized_box_high.dart';

class SucefullyResetPasswordView extends StatelessWidget {
  const SucefullyResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
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
      ),
    );
  }
}
