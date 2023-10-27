import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/wish%20list/controller/wish_list_cubit.dart';
import 'package:books_app/feature/wish%20list/controller/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/routes/route_name.dart';
import '../../../core/widgets/book_item.dart';

class BooksWishListItems extends StatelessWidget {
  const BooksWishListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * 0.03,
        left: MediaQuery.sizeOf(context).width * 0.02,
        right: MediaQuery.sizeOf(context).width * 0.02,
      ),
      child: BlocBuilder<WishListCubit, WishListState>(
        builder: (context, state) {
          return Column(
            children: [
              const Text(
                "Wish List",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColor.darkBlue,
                  fontSize: 20,
                ),
              ),
              const SizedBoxHight(),
              Expanded(
                child: ListView.separated(
                  itemCount: WishListCubit.getInstanse().favouriteBooks.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.03,
                    );
                  },
                  itemBuilder: (_, index) {
                    return BookItem(
                      addToCart: () {
                        WishListCubit.getInstanse().addToCart(index: index);
                      },
                      onTap: () {
                        Get.toNamed(RoutesName.bookDetails);
                      },
                      favourtieButton: () {
                        WishListCubit.getInstanse().removeFromWishList(index);
                      },
                      favouriteIcon: const Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      ),
                      book: WishListCubit.getInstanse().favouriteBooks[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
