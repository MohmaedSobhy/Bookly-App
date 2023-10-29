import 'package:books_app/feature/update_password/controller/update_passwrod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/sized_box_high.dart';
import '../../../core/widgets/text_field.dart';

class UpdatePasswordBody extends StatelessWidget {
  const UpdatePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: UpdatePasswordCubit.get(),
      child: Form(
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
  }
}
