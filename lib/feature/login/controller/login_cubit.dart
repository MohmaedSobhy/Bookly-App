import 'dart:convert';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/API/api_keys.dart';
import '../../../core/API/end_points.dart';
import '../../../core/localization/app_string.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool loading = false;

  static LoginCubit? loginCubit;

  static final Lock lock = Lock();

  static LoginCubit getInstanse() {
    if (loginCubit == null) {
      lock.synchronized(() {
        loginCubit ??= LoginCubit();
      });
    }
    return loginCubit!;
  }

  LoginCubit() : super(LoginInitial());

  void loginMethod() {
    loading = true;
    emit(LoginLoading());
    APIManager.postMethod(baseUrl: EndPoints.login, body: {
      APIKey.email: email.text.toString(),
      APIKey.password: password.text.toString(),
    }).then((response) async {
      if (response.statusCode == 200) {
        _loginSucess(response);
        emit(LoginSuccess());
      } else {
        loading = false;

        _failedToLogin();
      }
    }).catchError((error) {
      loading = false;
      _failedToLogin();
    });
  }

  void _loginSucess(Response response) async {
    ShowToast.sucuessMessage(
      message: AppString.loginSuceeded,
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    await _saveData(json['data']);
    loading = false;
    _clearFaildes();
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

  void _clearFaildes() {
    email.text = "";
    password.text = "";
  }

  void _failedToLogin() {
    ShowToast.errorMessage();
    emit(FailedLogin());
  }
}
