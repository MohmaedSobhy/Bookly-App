import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';

import '../../../core/service/book_service.dart';
import '../../cart/model/book_cart_item.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  List<BookCart> books = [];
  TextEditingController phoneController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();

  OrderCubit() : super(OrderInitial());

  static OrderCubit? orderCubit;
  static final Lock _lock = Lock();
  List<String> cities = [];
  String selectedItem = "";

  static OrderCubit get() {
    if (orderCubit == null) {
      _lock.synchronized(() {
        orderCubit ??= OrderCubit();
      });
    }
    return orderCubit!;
  }

  void loadData() async {
    books.clear();
    cities.clear();
    emit(LoadingData());
    await Future.wait([loadCities()]);
    if (cities.isNotEmpty) {
      selectedItem = cities[0];
      emit(SussessLoadData());
    }
  }

  void userFields() {}

  Future<void> loadCities() async {
    await APIManager.getMethod(baseUrl: EndPoints.governorates)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data['data']) {
          cities.add(item['governorate_name_en']);
        }
        emit(LoadingData());
      }
    }).catchError((error) {});
  }

  Future<void> loadBooks() async {
    books.clear();
    await BookService.loadAllCartBooks().then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data['data']['cart_items']) {
          books.add(BookCart.fromJson(item));
        }
      }
    }).catchError((error) {});
  }
}
