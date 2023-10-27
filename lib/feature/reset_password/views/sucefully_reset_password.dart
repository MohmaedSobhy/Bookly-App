import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.15,
                ),
                Center(
                  child: Image(
                    image: const AssetImage("images/approved.png"),
                    width: MediaQuery.sizeOf(context).width * 0.2,
                  ),
                ),
                const SizedBoxHight(),
                const Text(
                  AppString.passwordChangeSuccessfullyy,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.darkBlue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBoxHight(),
                const Text(
                  AppString.passwordChange,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.darkBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.01,
              vertical: MediaQuery.sizeOf(context).height * 0.01,
            ),
            child: CustomButton(
              width: double.infinity,
              onTap: () {
                Get.offAllNamed(RoutesName.login);
              },
              title: AppString.done,
            ),
          ),
        ],
      ),
    );
  }
}
