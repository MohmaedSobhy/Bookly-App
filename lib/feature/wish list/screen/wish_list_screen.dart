import 'package:books_app/core/widgets/book_item.dart';
import 'package:books_app/feature/wish%20list/controller/wish_list_cubit.dart';
import 'package:books_app/feature/wish%20list/controller/wish_list_state.dart';
import 'package:books_app/feature/wish%20list/views/no_books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..loadAllFavouriteBooks(),
      child: BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (WishListCubit.get(context).favouriteBooks.isEmpty) {
            return const NoBooksViews();
          }
          return Column(
            children: [
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
                      addToCart: () {},
                      onTap: () {},
                      addToFavourite: () {},
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
          );
        },
      ),
    );
  }
}
