import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/feature/cart/controller/cart_cubit.dart';
import 'package:books_app/feature/cart/controller/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/routes/route_name.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/sized_box_high.dart';
import '../widgets/book_item_cart.dart';

class CartListItemsView extends StatelessWidget {
  const CartListItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppString.totalPrice,
                  style: TextStyle(
                    color: AppColor.darkBlue,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "\$${CartCubit.getInstanse().totalPrice}",
                  style: const TextStyle(
                    color: AppColor.darkBlue,
                    fontSize: 25,
                  ),
                )
              ],
            ),
            const SizedBoxHight(),
            Expanded(
              child: ListView.builder(
                itemCount: CartCubit.getInstanse().books.length,
                itemBuilder: (context, index) {
                  return BookCartItem(
                    quantity:
                        CartCubit.getInstanse().books[index].itemQuantity!,
                    book: CartCubit.getInstanse().books[index],
                    onDelete: () {
                      CartCubit.getInstanse().deleteItem(index: index);
                    },
                    increment: () {
                      CartCubit.getInstanse().incrmantBookQuantity(index);
                    },
                    decrement: () {
                      CartCubit.getInstanse().decremantBookQuantity(index);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height * 0.01,
              ),
              child: CustomButton(
                onTap: () {
                  Get.offNamed(RoutesName.sendOrder);
                },
                title: AppString.checkOut,
                width: double.infinity,
                backGroundColor: AppColor.darkBlue,
              ),
            )
          ],
        );
      },
    );
  }
}
