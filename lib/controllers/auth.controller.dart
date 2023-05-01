import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/models/user.model.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/services/authentication.service.dart';
import 'package:playrr_app/services/errorHandling.service.dart';
import 'package:playrr_app/services/http.service.dart';
import 'package:playrr_app/utils/api_error.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';
import 'package:playrr_app/utils/token_manager.dart';
import 'package:dio/dio.dart' as dio; // Add an alias to the dio import

class AuthController extends GetxController {
  final AuthService authService = AuthService.instance;
  final TokenManager tokenManager = Get.put(TokenManager());
  final UserProvider _userProvider = Get.put(UserProvider());
  Future<void> login(String email, String password) async {
    try {
      // Response response = await httpService.login(email, password);
      dio.Response response = await authService.login(email, password);
      UserModel user =
          UserModel.fromJson(response.data['user'] as Map<String, dynamic>);
      _userProvider.updateUser(user);
      await tokenManager.storeToken(response.data['token']);
      Get.offAllNamed(RoutePaths.Home);
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          backgroundColor: errorColor,
          content: Text(
            'Error: An unexpected error occurred',
            style: TextStyle(color: Colors.white70),
          ),
          showCloseIcon: true,
        ),
      );
    }
  }

  Future<bool> getCurrenUser() async {
    final accessToken = await tokenManager.getToken();
    if (accessToken == null) {
      return false;
    } else {
      try {
        dio.Response response = await authService.getUserData(accessToken);

        if (response.data != null) {
          UserModel user =
              UserModel.fromJson(response.data as Map<String, dynamic>);
          _userProvider.updateUser(user);
          return true;
        }
        return false;
        //Implement futher logic
      } on ApiError catch (e) {
        ErrorHandlingService.instance
            .showError(e.message, statusCode: e.statusCode);
        return false;
      } catch (e) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            backgroundColor: errorColor,
            content: Text(
              'Error: An unexpected error occurred',
              style: TextStyle(color: Colors.white70),
            ),
            showCloseIcon: true,
          ),
        );
        return false;
      }
    }
  }

  Future<void> signUp(
      String email, String password, String name, String lastName) async {
    try {
      dio.Response response =
          await authService.signUp(email, password, name, lastName);

      //Todo Implement futher logic
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          backgroundColor: errorColor,
          content: Text(
            'Error: An unexpected error occurred',
            style: TextStyle(color: Colors.white70),
          ),
          showCloseIcon: true,
        ),
      );
    }
  }

  Future<void> setAgeAndGender(int age, String gender) async {
    try {
      dio.Response response = await authService.setAgeAndGender(age, gender);
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          backgroundColor: errorColor,
          content: Text(
            'Error: An unexpected error occurred',
            style: TextStyle(color: Colors.white70),
          ),
          showCloseIcon: true,
        ),
      );
    }
  }

  Future<void> recoverPassword(String email) async {
    try {
      dio.Response response = await authService.recoverPassword(email);
      //Todo futher implementation
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          backgroundColor: errorColor,
          content: Text(
            'Error: An unexpected error occurred',
            style: TextStyle(color: Colors.white70),
          ),
          showCloseIcon: true,
        ),
      );
    }
  }

  Future<void> logOut() async {
    try {
      await tokenManager.deleteToken();
      //Todo futher implementation
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          backgroundColor: errorColor,
          content: Text(
            'Error: An unexpected error occurred',
            style: TextStyle(color: Colors.white70),
          ),
          showCloseIcon: true,
        ),
      );
    }
  }

// Future logOut() async {
  //   await storage.delete(key: 'token');
  //   userController.deleteUserData();
  // }
  var age = 0.obs;
  var gender = ''.obs;
  var pickedSportId = 0.obs;
  var pickedLevelId = 0.obs;
  var currentSport = 0.obs;
  var _userData;

  get userData => _userData;
  void setUserData(data) {
    _userData = data;
    update();
  }

  void deleteUserData() {
    _userData = null;
    update();
  }

  void setAge(int value) {
    age.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }

  void setCurrentSport(int sportId) {
    currentSport.value = sportId;
  }

  void setPickedSportId(int sportId) {
    pickedSportId.value = sportId;
  }

  void setPickedLevelId(int levelId) {
    pickedLevelId.value = levelId;
  }
}
