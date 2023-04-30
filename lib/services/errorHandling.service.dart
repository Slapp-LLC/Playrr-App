import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';

class ErrorHandlingService {
  // Singleton pattern
  static final ErrorHandlingService instance = ErrorHandlingService._();
  factory ErrorHandlingService() => instance;
  ErrorHandlingService._();

  // Show error message using GetX SnackBar
  void showError(String message, {int? statusCode}) {
    Get.showSnackbar(
      GetSnackBar(
        title: statusCode == null ? 'Error' : 'Error ($statusCode)',
        message: message,
        backgroundColor: errorColor,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
