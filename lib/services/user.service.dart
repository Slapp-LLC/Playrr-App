import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
import 'package:playrr_app/services/authentication.service.dart';
import 'package:playrr_app/services/http.service.dart';
import 'package:playrr_app/utils/api_error.dart';
import 'package:playrr_app/utils/token_manager.dart';

class UserService {
  static final UserService instance = UserService._();
  factory UserService() => instance;
  UserService._() {
    dio = httpService.dio;
  }
  final storage = const FlutterSecureStorage();
  final httpService = HttpService.instance;
  late final Dio dio;
  final tokenManager = TokenManager();

  Future<Response> setUserSports(
      int sportId, int levelId, int userId, String accessToken) async {
    try {
      Response response = await dio.post('/user/userSport/$userId',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
          data: {'sport_id': sportId, 'level_id': levelId});
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(statusCode: e.response?.statusCode, message: errorMessage);
    }
  }

  //Update profile data
  Future<Response> updateMyUserData(String email, String name, String lastName,
      String bio, int userId) async {
    // int userId = userController.userData['id'];
    try {
      final accessToken = await tokenManager.getToken();
      Response response = await dio.put(
        '/user/edit/${userId.toString()}',
        data: {'email': email, 'name': name, 'lastName': lastName, 'bio': bio},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(message: errorMessage, statusCode: e.response?.statusCode);
    }
  }

  Future<Response> getUserData(int userId) async {
    try {
      final accessToken = await tokenManager.getToken();
      Response response = await dio.get('/user/$userId',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(message: errorMessage, statusCode: e.response?.statusCode);
    }
  }

  // Future<Map<String, dynamic>> _getUserData() async {
  //   final storage = const FlutterSecureStorage();
  //   final token = await storage.read(key: 'token');

  //   try {
  //     final response = await Dio().get(
  //         '${dotenv.env['API_ENDPOINT']}/user/${widget.userId}',
  //         options: Options(headers: {'Authorization': 'Bearer $token'}));
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

//  Future<Map<String, dynamic>> _getMyData() async {
//     final storage = const FlutterSecureStorage();
//     final token = await storage.read(key: 'token');

//     try {
//       final response = await Dio().get(
//           '${dotenv.env['API_ENDPOINT']}/user/myProfile',
//           options: Options(headers: {'Authorization': 'Bearer $token'}));
//       return response.data;
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }

  // Future setUserSports(int sportId, int levelId, context) async {
  //   Map<String, dynamic> data = {
  //     'sport_id': sportId,
  //     'level_id': levelId,
  //   };
  //   int userId = userController.userData['id'];
  //   String parsedData = jsonEncode(data);
  //   try {
  //     final token = await storage.read(key: 'token');
  //     await dio.post('${dotenv.env['API_ENDPOINT']}/user/userSport/$userId',
  //         data: parsedData,
  //         options: Options(headers: {'Authorization': 'Bearer $token'}));
  //     // await AuthService.instance.getUserData();
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const Home()));
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
}
