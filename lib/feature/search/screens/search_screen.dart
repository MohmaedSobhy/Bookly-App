import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/book_item.dart';
import 'package:books_app/core/widgets/cricle_progress_indicator.dart';
import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:books_app/feature/search/view/filteration_view.dart';
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
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).height * 0.03,
          ),
          child: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SearchInitial) {
                SearchCubit.getInstanse(context)
                  ..initlalLoadAllBooks()
                  ..loadCatgory();
              }
              if (state is LoadingResultes) {
                return const CircleLoading();
              }
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SearchTextField(
                          controller: SearchCubit.getInstanse(context)
                              .textEditingController,
                          onChange: (value) {
                            SearchCubit.getInstanse(context)
                                .searchinBooks(value: value);
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return const FilterationView();
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.filter_list,
                          color: AppColor.darkBlue,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: NotificationListener(
                      onNotification: (notify) {
                        if (notify is ScrollEndNotification &&
                            SearchCubit.getInstanse(context)
                                    .scrollController
                                    .position
                                    .extentAfter ==
                                0) {
                          SearchCubit.getInstanse(context)
                              .loadBooksFromNextPage();
                        }
                        return false;
                      },
                      child: ListView.builder(
                        controller:
                            SearchCubit.getInstanse(context).scrollController,
                        itemCount:
                            SearchCubit.getInstanse(context).selected.length +
                                1,
                        itemBuilder: (context, index) {
                          if (index ==
                              SearchCubit.getInstanse(context)
                                  .selected
                                  .length) {
                            if (SearchCubit.getInstanse(context).endPage) {
                              return const NoMoreBooks();
                            } else {
                              return const CircleLoading();
                            }
                          }
                          return BookItem(
                            addToCart: () {
                              SearchCubit.getInstanse(context)
                                  .addToCart(index: index);
                            },
                            onTap: () {
                              Get.toNamed(RoutesName.bookDetails,
                                  arguments: SearchCubit.getInstanse(context)
                                      .selected[index]);
                            },
                            book: SearchCubit.getInstanse(context)
                                .selected[index],
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
    );
  }
}
