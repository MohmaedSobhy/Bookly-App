import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/core/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).height * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              const Center(
                child: Text(
                  AppString.yourReceipt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBoxHight(),
              CustomeTextFormField(
                controller: TextEditingController(),
                hint: AppString.name,
                textInputType: TextInputType.text,
              ),
              const SizedBoxHight(),
              CustomeTextFormField(
                controller: TextEditingController(),
                hint: AppString.name,
                textInputType: TextInputType.text,
              ),
              const SizedBoxHight(),
              CustomeTextFormField(
                controller: TextEditingController(),
                hint: AppString.name,
                textInputType: TextInputType.text,
              ),
              const SizedBoxHight(),
              Expanded(
                child: ListView(
                  children: [],
                ),
              ),
              CustomButton(
                onTap: () {},
                width: double.infinity,
                title: AppString.yourReceipt,
              )
            ],
          ),
        ),
      ),
    );
  }
}
