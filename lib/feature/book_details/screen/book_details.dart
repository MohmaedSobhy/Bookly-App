import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/feature/book_details/controller/book_details_cubit.dart';
import 'package:books_app/feature/book_details/controller/book_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/model/book.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/sized_box_high.dart';
import '../views/row_discount_view.dart';
import '../views/sliver_app_bar.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => BookDetailsCubit(),
        child: Scaffold(
          body: BlocConsumer<BookDetailsCubit, BookDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  CustomeSliverAppBar(
                    imageUrl: book.image ?? "",
                    name: book.name ?? " ",
                    addtoFavourite: () {
                      BookDetailsCubit.get(context).addToWishList(
                        bookId: book.id ?? 1,
                      );
                    },
                    favouriteIcon: const Icon(
                      Icons.favorite_outline_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * 0.02,
                            vertical: MediaQuery.sizeOf(context).height * 0.01,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.name ?? " ",
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                  color: AppColor.darkBlue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBoxHight(),
                              RowDiscountView(
                                book: book,
                              ),
                              const SizedBoxHight(),
                              Text(
                                book.description ?? " ",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBoxHight(),
                              CustomButton(
                                onTap: () {
                                  BookDetailsCubit.get(context).addToCart(
                                    bookId: book.id ?? 1,
                                  );
                                },
                                title: AppString.addtoCart,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
