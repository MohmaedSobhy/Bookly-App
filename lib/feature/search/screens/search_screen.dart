import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/widgets/book_item.dart';
import 'package:books_app/core/widgets/cricle_progress_indicator.dart';
import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:books_app/feature/search/widgets/no_more_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: SearchCubit.getInstanse()..initlalLoadAllBooks(),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.02,
              vertical: MediaQuery.sizeOf(context).height * 0.03,
            ),
            child: BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadingResultes) {
                  return const CircleLoading();
                }
                return Column(
                  children: [
                    SearchTextField(
                      controller:
                          SearchCubit.getInstanse().textEditingController,
                      onChange: (value) {
                        SearchCubit.getInstanse().searchinBooks(value: value);
                      },
                    ),
                    Expanded(
                      child: NotificationListener(
                        onNotification: (notify) {
                          if (notify is ScrollEndNotification &&
                              SearchCubit.getInstanse()
                                      .scrollController
                                      .position
                                      .extentAfter ==
                                  0) {
                            SearchCubit.getInstanse().loadBooksFromNextPage();
                          }
                          return false;
                        },
                        child: ListView.builder(
                          controller:
                              SearchCubit.getInstanse().scrollController,
                          itemCount:
                              SearchCubit.getInstanse().selected.length + 1,
                          itemBuilder: (context, index) {
                            if (SearchCubit.getInstanse().endPage &&
                                index ==
                                    SearchCubit.getInstanse().selected.length) {
                              return const NoMoreBooks();
                            }
                            if (index ==
                                SearchCubit.getInstanse().selected.length) {
                              return const CircleLoading();
                            }
                            return BookItem(
                              addToCart: () {
                                SearchCubit.getInstanse()
                                    .addToCart(index: index);
                              },
                              onTap: () {
                                Get.toNamed(RoutesName.bookDetails,
                                    arguments: SearchCubit.getInstanse()
                                        .selected[index]);
                              },
                              book: SearchCubit.getInstanse().selected[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
