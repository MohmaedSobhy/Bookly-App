import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../localization/app_string.dart';

abstract class ShowToast {
  static void sucuessMessage({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static errorMessage({String? message}) {
    Fluttertoast.showToast(
      msg: (message == null) ? AppString.errorMessage : message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
