import 'dart:convert';

import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/core/model/book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<Book> books = [];
  List<Book> selected = [];
  SearchCubit() : super(SearchInitial());

  static SearchCubit? searchCubit;
  static final Lock lock = Lock();

  static SearchCubit get(context) {
    if (searchCubit == null) {
      lock.synchronized(() {
        searchCubit ??= BlocProvider.of(context);
      });
    }
    return searchCubit!;
  }

  void allBooks() {
    print(EndPoints.allBooks);
    APIManager.getMethod(baseUrl: EndPoints.allBooks).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        for (var item in json[APIKey.data][APIKey.products]) {
          books.add(Book.fromJson(item));
          selected.add(Book.fromJson(item));
        }
        print('all books');
      } else {
        print(response.body);
        FailedGetResultes();
      }
    }).catchError((error) {
      FailedGetResultes();
    });
  }

  void searchinBooks({required String value}) {
    selected.clear();
    for (Book book in books) {
      if (book.name!.toLowerCase().startsWith(value)) {
        selected.add(book);
      }
    }
    emit(SucceedGetResultes());
  }
}
