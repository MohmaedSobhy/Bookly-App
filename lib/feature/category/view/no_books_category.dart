import 'package:books_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/app_string.dart';

class NoBooksToCategory extends StatelessWidget {
  const NoBooksToCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppString.noAvailableBooks,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.darkBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            const Image(
              image: AssetImage("images/book.png"),
            ),
          ],
        ),
      ),
    );
  }
}
