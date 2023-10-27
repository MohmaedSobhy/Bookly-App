import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/core/widgets/text_field.dart';
import 'package:books_app/feature/reset_password/controller/reset_password_cubit.dart';
import 'package:books_app/feature/reset_password/controller/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputFailedResetPassword extends StatelessWidget {
  const InputFailedResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Form(
                  key: ResetPasswordCubit.getInstanse().formkey,
                  child: ListView(
                    children: [
                      const SizedBoxHight(),
                      CustomeTextFormField(
                        controller: ResetPasswordCubit.getInstanse().password,
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
                        controller:
                            ResetPasswordCubit.getInstanse().confirmpassword,
                        textInputType: TextInputType.visiblePassword,
                        obscure: true,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter Confirem Password";
                          }
                          return null;
                        },
                        hint: 'confirm password',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBoxHight(),
              CustomButton(
                title: AppString.resetPassword,
                backGroundColor: AppColor.darkBlue,
                width: double.infinity,
                onTap: () {
                  if (ResetPasswordCubit.getInstanse()
                      .formkey
                      .currentState!
                      .validate()) {
                    ResetPasswordCubit.getInstanse().resetUserPassword();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
