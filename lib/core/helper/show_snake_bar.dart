import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SnakeBarHelper {
  static void showSnakeBar(
      {required String title, required String message, Color? backGround}) {
    Get.snackbar(
      title,
      "",
      backgroundColor: (backGround == null) ? Colors.green : backGround,
      colorText: Colors.white,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.only(
        bottom: 16,
        left: 5,
        right: 5,
      ),
    );
  }
}
