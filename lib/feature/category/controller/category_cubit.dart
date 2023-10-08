import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/model/book.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/API/end_points.dart';
import '../../../core/helper/show_toast_message.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/service/book_service.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  List<Book> books = [];
  static CategoryCubit? categoryCubit;

  static final Lock lock = Lock();

  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit getInstanse() {
    if (categoryCubit == null) {
      lock.synchronized(() {
        categoryCubit ??= CategoryCubit();
      });
    }
    return categoryCubit!;
  }

  void loadBookesCategory({required int id}) {
    String url = "${EndPoints.categories}$id";
    books.clear();
    emit(LoadingBooks());
    APIManager.getMethod(baseUrl: url).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data[APIKey.data][APIKey.products]) {
          books.add(Book.fromJson(item));
        }

        emit(SucessLoadingBooks());
      } else {
        emit(FailedLoadingBooks());
      }
    }).catchError((error) {
      emit(FailedLoadingBooks());
    });
  }

  void addToCart({required int index}) {
    BookService.addTocart(id: books[index].id!).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        ShowToast.sucuessMessage(
          message: AppString.addToCartSucess,
        );
      } else {
        ShowToast.errorMessage();
      }
    }).catchError((error) {
      ShowToast.errorMessage();
    });
  }
}
