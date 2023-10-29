import 'package:books_app/feature/wish%20list/controller/wish_list_cubit.dart';
import 'package:books_app/feature/wish%20list/controller/wish_list_state.dart';
import 'package:books_app/feature/wish%20list/views/loading_wish_list_Itmes.dart';
import 'package:books_app/feature/wish%20list/views/no_books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../core/widgets/no_internet_conection.dart';
import '../views/books_item_wish_list.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: WishListCubit.getInstanse()..loadAllFavouriteBooks(),
      child: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          return (connectivity != ConnectivityResult.none)
              ? const WishListView()
              : const NoInternetConnectionWidget();
        },
        child: const WishListView(),
      ),
    );
  }
}

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListCubit, WishListState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadWishList) {
          return const ShimmerLoadingWishListItems();
        }
        if (WishListCubit.getInstanse().favouriteBooks.isEmpty) {
          return const NoBooksViews();
        }
        return const BooksWishListItems();
      },
    );
  }
}
