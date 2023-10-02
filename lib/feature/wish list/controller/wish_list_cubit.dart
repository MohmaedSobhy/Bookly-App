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
    print("ehllo");
    BookService.loadWishList().then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data['data']['data']) {
          favouriteBooks.add(Book.fromJson(item));
        }
        print(favouriteBooks.length);
      } else {}
    }).catchError(
      (error) {},
    );
  }

  void removeFromWishList(int index) {
    Book book = favouriteBooks[index];
    BookService.removeFromWishList(id: book.id!).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        favouriteBooks.removeAt(index);
        emit(SuccefullyRemoveFromWishList());
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
