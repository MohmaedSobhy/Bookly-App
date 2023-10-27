import 'package:books_app/core/shimmer/shimmer_books_items.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/cart/controller/cart_cubit.dart';
import 'package:books_app/feature/cart/controller/cart_state.dart';
import 'package:books_app/feature/cart/views/empty_cart.dart';
import 'package:books_app/feature/cart/widgets/book_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/routes/route_name.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: CartCubit.getInstanse()..loadCartItems(),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.02,
              right: MediaQuery.sizeOf(context).width * 0.02,
              top: MediaQuery.sizeOf(context).height * 0.05,
            ),
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadingCartItems) {
                  return const ShimmerBooksItmes();
                }
                if (CartCubit.getInstanse().books.isEmpty) {
                  return const EmptyCartView();
                }
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
                            quantity: CartCubit.getInstanse()
                                .books[index]
                                .itemQuantity!,
                            book: CartCubit.getInstanse().books[index],
                            onDelete: () {
                              CartCubit.getInstanse().deleteItem(index: index);
                            },
                            increment: () {
                              CartCubit.getInstanse()
                                  .incrmantBookQuantity(index);
                            },
                            decrement: () {
                              CartCubit.getInstanse()
                                  .decremantBookQuantity(index);
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
            ),
          ),
        ),
      ),
    );
  }
}
