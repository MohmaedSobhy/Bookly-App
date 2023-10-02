import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/cart/model/book_cart_item.dart';
import 'package:books_app/feature/cart/widgets/book_item_cart.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';

final BookCart book = BookCart(
  itemId: 1,
  itemProductDiscount: 120,
  itemProductImage:
      "https://codingarabic.online/storage/product/g1187MzWBCj9Zlcd4Q4jxty4tLPOAohmx7FYeyPh.jpg",
  itemProductName: "Clean Code",
  itemProductPrice: "300",
  itemProductPriceAfterDiscount: 170,
  itemQuantity: 1,
);

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.02,
            right: MediaQuery.sizeOf(context).width * 0.02,
            top: MediaQuery.sizeOf(context).height * 0.05,
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.totalPrice,
                    style: TextStyle(
                      color: AppColor.darkBlue,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "\$150",
                    style: TextStyle(
                      color: AppColor.darkBlue,
                      fontSize: 25,
                    ),
                  )
                ],
              ),
              const SizedBoxHight(),
              Expanded(
                child: ListView(
                  children: [
                    BookCartItem(
                      book: book,
                      onDelete: () {},
                      increment: () {},
                      decrement: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height * 0.01,
                ),
                child: CustomButton(
                  onTap: () {},
                  title: AppString.checkOut,
                  width: double.infinity,
                  backGroundColor: AppColor.darkBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
