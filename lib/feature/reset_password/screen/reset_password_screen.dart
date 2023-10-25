import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/core/widgets/text_field.dart';
import 'package:books_app/feature/reset_password/controller/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ResetPasswordCubit.getInstanse(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            AppString.resetPassword,
            style: TextStyle(
              color: AppColor.darkBlue,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: ResetPasswordCubit.getInstanse().formkey,
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
          ),
        ),
      ),
    );
  }
}
