import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/widgets/book_item.dart';
import 'package:books_app/core/widgets/cricle_progress_indicator.dart';
import 'package:books_app/feature/category/controller/category_cubit.dart';
import 'package:books_app/feature/category/controller/category_state.dart';
import 'package:books_app/feature/category/view/no_books_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CategoryViewItems extends StatelessWidget {
  final int id;
  const CategoryViewItems({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CategoryCubit.getInstanse()..loadBookesCategory(id: id),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingBooks) {
            return const CircleLoading();
          }
          if (CategoryCubit.getInstanse().books.isEmpty) {
            return const NoBooksToCategory();
          }
          return ListView.builder(
            itemCount: CategoryCubit.getInstanse().books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.01,
                    vertical: MediaQuery.sizeOf(context).height * 0.01),
                child: BookItem(
                  addToCart: () {
                    CategoryCubit.getInstanse().addToCart(index: index);
                  },
                  book: CategoryCubit.getInstanse().books[index],
                  onTap: () {
                    Get.toNamed(RoutesName.bookDetails,
                        arguments: CategoryCubit.getInstanse().books[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
