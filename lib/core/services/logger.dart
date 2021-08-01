import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logger {
  static info(String message, {String title = "Info"}) {
    return Get.snackbar(title, message);
  }

  static error(String message, {String title = "Error"}) {
    return Get.snackbar(title, message,
        colorText: Colors.white, backgroundColor: Colors.red, barBlur: 10);
  }
}
