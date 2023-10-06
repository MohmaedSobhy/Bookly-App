import 'dart:convert';

import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
    APIManager.postMethod(baseUrl: EndPoints.signUp, body: {
      APIKey.name: name.text.toString(),
      APIKey.email: email.text.toString(),
      APIKey.password: password.text.toString(),
      APIKey.phone: phone.text.toString(),
      APIKey.confirmPassword: confrimePassword.text.toString(),
    }).then((response) async {
      if (response.statusCode == 201) {
        ShowToast.sucuessMessage(message: AppString.signUpSucceeded);
        Map<String, dynamic> data = jsonDecode(response.body);
        await _saveData(data['data']);
        print("hello");
        emit(SignUpSucceed());
      } else {
        _failedToSignUp();
      }
    }).catchError((error) {
      _failedToSignUp();
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

  void _failedToSignUp() {
    ShowToast.errorMessage(
      message: AppString.emailExist,
    );
    emit(FailedToSignUp());
  }
}
