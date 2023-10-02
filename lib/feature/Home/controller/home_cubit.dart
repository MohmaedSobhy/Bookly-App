import 'dart:convert';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/feature/Home/model/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/model/book.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Book> bestSaller = [];
  List<Book> newArrival = [];
  List<Category> categories = [];

  HomeCubit() : super(HomeInitial());

  static HomeCubit? homeCubit;
  static final Lock lock = Lock();

  static HomeCubit get(context) {
    if (homeCubit == null) {
      lock.synchronized(() {
        homeCubit ??= BlocProvider.of(context);
      });
    }
    return homeCubit!;
  }

  Future<void> laodData() async {
    emit(LoadData());
    await Future.wait([_loadCatgory(), _loadBestSaller(), _loadNewArrival()]);
    await Future.delayed(const Duration(seconds: 2));
    if (bestSaller.isNotEmpty &&
        categories.isNotEmpty &&
        newArrival.isNotEmpty) {
      emit(SuccessLoadData());
    } else {
      emit(FailedLoadData());
    }
  }

  Future<void> _loadCatgory() async {
    await APIManager.getMethod(baseUrl: EndPoints.allCategories)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data[APIKey.data][APIKey.categories]) {
          categories.add(Category.fromJson(item));
        }
      } else {}
    }).catchError((error) {});
  }

  Future<void> _loadBestSaller() async {
    await APIManager.getMethod(baseUrl: EndPoints.bestSaller).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data[APIKey.data][APIKey.products]) {
          bestSaller.add(Book.fromJson(item));
        }
      }
    }).catchError((error) {});
  }

  Future<void> _loadNewArrival() async {
    await APIManager.getMethod(baseUrl: EndPoints.allArrivales)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data[APIKey.data][APIKey.products]) {
          newArrival.add(Book.fromJson(item));
        }
      }
    }).catchError((error) {});
  }
}
