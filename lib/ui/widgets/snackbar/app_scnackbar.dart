import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void success(String message, {String title = 'Success'}) {
    _showSnackbar(title, message, backgroundColor: Colors.green);
  }

  static void error(String message, {String title = 'Error'}) {
    _showSnackbar(title, message, backgroundColor: Colors.red);
  }

  static void warning(String message, {String title = 'Warning'}) {
    _showSnackbar(title, message, backgroundColor: Colors.orange);
  }

  static void info(String message, {String title = 'Info'}) {
    _showSnackbar(title, message, backgroundColor: Colors.blue);
  }

  static void _showSnackbar(
    String title,
    String message, {
    required Color backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor.withValues(alpha: 0.9),
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      overlayBlur: 1.5,
    );
  }
}
