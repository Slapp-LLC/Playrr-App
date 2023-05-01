import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
import 'package:playrr_app/services/authentication.service.dart';

class UserService {
  static final UserService instance = UserService._();
  factory UserService() => instance;
  UserService._();

  final dio = Dio();
  final storage = const FlutterSecureStorage();
  UserController userController = Get.put(UserController());

  Future setUserSports(int sportId, int levelId, context) async {
    Map<String, dynamic> data = {
      'sport_id': sportId,
      'level_id': levelId,
    };
    int userId = userController.userData['id'];
    String parsedData = jsonEncode(data);
    try {
      final token = await storage.read(key: 'token');
      await dio.post('${dotenv.env['API_ENDPOINT']}/user/userSport/$userId',
          data: parsedData,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      // await AuthService.instance.getUserData();
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
