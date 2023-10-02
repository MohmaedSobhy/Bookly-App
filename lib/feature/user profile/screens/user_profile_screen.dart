import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/sized_box_high.dart';
import '../../../core/widgets/text_field.dart';
import '../widgets/image_profile.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

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
                      readOnly: true,
                    ),
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "Email",
                      textInputType: TextInputType.emailAddress,
                      readOnly: true,
                    ),
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "Phone",
                      textInputType: TextInputType.phone,
                      readOnly: true,
                    ),
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "City",
                      textInputType: TextInputType.text,
                      readOnly: true,
                    ),
                    const SizedBoxHight(),
                    CustomeTextFormField(
                      controller: TextEditingController(),
                      hint: "Address",
                      textInputType: TextInputType.text,
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              CustomButton(
                onTap: () {},
                title: AppString.updateProfile,
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
