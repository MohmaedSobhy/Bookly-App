import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../controller/update_password_state.dart';
import '../controller/update_passwrod_cubit.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(),
      child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          UpdatePasswordCubit settingScreenCubit =
              UpdatePasswordCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColor.darkBlue,
                ),
              ),
              title: const Text(
                AppString.updatePassword,
                style: TextStyle(
                  color: AppColor.darkBlue,
                ),
              ),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: Form(
              key: settingScreenCubit.formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.02,
                  vertical: MediaQuery.sizeOf(context).height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          CustomeTextFormField(
                            hint: "old password",
                            textInputType: TextInputType.visiblePassword,
                            obscure: true,
                            onValidate: (value) {
                              if (value.toString().isEmpty) {
                                return "Enter old Password";
                              }
                              return null;
                            },
                            controller:
                                settingScreenCubit.oldPasswordController,
                          ),
                          const SizedBoxHight(),
                          CustomeTextFormField(
                            controller:
                                settingScreenCubit.newPasswordController,
                            hint: 'new password',
                            textInputType: TextInputType.visiblePassword,
                            obscure: true,
                            onValidate: (value) {
                              if (value.toString().isEmpty) {
                                return "Enter New Password";
                              }
                              return null;
                            },
                          ),
                          const SizedBoxHight(),
                          CustomeTextFormField(
                            controller: settingScreenCubit
                                .confirmeNewPasswordController,
                            textInputType: TextInputType.visiblePassword,
                            obscure: true,
                            onValidate: (value) {
                              if (value.toString().isEmpty) {
                                return "Enter Confirem Password";
                              }
                              if (value.toString() !=
                                  settingScreenCubit.newPasswordController.text
                                      .toString()) {
                                return "Confirem password should eqaule to password";
                              }
                              return null;
                            },
                            hint: 'confirm password',
                          ),
                        ],
                      ),
                    ),
                    const SizedBoxHight(),
                    CustomButton(
                      title: AppString.apply,
                      backGroundColor: AppColor.darkBlue,
                      width: double.infinity,
                      onTap: () {
                        if (settingScreenCubit.formkey.currentState!
                            .validate()) {
                          settingScreenCubit.updatePassword();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
