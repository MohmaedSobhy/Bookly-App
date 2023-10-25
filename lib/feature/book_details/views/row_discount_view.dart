import 'package:flutter/material.dart';

import '../../../core/model/book.dart';
import '../../../core/theme/app_color.dart';

class RowDiscountView extends StatelessWidget {
  final Book book;
  const RowDiscountView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          book.category ?? "",
          style: const TextStyle(
            color: AppColor.darkBlue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${book.price}",
              style: const TextStyle(
                  color: AppColor.darkBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  decoration: TextDecoration.lineThrough),
            ),
            Text(
              "\$${book.priceAfterDiscount}",
              style: const TextStyle(
                fontSize: 15,
                color: AppColor.darkBlue,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ],
    );
  }
}
