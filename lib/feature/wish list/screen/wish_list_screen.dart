import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/book_item.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/wish%20list/controller/wish_list_cubit.dart';
import 'package:books_app/feature/wish%20list/controller/wish_list_state.dart';
import 'package:books_app/feature/wish%20list/views/no_books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit(),
      child: BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (WishListCubit.get(context).favouriteBooks.isEmpty) {
            return const NoBooksViews();
          }
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.03,
              left: MediaQuery.sizeOf(context).width * 0.02,
              right: MediaQuery.sizeOf(context).width * 0.02,
            ),
            child: Column(
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
                    itemCount: WishListCubit.get(context).favouriteBooks.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      );
                    },
                    itemBuilder: (_, index) {
                      return BookItem(
                        addToCart: () {
                          WishListCubit.get(context).addToCart(index: index);
                        },
                        onTap: () {
                          Get.toNamed(RoutesName.bookDetails);
                        },
                        favourtieButton: () {
                          WishListCubit.get(context).removeFromWishList(index);
                        },
                        favouriteIcon: const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        ),
                        book: WishListCubit.get(context).favouriteBooks[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
