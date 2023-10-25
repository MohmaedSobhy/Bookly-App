import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'ottp_state.dart';

class OttpCubit extends Cubit<OttpState> {
  static OttpCubit? _ottpCubit;
  static final Lock _lock = Lock();

  static OttpCubit getInstanse() {
    if (_ottpCubit == null) {
      _lock.synchronized(() {
        _ottpCubit ??= OttpCubit();
      });
    }
    return _ottpCubit!;
  }

  OttpCubit() : super(OttpInitial());

  void checkOttpCode({required String code}) {
    APIManager.postMethod(baseUrl: EndPoints.verifyOttpCode, body: {
      APIKey.verfiyCode: code,
    }).then((response) {
      if (response.statusCode == 200) {
        emit(OttpCodeValide());
      } else {
        emit(OttpCodeInvalide());
      }
    }).catchError((error) {
      emit(OttpCodeInvalide());
    });
  }
}
