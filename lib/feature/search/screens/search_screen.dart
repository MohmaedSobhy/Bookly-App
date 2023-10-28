import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:books_app/feature/search/view/search_resultes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/shimmer_loading_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            return const ShimmerLoadingView();
          }
          if (state is LoadingResultes) {
            return const ShimmerLoadingView();
          }
          return const SearchResultesView();
        },
      ),
    );
  }
}
