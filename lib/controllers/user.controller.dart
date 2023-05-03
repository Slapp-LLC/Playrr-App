import 'package:get/get.dart';
import 'package:playrr_app/services/user.service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:playrr_app/utils/api_error.dart'; // Add an alias to the dio import
import 'package:playrr_app/services/errorHandling.service.dart';

class UserController extends GetxController {
  final UserService _userService = Get.put(UserService());
  Future<void> updateUserData(
      String email, String name, String lastName, String bio) async {
    try {
      dio.Response response =
          await _userService.updateMyUserData(email, name, lastName, bio);
      print(response);
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
    } catch (e) {
      print(e);
      ErrorHandlingService.instance.showError(
        'Error: An unexpected error occurred',
      );
    }
  }

  Future getUserData(int userId) async {
    try {
      dio.Response response = await _userService.getUserData(userId);
      return response.data;
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
    }
  }
}
