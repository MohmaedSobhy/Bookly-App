import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/widgets/text_field.dart';
import '../controller/contact_us_cubit.dart';
import '../controller/contact_us_state.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.02,
        vertical: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: BlocProvider.value(
        value: ContactUsCubit.getInstanse(),
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
    );
  }
}
