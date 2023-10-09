import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/core/widgets/text_field.dart';
import 'package:books_app/feature/forget%20password/controller/forget_password_cubit.dart';
import 'package:books_app/feature/forget%20password/controller/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/localization/app_string.dart';

class ForgetPassWordScreen extends StatelessWidget {
  const ForgetPassWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: ForgetPasswordCubit.getInstanse(),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is SucessSendingCode) {
                  Get.offAllNamed(RoutesName.ottp);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: ForgetPasswordCubit.getInstanse().loading,
                  child: Form(
                    key: ForgetPasswordCubit.getInstanse().formkey,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.02,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: AppColor.darkBlue,
                                  ),
                                ),
                              ),
                              const SizedBoxHight(),
                              Container(
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "images/forget_password.png"),
                                  ),
                                ),
                              ),
                              const SizedBoxHight(),
                              const Text(
                                AppString.resetPassword,
                                style: TextStyle(
                                  color: AppColor.darkBlue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBoxHight(),
                              const Text(
                                AppString.resetPasswordInstruction,
                                style: TextStyle(
                                  color: AppColor.darkBlue,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBoxHight(),
                              const SizedBoxHight(),
                              CustomeTextFormField(
                                controller: ForgetPasswordCubit.getInstanse()
                                    .emailController,
                                hint: AppString.email,
                                textInputType: TextInputType.emailAddress,
                                onValidate: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Enter your Email";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBoxHight(),
                            ],
                          ),
                        ),
                        CustomButton(
                          onTap: () {
                            if (ForgetPasswordCubit.getInstanse()
                                .formkey
                                .currentState!
                                .validate()) {
                              ForgetPasswordCubit.getInstanse()
                                  .resetingPassword();
                            }
                          },
                          title: AppString.requestPasswordReset,
                          backGroundColor: AppColor.darkBlue,
                          width: double.infinity,
                        ),
                        const SizedBoxHight(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
