import 'dart:convert';
import 'package:books_app/core/service/book_service.dart';
import 'package:books_app/feature/cart/model/book_cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit? cartCubit;
  static final Lock lock = Lock();
  int totalPrice = 0;

  List<BookCart> books = [];

  static CartCubit getInstanse() {
    if (cartCubit == null) {
      lock.synchronized(() {
        cartCubit ??= CartCubit();
      });
    }
    return cartCubit!;
  }

  void loadCartItems() async {
    books.clear();
    totalPrice = 0;
    emit(LoadingCartItems());
    await BookService.loadAllCartBooks().then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data['data']['cart_items']) {
          books.add(BookCart.fromJson(item));
          totalPrice = ((item['item_total']).toInt()) + totalPrice;
        }

        emit(SucessLoadingItems());
      }
    }).catchError((error) {});
  }

  void deleteItem({required int index}) async {
    int id = books[index].itemId!;
    await BookService.removeFromCart(id: id).then((respons) {
      if (respons.statusCode == 200 || respons.statusCode == 201) {
        totalPrice -= books[index].itemTotal!;
        books.removeAt(index);
        emit(BookRemovedSucess());
      }
    }).catchError((error) {});
  }

  void incrmantBookQuantity(int index) {
    _editBookQuantity(index: index, quantity: books[index].itemQuantity! + 1);
  }

  void decremantBookQuantity(int index) {
    if (books[index].itemQuantity! - 1 == 0) {
      deleteItem(index: index);
      return;
    }

    _editBookQuantity(index: index, quantity: books[index].itemQuantity! - 1);
  }

  void _editBookQuantity({required int index, required int quantity}) {
    BookService.updateCart(id: books[index].itemId!, quantiy: quantity)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        books[index].itemQuantity = quantity;
        totalPrice -= books[index].itemTotal!;
        books[index].itemTotal =
            books[index].itemProductPriceAfterDiscount! * quantity;
        totalPrice += books[index].itemTotal!.toInt();

        emit(ItemUpdateSucess());
      }
    }).catchError((error) {});
  }
}
