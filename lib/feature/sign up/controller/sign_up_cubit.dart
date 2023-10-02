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
  TextEditingController password = TextEditingController();
  TextEditingController confrimePassword = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static SignUpCubit get(context) {
    if (signUpCubit == null) {
      _lock.synchronized(() {
        signUpCubit ??= BlocProvider.of(context);
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
      APIKey.confirmPassword: confrimePassword.text.toString(),
    }).then((response) {
      if (response.statusCode == 201) {
        ShowToast.showMessage(
            color: Colors.green, message: AppString.signUpSucceeded);
        _saveToken(response);
        emit(SignUpSucceed());
      } else {
        _failedToSignUp();
      }
    }).catchError((error) {
      _failedToSignUp();
    });
  }

  void _saveToken(Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    StorageHelper.addKey(key: APIKey.token, value: json['data']['token']);
  }

  void _failedToSignUp() {
    ShowToast.showMessage(
      color: Colors.red,
      message: AppString.emailExist,
    );
    emit(FailedToSignUp());
  }
}
