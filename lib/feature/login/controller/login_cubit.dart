import 'dart:convert';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/API/api_keys.dart';
import '../../../core/API/end_points.dart';
import '../../../core/localization/app_string.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static LoginCubit? loginCubit;
  static final Lock _lock = Lock();

  static LoginCubit get(context) {
    if (loginCubit == null) {
      _lock.synchronized(() {
        loginCubit ??= BlocProvider.of(context);
      });
    }
    return loginCubit!;
  }

  LoginCubit() : super(LoginInitial());

  void loginMethod() {
    APIManager.postMethod(baseUrl: EndPoints.login, body: {
      APIKey.email: email.text.toString(),
      APIKey.password: password.text.toString(),
    }).then((response) async {
      if (response.statusCode == 200) {
        ShowToast.showMessage(
          color: Colors.green,
          message: AppString.loginSuceeded,
        );
        Map<String, dynamic> json = jsonDecode(response.body);
        await _saveData(json['data']);
        emit(LoginSuccess());
      } else {
        _failedToLogin();
      }
    }).catchError((error) {
      _failedToLogin();
    });
  }

  Future<void> _saveData(Map<String, dynamic> json) async {
    StorageHelper.addKey(key: APIKey.token, value: json['token']);
    StorageHelper.addKey(
      key: APIKey.name,
      value: json['user'][APIKey.name],
    );
    StorageHelper.addKey(
      key: APIKey.phone,
      value: json['user'][APIKey.phone],
    );
    StorageHelper.addKey(
      key: APIKey.address,
      value: json['user'][APIKey.address],
    );
    StorageHelper.addKey(
      key: APIKey.email,
      value: json['user'][APIKey.email],
    );
  }

  void _failedToLogin() {
    ShowToast.showMessage(
      color: Colors.red,
      message: AppString.errorMessage,
    );
    emit(FailedLogin());
  }
}
