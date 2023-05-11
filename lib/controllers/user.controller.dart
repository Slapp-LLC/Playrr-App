import 'package:get/get.dart';
import 'package:playrr_app/models/myUser.model.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/services/user.service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:playrr_app/utils/api_error.dart'; // Add an alias to the dio import
import 'package:playrr_app/services/errorHandling.service.dart';

class UserController extends GetxController {
  final UserService _userService = Get.put(UserService());
  final UserProvider _userProvider = Get.put(UserProvider());
  Future<void> updateUserData(
      String email, String name, String lastName, String bio) async {
    try {
      dio.Response response = await _userService.updateMyUserData(
          email, name, lastName, bio, _userProvider.user.id);
      MyUserModel updatedUser =
          MyUserModel.fromJson(response.data as Map<String, dynamic>);
      _userProvider.updateUser(updatedUser);
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
    } catch (e) {
      printError(info: e.toString());
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
    } catch (e) {
      printError(info: e.toString());
      ErrorHandlingService.instance.showError(
        'Error: An unexpected error occurred',
      );
    }
  }
}
