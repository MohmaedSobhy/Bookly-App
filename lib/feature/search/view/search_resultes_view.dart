import 'package:books_app/core/shimmer/shimmer_book_item.dart';
import 'package:books_app/core/widgets/book_item.dart';
import 'package:books_app/feature/search/view/no_more_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/routes/route_name.dart';
import '../../../core/theme/app_color.dart';
import '../controller/search_cubit.dart';
import '../widgets/search_text_field.dart';
import 'filteration_view.dart';

class SearchResultesView extends StatelessWidget {
  const SearchResultesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    controller:
                        SearchCubit.getInstanse(context).textEditingController,
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
                        return FilterationView(
                          onTap: () {
                            Get.back();
                            SearchCubit.getInstanse(context).applyFilteration();
                          },
                        );
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
                    SearchCubit.getInstanse(context).loadBooksFromNextPage();
                  }
                  return false;
                },
                child: ListView.builder(
                  controller: SearchCubit.getInstanse(context).scrollController,
                  itemCount:
                      SearchCubit.getInstanse(context).selected.length + 1,
                  itemBuilder: (context, index) {
                    if (index ==
                        SearchCubit.getInstanse(context).selected.length) {
                      if (SearchCubit.getInstanse(context).endPage) {
                        return const NoMoreBooks();
                      } else {
                        return const ShimmerBookItem();
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
                      book: SearchCubit.getInstanse(context).selected[index],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
