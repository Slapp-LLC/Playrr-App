import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/home/home.screen.dart';

class UserService {
  static final UserService instance = UserService._();
  factory UserService() => instance;
  UserService._();

  final dio = Dio();
  final storage = const FlutterSecureStorage();
  UserController userController = Get.put(UserController());

  Future setUserSports(userSports, context) async {
    int userId = userController.userData['id'];
    String data = jsonEncode(userSports);
    try {
      final token = await storage.read(key: 'token');
      final response = await dio.post(
          '${dotenv.env['API_ENDPOINT']}/user/userSport/$userId',
          data: data,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } catch (e) {
      if (e is DioError &&
          (e.response?.statusCode == 404 || e.response?.statusCode == 400)) {
        String errorMessage =
            e.response?.data['message'] ?? 'An error occurred';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: errorColor,
            content: Text(
              'Error: $errorMessage',
              style: const TextStyle(color: Colors.white70),
            ),
            showCloseIcon: true,
          ),
        );
        return [e, errorMessage];
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: errorColor,
            content: Text(
              'Error: An error occurred',
              style: TextStyle(color: Colors.white70),
            ),
            showCloseIcon: true,
          ),
        );
        return [e, ''];
      }
    }
  }
}
