import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/sized_box_high.dart';
import '../../../core/widgets/text_field.dart';
import '../../user profile/widgets/image_profile.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).height * 0.05,
          ),
          child: Column(
            children: [
              const ImageProfile(),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "Name",
                      textInputType: TextInputType.name,
                      readOnly: false,
                    ),
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "Email",
                      textInputType: TextInputType.emailAddress,
                      readOnly: false,
                    ),
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "Phone",
                      textInputType: TextInputType.phone,
                      readOnly: false,
                    ),
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "City",
                      textInputType: TextInputType.text,
                      readOnly: false,
                    ),
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "Address",
                      textInputType: TextInputType.text,
                      readOnly: false,
                    ),
                  ],
                ),
              ),
              CustomButton(
                onTap: () {},
                title: AppString.update,
                backGroundColor: AppColor.darkBlue,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
