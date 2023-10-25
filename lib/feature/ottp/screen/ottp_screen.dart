import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/sized_box_high.dart';
import '../controller/ottp_cubit.dart';
import '../controller/ottp_state.dart';
import '../views/pin_text_field.dart';
import '../views/verfication_image_view.dart';

class OttpScreen extends StatelessWidget {
  const OttpScreen({super.key});

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
              listener: (context, state) {},
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
                    PinTextField(
                      controller: OttpCubit.getInstanse().pinController,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    CustomButton(
                      onTap: () {},
                      title: AppString.verfiyEmail,
                    ),
                    const SizedBoxHight(),
                    CustomButton(
                      onTap: () {
                        OttpCubit.getInstanse().checkOttp();
                      },
                      title: AppString.resendCode,
                      backGroundColor: AppColor.darkBlue,
                    ),
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
