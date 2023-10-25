import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:books_app/core/service/book_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/localization/app_string.dart';
import 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitial());
  static BookDetailsCubit? bookDetailsCubit;
  static final Lock _lock = Lock();

  static BookDetailsCubit get(context) {
    if (bookDetailsCubit == null) {
      _lock.synchronized(() {
        bookDetailsCubit ??= BlocProvider.of(context);
      });
    }
    return bookDetailsCubit!;
  }

  void addToCart({required int bookId}) {
    BookService.addTocart(id: bookId).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        ShowToast.sucuessMessage(
          message: AppString.addToCartSucess,
        );
      } else {
        _failedMessage();
      }
    }).catchError((error) {
      _failedMessage();
    });
  }

  void addToWishList({required int bookId}) {
    BookService.addtoWishList(id: bookId).then(
      (response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          ShowToast.sucuessMessage(
            message: AppString.addToWishSucess,
          );
        } else {
          _failedMessage();
        }
      },
    ).catchError(
      (error) {
        _failedMessage();
      },
    );
  }

  void _failedMessage() {
    ShowToast.errorMessage();
  }

  @override
  void onChange(Change<BookDetailsState> change) {
    // define current state and next state
    super.onChange(change);
  }
}
