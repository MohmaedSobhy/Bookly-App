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
    return BlocProvider.value(
      value: UpdatePasswordCubit.get(),
      child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
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
              key: UpdatePasswordCubit.get().formkey,
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
                                UpdatePasswordCubit.get().oldPasswordController,
                          ),
                          const SizedBoxHight(),
                          CustomeTextFormField(
                            controller:
                                UpdatePasswordCubit.get().newPasswordController,
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
                            controller: UpdatePasswordCubit.get()
                                .confirmeNewPasswordController,
                            textInputType: TextInputType.visiblePassword,
                            obscure: true,
                            onValidate: (value) {
                              if (value.toString().isEmpty) {
                                return "Enter Confirem Password";
                              }
                              if (value.toString() !=
                                  UpdatePasswordCubit.get()
                                      .newPasswordController
                                      .text
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
                        if (UpdatePasswordCubit.get()
                            .formkey
                            .currentState!
                            .validate()) {
                          UpdatePasswordCubit.get().updatePassword();
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
