import 'dart:convert';
import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:books_app/core/model/book.dart';
import 'package:books_app/core/service/book_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/localization/app_string.dart';
import 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
  static WishListCubit? wishListCubit;

  static final Lock lock = Lock();

  List<Book> favouriteBooks = [];

  static WishListCubit get(context) {
    if (wishListCubit == null) {
      lock.synchronized(() {
        wishListCubit ??= BlocProvider.of(context);
      });
    }
    return wishListCubit!;
  }

  void loadAllFavouriteBooks() {
    BookService.loadWishList().then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data['data']['data']) {
          favouriteBooks.add(Book.fromJson(item));
        }
        emit(SucceedLoadWishList());
      } else {}
    }).catchError(
      (error) {},
    );
  }

  void addToCart({required int index}) {
    BookService.addTocart(id: favouriteBooks[index].id!).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        ShowToast.showMessage(
          message: AppString.addToCartSucess,
          color: Colors.green,
        );
      } else {
        _faild();
      }
    }).catchError((error) {
      _faild();
    });
  }

  void removeFromWishList(int index) async {
    Book book = favouriteBooks[index];
    await BookService.removeFromWishList(id: book.id!).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        favouriteBooks.removeAt(index);
        emit(SucceedLoadWishList());
      } else {
        _faild();
      }
    }).catchError((error) {
      _faild();
    });
  }

  void _faild() {
    ShowToast.showMessage(message: AppString.errorMessage, color: Colors.red);
  }
}