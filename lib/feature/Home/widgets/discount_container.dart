import 'package:books_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class DiscountBox extends StatelessWidget {
  final dynamic discount;
  const DiscountBox({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        height: 30,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Text(
          "$discount%",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColor.darkBlue,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
