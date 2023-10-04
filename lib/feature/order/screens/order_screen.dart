import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/drop_down_items.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/core/widgets/text_field.dart';
import 'package:books_app/feature/order/controller/order_cubit.dart';
import 'package:books_app/feature/order/controller/order_state.dart';
import 'package:books_app/feature/order/views/success_send_order.dart';
import 'package:books_app/feature/order/widgets/receipt_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/widgets/cricle_progress_indicator.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: OrderCubit.get()..loadData(),
      child: SafeArea(
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
              AppString.yourReceipt,
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
              vertical: MediaQuery.sizeOf(context).height * 0.02,
            ),
            child: BlocConsumer<OrderCubit, OrderState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadingData || state is OrderInitial) {
                  return const CircleLoading();
                }
                if (state is SucessSendOrder) {
                  return const SuccessSendOrderView();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          const SizedBoxHight(),
                          CustomeTextFormField(
                            controller: TextEditingController(),
                            hint: AppString.name,
                            textInputType: TextInputType.text,
                            readOnly: true,
                          ),
                          const SizedBoxHight(),
                          CustomeTextFormField(
                            controller: TextEditingController(),
                            hint: AppString.phone,
                            textInputType: TextInputType.phone,
                            onValidate: (value) {},
                          ),
                          const SizedBoxHight(),
                          CustomeTextFormField(
                            controller: TextEditingController(),
                            hint: AppString.address,
                            textInputType: TextInputType.text,
                            onValidate: (value) {},
                          ),
                          const SizedBoxHight(),
                          CustomeDropDownItmes(
                            label: "City",
                            options: OrderCubit.get().cities,
                            selectedItem: OrderCubit.get().selectedItem,
                            validator: (value) {},
                            onChange: (value) {
                              OrderCubit.get().selectedItem = value as String;
                            },
                          ),
                          const SizedBoxHight(),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: OrderCubit.get().books.length,
                            itemBuilder: (_, index) {
                              return ReceiptItem(
                                bookCart: OrderCubit.get().books[index],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () {},
                      width: double.infinity,
                      title: AppString.yourReceipt,
                    )
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
