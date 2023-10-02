import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/app_string.dart';
import '../controller/setting_.state.dart';
import '../controller/setting_cubit.dart';

class ButtonSheetSetting extends StatelessWidget {
  const ButtonSheetSetting({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingCubitState>(
      listener: (context, state) {
        if (state is LogoutState) {}
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: MediaQuery.sizeOf(context).height * 0.007,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.1),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBoxHight(),
              const Text(
                AppString.logout,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBoxHight(),
              CustomButton(
                title: "YES",
                width: double.infinity,
                onTap: () {
                  SettingCubit.get(context).logoutMethod();
                },
                backGroundColor: AppColor.darkBlue,
              ),
              const SizedBoxHight(),
              CustomButton(
                title: "Cancle",
                width: double.infinity,
                onTap: () {
                  Navigator.of(context).pop();
                },
                backGroundColor: AppColor.darkBlue.withOpacity(0.5),
              ),
            ],
          ),
        );
      },
    );
  }
}
