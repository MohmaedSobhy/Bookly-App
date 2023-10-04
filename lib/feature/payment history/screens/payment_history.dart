import 'package:books_app/feature/payment%20history/controller/payment_cubit.dart';
import 'package:books_app/feature/payment%20history/controller/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView();
        },
      ),
    );
  }
}
