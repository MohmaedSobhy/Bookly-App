import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:books_app/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/sized_box_high.dart';
import '../controller/ottp_cubit.dart';
import '../controller/ottp_state.dart';
import '../views/pin_text_field.dart';
import '../views/verfication_image_view.dart';

// ignore: must_be_immutable
class OttpScreen extends StatelessWidget {
  TextEditingController pinController = TextEditingController();
  OttpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: OttpCubit.getInstanse(),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: BlocConsumer<OttpCubit, OttpState>(
              listener: (context, state) {
                if (state is OttpCodeInvalide) {
                  ShowToast.errorMessage(message: "Check Code");
                }
                if (state is OttpCodeValide) {
                  ShowToast.sucuessMessage(message: "Code Valid");
                  Get.offAllNamed(
                    RoutesName.resetPassword,
                    arguments: pinController.text,
                  );
                  pinController.clear();
                }
              },
              builder: (context, state) {
                return ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    const VerficationImageView(),
                    const SizedBoxHight(),
                    const Text(
                      AppString.verfiyCode,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    PinTextField(controller: pinController),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    CustomButton(
                      onTap: () {
                        OttpCubit.getInstanse().checkOttpCode(
                          code: pinController.text.toString(),
                        );
                      },
                      title: AppString.verfiyEmail,
                    ),
                    const SizedBoxHight(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
