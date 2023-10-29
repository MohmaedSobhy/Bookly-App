import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/feature/category/view/category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/model/category_model.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          category.name,
          style: const TextStyle(
            color: AppColor.darkBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.darkBlue,
          ),
        ),
      ),
      body: CategoryViewItems(id: category.id),
    );
  }
}
