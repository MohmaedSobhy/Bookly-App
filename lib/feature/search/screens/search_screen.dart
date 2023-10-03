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
      child: BlocProvider.value(
        value: SearchCubit.getInstanse()..loadAllBooks(),
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    SearchTextField(
                      controller: TextEditingController(),
                      onChange: (value) {},
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: SearchCubit.getInstanse().selected.length,
                        itemBuilder: (context, index) {
                          return BookItem(
                            addToCart: () {
                              SearchCubit.getInstanse().addToCart(index: index);
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
