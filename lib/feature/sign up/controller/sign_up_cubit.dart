import 'dart:convert';

import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:synchronized/synchronized.dart';

import '../../../core/API/api.dart';
import '../../../core/API/api_keys.dart';
import '../../../core/API/end_points.dart';
import '../../../core/data/shared_date.dart';
import '../../../core/localization/app_string.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  static SignUpCubit? signUpCubit;
  static final Lock _lock = Lock();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrimePassword = TextEditingController();
  bool loading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String error = "";
  Map<String, dynamic> errorMessages = {};

  static SignUpCubit getInstanse() {
    if (signUpCubit == null) {
      _lock.synchronized(() {
        signUpCubit ??= SignUpCubit();
      });
    }
    return signUpCubit!;
  }

  SignUpCubit() : super(SignUpInitial());

  void signUpMethod() {
    loading = true;
    emit(LoadingToSignUp());
    APIManager.postMethod(baseUrl: EndPoints.signUp, body: {
      APIKey.name: name.text.toString(),
      APIKey.email: email.text.toString(),
      APIKey.password: password.text.toString(),
      APIKey.phone: phone.text.toString(),
      APIKey.confirmPassword: confrimePassword.text.toString(),
    }).then((response) async {
      if (response.statusCode == 201 || response.statusCode == 200) {
        _signInSuscess(response);
        emit(SignUpSucceed());
      } else {
        _failedToSignUp(response);
      }
    }).catchError((error) {
      print("hello error");
      ShowToast.errorMessage();
    });
  }

  void _signInSuscess(Response response) async {
    ShowToast.sucuessMessage(message: AppString.signUpSucceeded);
    Map<String, dynamic> data = jsonDecode(response.body);
    await _saveData(data['data']);
    loading = false;
    _clearFields();
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

  void _clearFields() {
    name.text = "";
    email.text = "";
    password.text = "";
    confrimePassword.text = "";
    phone.text = "";
  }

  void _failedToSignUp(Response response) {
    loading = false;

    errorMessages.clear();
    Map<String, dynamic> json = jsonDecode(response.body);
    errorMessages.addAll(json[APIKey.errors]);
    formkey.currentState!.validate();
    emit(FailedToSignUp());
  }

  String hasErrorMessage({required String key}) {
    if (errorMessages.containsKey(key)) {
      return errorMessages[key][0];
    }
    return "";
  }
}
