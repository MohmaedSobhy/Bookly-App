import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.shopping_cart,
            color: AppColor.darkBlue,
            size: 100,
          ),
        ),
        SizedBoxHight(),
        Text(
          AppString.addBookstoCart,
          style: TextStyle(
            color: AppColor.darkBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
