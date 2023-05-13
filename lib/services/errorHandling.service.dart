import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';

class ErrorHandlingService {
  // Singleton pattern
  static final ErrorHandlingService instance = ErrorHandlingService._();
  factory ErrorHandlingService() => instance;
  ErrorHandlingService._();

  // Show error message using GetX SnackBar
  void showError(String message, {int? statusCode}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: errorColor,
        content: Text(
          'Error $statusCode: $message',
          style: const TextStyle(color: Colors.white70),
        ),
        showCloseIcon: true,
      ),
    );
  }
}
