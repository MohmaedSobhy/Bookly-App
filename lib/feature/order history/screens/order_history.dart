import 'package:books_app/feature/order%20history/controller/order_history_cubit.dart';
import 'package:books_app/feature/order%20history/controller/order_history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: OrderHistoryCubit.getInstanse()..loadHistoryOrders(),
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
            AppString.paymentHistory,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          elevation: 0.0,
        ),
        body: BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
