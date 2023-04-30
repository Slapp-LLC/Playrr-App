import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/services/http.service.dart';
import 'package:playrr_app/utils/api_error.dart';

import 'package:playrr_app/utils/routePaths.utils.dart';
import 'package:playrr_app/utils/token_manager.dart';

class AuthService {
  //Initializations
  static final AuthService instance = AuthService._();
  factory AuthService() => instance;
  AuthService._() {
    dio = httpService.dio;
  }
  final storage = const FlutterSecureStorage();
  final httpService = HttpService.instance;
  late final Dio dio;
  final tokenManager = TokenManager();
  //Login Method
  Future<Response> login(String email, String password) async {
    try {
      Response response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});
      return response;
    } on DioError catch (e) {
      print(e);
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(statusCode: e.response?.statusCode, message: errorMessage);
    }
  }

  //Get current user's data
  Future<Response> getUserData() async {
    final accessToken = tokenManager.getToken();
    try {
      Response response = await dio.get('/auth/profile',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(message: errorMessage, statusCode: e.response?.statusCode);
    }
  }

  //Update profile data
  Future<Response> updateUserData(
      String email, String name, String lastName, String bio) async {
    final accessToken = tokenManager.getToken();
    // int userId = userController.userData['id'];

    try {
      Response response = await dio.get(
        '/user/edit/${13.toString()}',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(message: errorMessage, statusCode: e.response?.statusCode);
    }
  }

  //Register
  Future<Response> signUp(
      String email, String password, String name, String lastName) async {
    try {
      Response response = await dio.post('/auth/register', data: {
        'email': email,
        'password': password,
        'name': name,
        'lastName': lastName
      });
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(message: errorMessage, statusCode: e.response?.statusCode);
    }
  }

  Future<Response> setAgeAndGender(int age, String gender) async {
    final accessToken = tokenManager.getToken();
    try {
      Response response = await dio.put('/user/edit/${13}',
          data: {'age': age, 'gender': gender},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(message: errorMessage, statusCode: e.response?.statusCode);
    }
  }

  Future<Response> recoverPassword(String email) async {
    try {
      final response =
          await dio.post('/auth/forgor-password', data: {'email': email});
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(message: errorMessage, statusCode: e.response?.statusCode);
    }
  }

  // Future setAgeAndGender(int age, String gender, context) async {
  //   try {
  //     String? token = await storage.read(key: 'token');
  //     if (token == null) {
  //       return false;
  //     }
  //     int userId = userController.userData['id'];
  //     final res = await dio.put(
  //         '${dotenv.env['API_ENDPOINT']}/user/edit/$userId',
  //         data: {'age': age, 'gender': gender},
  //         options: Options(headers: {'Authorization': 'Bearer $token'}));
  //   } catch (e) {
  //     if (e is DioError &&
  //         (e.response?.statusCode == 404 || e.response?.statusCode == 400)) {
  //       String errorMessage =
  //           e.response?.data['message'] ?? 'An error occurred';
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: $errorMessage',
  //             style: const TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       return [e, errorMessage];
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: An error occurred',
  //             style: TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       return [e, ''];
  //     }
  //   }
  // }

  //Set Age and Gender

  // Future signUp(String email, String password, String name, String lastName,
  //     context) async {
  //   try {
  //     final response = await dio
  //         .post('${dotenv.env['API_ENDPOINT']}/auth/register', data: {
  //       'email': email,
  //       'password': password,
  //       'name': name,
  //       'lastName': lastName
  //     });
  //     final jsonResponse = response.data;
  //     userController.setUserData(jsonResponse['user']);

  //     await storage.write(key: 'token', value: jsonResponse['token']);

  //     Navigator.pushNamedAndRemoveUntil(
  //         context, RoutePaths.StepTwoSignUp, (route) => false);

  //     return response;
  //   } catch (e) {
  //     if (e is DioError &&
  //         (e.response?.statusCode == 404 || e.response?.statusCode == 400)) {
  //       String errorMessage =
  //           e.response?.data['message'] ?? 'An error occurred';
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: $errorMessage',
  //             style: const TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       print(e);
  //       return [e, errorMessage];
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: An error occurred',
  //             style: TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       print(e);
  //       return [e, ''];
  //     }
  //   }
  // }

  // Future updateProfile(
  //     String email, String name, String lastName, String bio) async {
  //   final token = await storage.read(key: 'token');
  //   int userId = userController.userData['id'];
  //   if (token == null) {
  //     return false;
  //   }
  //   try {
  //     final response = await dio.put(
  //         '${dotenv.env['API_ENDPOINT']}/user/edit/${userId.toString()}',
  //         options: Options(headers: {'Authorization': 'Bearer $token'}),
  //         data: {
  //           'email': email,
  //           'name': name,
  //           'lastName': lastName,
  //           'bio': bio
  //         });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //Getting the current user by jwtToken
  // Future<bool> getCurrentUser(context) async {
  //   final token = await storage.read(key: 'token');

  //   if (token == null) {
  //     return false;
  //   }
  //   try {
  //     final response = await dio.get(
  //         '${dotenv.env['API_ENDPOINT']}/auth/profile',
  //         options: Options(headers: {'Authorization': 'Bearer $token'}));
  //     final jsonResponse = response.data;
  //     userController.setUserData(jsonResponse);
  //     return true;
  //   } catch (e) {
  //     if (e is DioError) {
  //       String errorMessage =
  //           e.response?.data['message'] ?? 'An error occurred';
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: $errorMessage',
  //             style: const TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       return false;
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: An error occurred',
  //             style: TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       return false;
  //     }
  //   }
  // }

  //Login Method
  // Future<void> login(String email, String password, context) async {
  //   try {
  //     final response = await dio.post(
  //         '${dotenv.env['API_ENDPOINT']}/auth/login',
  //         data: {'email': email, 'password': password});
  //     final jsonResponse = response.data;
  //     final token = jsonResponse['token'];
  //     final userData = jsonResponse['user'];
  //     await storage.write(key: 'token', value: token);
  //     userController.setUserData(userData);
  //     Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  //   } catch (e) {
  //     if (e is DioError) {
  //       String errorMessage =
  //           e.response?.data['message'] ?? 'An error occurred';
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: $errorMessage',
  //             style: const TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       print(e);
  //     } else {
  //       print(e);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: An error occurred',
  //             style: TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //     }
  //   }
  // }

  // Future setAgeAndGender(int age, String gender, context) async {
  //   try {
  //     String? token = await storage.read(key: 'token');
  //     if (token == null) {
  //       return false;
  //     }
  //     int userId = userController.userData['id'];
  //     final res = await dio.put(
  //         '${dotenv.env['API_ENDPOINT']}/user/edit/$userId',
  //         data: {'age': age, 'gender': gender},
  //         options: Options(headers: {'Authorization': 'Bearer $token'}));
  //   } catch (e) {
  //     if (e is DioError &&
  //         (e.response?.statusCode == 404 || e.response?.statusCode == 400)) {
  //       String errorMessage =
  //           e.response?.data['message'] ?? 'An error occurred';
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: $errorMessage',
  //             style: const TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       return [e, errorMessage];
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: errorColor,
  //           content: Text(
  //             'Error: An error occurred',
  //             style: TextStyle(color: Colors.white70),
  //           ),
  //           showCloseIcon: true,
  //         ),
  //       );
  //       return [e, ''];
  //     }
  //   }
  // }
  //Todo:Move this to controller
  // Future logOut() async {
  //   await storage.delete(key: 'token');
  //   userController.deleteUserData();
  // }
}
