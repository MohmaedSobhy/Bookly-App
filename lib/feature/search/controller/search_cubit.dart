import 'dart:convert';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/core/model/book.dart';
import 'package:books_app/core/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/helper/show_toast_message.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/service/book_service.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<Book> books = [];
  List<Book> selected = [];
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  int min = 0, max = 1000;
  RangeValues values = const RangeValues(0, 1000);

  List<Category> categoryies = [];
  SearchCubit() : super(SearchInitial());

  static SearchCubit? searchCubit;
  static final Lock lock = Lock();
  int nextPage = 2;
  bool endPage = false;
  int selectButton = -1;

  static SearchCubit getInstanse(context) {
    if (searchCubit == null) {
      lock.synchronized(() {
        searchCubit ??= BlocProvider.of(context);
      });
    }
    return searchCubit!;
  }

  void initlalLoadAllBooks() async {
    nextPage = 2;
    books.clear();
    selected.clear();
    emit(LoadingResultes());
    await APIManager.getMethod(baseUrl: EndPoints.allBooks).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        for (var item in json[APIKey.data][APIKey.products]) {
          books.add(Book.fromJson(item));
          selected.add(Book.fromJson(item));
        }

        emit(SucceedGetResultes());
      } else {
        FailedGetResultes();
      }
    }).catchError((error) {
      FailedGetResultes();
    });
  }

  void loadBooksFromNextPage() async {
    String url = "${EndPoints.loadBookPages}$nextPage";
    await APIManager.getMethod(baseUrl: url).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        for (var item in json[APIKey.data][APIKey.products]) {
          books.add(Book.fromJson(item));
          selected.add(Book.fromJson(item));
        }
        if (json[APIKey.data][APIKey.products].isEmpty) {
          endPage = true;
        }
        nextPage++;
        emit(SucceedGetResultes());
      } else {
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
    endPage = true;
    emit(SucceedGetResultes());
  }

  void addToCart({required int index}) {
    BookService.addTocart(id: selected[index].id!).then((response) {
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

  void applyFilteration() {
    String url = getUrl();
    print("hello");
    emit(LoadingResultes());
    print(url);
    APIManager.getMethod(baseUrl: url).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        selected.clear();
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data[APIKey.data]['products']) {
          selected.add(Book.fromJson(item));
        }
        print(selected.length);
        emit(SucceedGetResultes());
      }
    }).catchError((error) {});
  }

  Future<void> loadCatgory() async {
    await APIManager.getMethod(baseUrl: EndPoints.allCategories)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data[APIKey.data][APIKey.categories]) {
          categoryies.add(Category.fromJson(item));
        }
      }
    });
  }

  String getUrl() {
    String url = EndPoints.filteration;
    if (selectButton != -1) {
      url = "$url${APIKey.categoryId}=${categoryies[selectButton].id}";
    }
    url = "$url&${APIKey.min}=$min";
    url = "$url&${APIKey.max}=$max";
    return url;
  }

  void changeButtonColor(int index) {
    selectButton = index;
    emit(ChangeButtonColor());
  }

  void bottomSheetPop() {
    selectButton = -1;
    min = 0;
    max = 1000;
    values = const RangeValues(0, 1000);
  }

  void rangeSlider(RangeValues value) {
    min = value.start.toInt();
    max = value.end.toInt();
    values = value;
    emit(RangeSliderState());
  }
}
