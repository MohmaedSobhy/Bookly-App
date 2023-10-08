import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/book_item.dart';
import 'package:books_app/feature/category/controller/category_cubit.dart';
import 'package:books_app/feature/category/controller/category_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/model/category_model.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: BlocProvider.value(
        value: CategoryCubit.getInstanse(),
        child: BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return BookItem(
                  addToCart: () {},
                  book: CategoryCubit.getInstanse().books[index],
                  onTap: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
