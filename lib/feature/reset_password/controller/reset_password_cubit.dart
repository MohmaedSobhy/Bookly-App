import 'package:bloc/bloc.dart';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  static ResetPasswordCubit? resetPassword;
  static final Lock lock = Lock();

  String code = "";
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static ResetPasswordCubit getInstanse() {
    if (resetPassword == null) {
      lock.synchronized(() {
        resetPassword ??= ResetPasswordCubit();
      });
    }
    return resetPassword!;
  }

  ResetPasswordCubit() : super(ResetPasswordInitial());

  void resetUserPassword() {
    APIManager.postMethod(baseUrl: EndPoints.resetPassword, body: {
      APIKey.verfiyCode: code,
      APIKey.newPassword: password.text,
      APIKey.newPasswordConfirm: confirmpassword.text,
    }).then((response) {
      if (response.statusCode == 200) {
        _sucefullyResetPassword();
      } else {
        emit(FailedToResetPassword());
      }
    }).catchError((error) {
      emit(FailedToResetPassword());
    });
  }

  void _sucefullyResetPassword() {
    password.text = "";
    confirmpassword.text = "";
    emit(SucessfullyResetPassword());
  }
}
