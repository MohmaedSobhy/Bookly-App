import 'package:books_app/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/app_logo.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/sized_box_high.dart';
import '../../../core/widgets/text_field.dart';
import '../controller/login_cubit.dart';
import '../controller/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                print("heree");
                Get.offAllNamed(RoutesName.homelayout);
              }
            },
            builder: (context, state) {
              return Form(
                key: LoginCubit.get(context).formkey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.03,
                    vertical: MediaQuery.sizeOf(context).height * 0.15,
                  ),
                  child: ListView(
                    children: [
                      const AppLogo(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.10,
                      ),
                      CustomeTextFormField(
                        controller: LoginCubit.get(context).email,
                        hint: AppString.email,
                        textInputType: TextInputType.emailAddress,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter your email";
                          }
                          return null;
                        },
                      ),
                      const SizedBoxHight(),
                      CustomeTextFormField(
                        controller: LoginCubit.get(context).password,
                        hint: AppString.password,
                        textInputType: TextInputType.visiblePassword,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter your Password";
                          }
                          return null;
                        },
                        obscure: true,
                      ),
                      const SizedBoxHight(),
                      CustomButton(
                        onTap: () {
                          if (LoginCubit.get(context)
                              .formkey
                              .currentState!
                              .validate()) {
                            LoginCubit.get(context).loginMethod();
                          }
                        },
                        title: AppString.login,
                      ),
                      const SizedBoxHight(),
                      CustomButton(
                        backGroundColor: AppColor.darkBlue,
                        onTap: () {
                          Get.offAllNamed(RoutesName.signUp);
                        },
                        title: AppString.signUp,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
