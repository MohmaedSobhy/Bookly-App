import 'package:books_app/feature/cart/controller/cart_cubit.dart';
import 'package:books_app/feature/cart/controller/cart_state.dart';
import 'package:books_app/feature/cart/views/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../core/widgets/no_internet_conection.dart';
import '../views/cart_list_items.dart';
import '../views/loading_cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: CartCubit.getInstanse()..loadCartItems(),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.02,
              right: MediaQuery.sizeOf(context).width * 0.02,
              top: MediaQuery.sizeOf(context).height * 0.05,
            ),
            child: OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                return (connectivity != ConnectivityResult.none)
                    ? const CartView()
                    : const NoInternetConnectionWidget();
              },
              child: const CartView(),
            ),
          ),
        ),
      ),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingCartItems) {
          return const LoadingCartItemsView();
        }
        if (CartCubit.getInstanse().books.isEmpty) {
          return const EmptyCartView();
        }
        return const CartListItemsView();
      },
    );
  }
}
