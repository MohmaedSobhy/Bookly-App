import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:books_app/core/localization/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/API/end_points.dart';
import 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmeNewPasswordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  static UpdatePasswordCubit? updatePasswordCubit;
  static final Lock lock = Lock();
  UpdatePasswordCubit() : super(UpdatePasswordInitialState());

  static UpdatePasswordCubit get() {
    if (updatePasswordCubit == null) {
      lock.synchronized(() {
        updatePasswordCubit ??= UpdatePasswordCubit();
      });
    }
    return updatePasswordCubit!;
  }

  void updatePassword() async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    APIManager.postMethod(
            baseUrl: EndPoints.udpatePassword,
            body: {
              APIKey.currentPassword: oldPasswordController.text.toString(),
              APIKey.newPassword: newPasswordController.text.toString(),
              APIKey.newPasswordConfirm:
                  confirmeNewPasswordController.text.toString(),
            },
            token: token)
        .then(
      (response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          _updateSuccessFull();
        } else {
          _failedToUpdatePassword();
        }
      },
    ).catchError((error) {
      _failedToUpdatePassword();
    });
  }

  void _failedToUpdatePassword() {
    ShowToast.sucuessMessage(
      message: AppString.failedToUpdatePassword,
    );
    emit(UpdatePasswordFailedState());
  }

  void _updateSuccessFull() {
    oldPasswordController.text = "";
    newPasswordController.text = "";
    confirmeNewPasswordController.text = "";
    ShowToast.sucuessMessage(
      message: AppString.successToUpdatePassword,
    );
    emit(UpdatePasswordSuccefullyState());
  }
}
