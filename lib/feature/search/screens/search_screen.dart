import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:books_app/feature/search/view/search_resultes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../core/widgets/no_internet_conection.dart';
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
      child: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          return (connectivity != ConnectivityResult.none)
              ? const SearchView()
              : const NoInternetConnectionWidget();
        },
        child: const SearchView(),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
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
    );
  }
}
