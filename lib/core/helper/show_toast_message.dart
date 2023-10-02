import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class ShowToast {
  static void showMessage({required String message, required Color color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
