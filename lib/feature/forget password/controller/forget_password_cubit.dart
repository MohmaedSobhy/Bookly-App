import 'package:bloc/bloc.dart';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  static ForgetPasswordCubit? forgetPassCubit;
  static final Lock lock = Lock();
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static ForgetPasswordCubit getInstanse() {
    if (forgetPassCubit == null) {
      lock.synchronized(() {
        forgetPassCubit ??= ForgetPasswordCubit();
      });
    }
    return forgetPassCubit!;
  }

  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  void forgetPassword() {
    loading = true;
    emit(LoadingForgetPassword());
    APIManager.postMethod(baseUrl: EndPoints.forgetPassword, body: {
      APIKey.email: emailController.text.toString(),
    }).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        loading = false;
        emit(SucessSendingCode());
      } else {
        _failedToSendCode();
      }
    }).catchError((error) {
      _failedToSendCode();
    });
  }

  void _failedToSendCode() {
    ShowToast.errorMessage(message: "Check Email");
    loading = false;
    emit(FailedToSendCode());
  }
}