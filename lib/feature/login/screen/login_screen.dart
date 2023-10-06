import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/widgets/cricle_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
      child: BlocProvider.value(
        value: LoginCubit.getInstanse(),
        child: Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Get.offAllNamed(RoutesName.homelayout);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: LoginCubit.getInstanse().loading,
                progressIndicator: const CircleLoading(),
                child: Form(
                  key: LoginCubit.getInstanse().formkey,
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
                          controller: LoginCubit.getInstanse().email,
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
                          controller: LoginCubit.getInstanse().password,
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
                            if (LoginCubit.getInstanse()
                                .formkey
                                .currentState!
                                .validate()) {
                              LoginCubit.getInstanse().loginMethod();
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
