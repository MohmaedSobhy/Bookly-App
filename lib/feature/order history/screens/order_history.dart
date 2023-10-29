import 'package:books_app/core/widgets/cricle_progress_indicator.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/order%20history/controller/order_history_cubit.dart';
import 'package:books_app/feature/order%20history/controller/order_history_state.dart';
import 'package:books_app/feature/order%20history/widgets/order_item.dart';
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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.01,
          ),
          child: BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingHistoryOrders) {
                return const CircleLoading();
              }
              if (state is FaildLoadHistory ||
                  OrderHistoryCubit.getInstanse().orders.isEmpty) {
                return const HistoryEmptyView();
              }
              return ListView.builder(
                itemCount: OrderHistoryCubit.getInstanse().orders.length,
                itemBuilder: (context, index) {
                  return OrderItem(
                    order: OrderHistoryCubit.getInstanse().orders[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class HistoryEmptyView extends StatelessWidget {
  const HistoryEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
          height: MediaQuery.sizeOf(context).height * 0.2,
          image: const AssetImage("images/clock.png"),
        ),
        const SizedBoxHight(),
        const Text(
          AppString.noMoreBooks,
          style: TextStyle(
            color: AppColor.darkBlue,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
