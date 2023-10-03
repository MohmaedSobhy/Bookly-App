import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class NoMoreBooks extends StatelessWidget {
  const NoMoreBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppString.noMoreBooks,
        style: TextStyle(
          color: AppColor.darkBlue,
          fontSize: 20,
        ),
      ),
    );
  }
}
