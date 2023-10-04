import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';

import '../../../core/service/book_service.dart';
import '../../cart/model/book_cart_item.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  List<BookCart> books = [];

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  OrderCubit() : super(OrderInitial());

  static OrderCubit? orderCubit;
  static final Lock _lock = Lock();
  List<String> cities = [];
  List<int> citiresId = [];
  String selectedItem = "", email = "", phone = "";

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
    await Future.wait([loadCities(), loadBooks(), userFields()]);
    if (cities.isNotEmpty) {
      selectedItem = cities[0];
      emit(SussessLoadData());
    }
  }

  Future<void> userFields() async {
    await StorageHelper.getValue(key: APIKey.name).then((userName) {
      name.text = userName;
    });
    await StorageHelper.getValue(key: APIKey.email).then((email) {
      this.email = email;
    });
    await StorageHelper.getValue(key: APIKey.name).then((phone) {
      this.phone = phone;
    });
  }

  Future<void> loadCities() async {
    await APIManager.getMethod(baseUrl: EndPoints.governorates)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data['data']) {
          cities.add(item['governorate_name_en']);
          citiresId.add(item['id']);
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

  void sendOrder() async {
    String token = "";
    print("send");
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    int id = getCityId();
    APIManager.postMethod(baseUrl: EndPoints.sendOrder, token: token, body: {
      APIKey.name: name.text,
      APIKey.email: email,
      APIKey.phone: phone,
      APIKey.address: address.text.toString(),
      APIKey.governorateId: "$id",
    }).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
      } else {
        print(response.body);
      }
    });
  }

  int getCityId() {
    return citiresId[cities.indexOf(selectedItem)];
  }
}
