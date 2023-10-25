import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/core/widgets/text_field.dart';
import 'package:books_app/feature/contact_us/controller/contact_us_cubit.dart';
import 'package:books_app/feature/contact_us/controller/contact_us_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ContactUsCubit.getInstanse(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.darkBlue,
            ),
          ),
          title: const Text(
            AppString.contactUs,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).height * 0.01,
          ),
          child: BlocConsumer<ContactUsCubit, ContactUsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Form(
                key: ContactUsCubit.getInstanse().formkey,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          CustomeTextFormField(
                            controller: ContactUsCubit.getInstanse().subject,
                            hint: AppString.subject,
                            textInputType: TextInputType.text,
                            onValidate: (value) {
                              if (value.toString().isEmpty) {
                                return AppString.subject;
                              }
                              return null;
                            },
                          ),
                          const SizedBoxHight(),
                          CustomeTextFormField(
                            textInputType: TextInputType.text,
                            maxLines: 8,
                            controller: ContactUsCubit.getInstanse().message,
                            hint: AppString.message,
                            onValidate: (value) {
                              if (value.toString().isEmpty) {
                                return AppString.message;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      title: AppString.send,
                      onTap: () {
                        if (ContactUsCubit.getInstanse()
                            .formkey
                            .currentState!
                            .validate()) {
                          ContactUsCubit.getInstanse().sendMessageFeedBac();
                        }
                      },
                      width: double.infinity,
                      backGroundColor: AppColor.darkBlue,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
