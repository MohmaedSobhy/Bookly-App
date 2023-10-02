import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/widgets/book_item.dart';
import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SearchCubit(),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.02,
              vertical: MediaQuery.sizeOf(context).height * 0.03,
            ),
            child: BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (SearchCubit.get(context).books.isEmpty) {
                  SearchCubit.get(context).allBooks();
                  print("hello");
                }
                return Column(
                  children: [
                    SearchTextField(
                      controller: TextEditingController(),
                      onChange: (value) {
                        SearchCubit.get(context).searchinBooks(value: value);
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: SearchCubit.get(context).selected.length,
                        itemBuilder: (context, index) {
                          return BookItem(
                            addToCart: () {},
                            onTap: () {
                              Get.toNamed(RoutesName.bookDetails,
                                  arguments:
                                      SearchCubit.get(context).books[index]);
                            },
                            addToFavourite: () {},
                            favouriteIcon:
                                const Icon(Icons.favorite_border_outlined),
                            book: SearchCubit.get(context).books[index],
                          );
                        },
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
