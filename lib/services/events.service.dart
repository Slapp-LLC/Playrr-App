import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/services/http.service.dart';
import 'package:playrr_app/utils/api_error.dart';
import 'package:playrr_app/utils/token_manager.dart';

class EventService {
  //Initializations
  static final EventService instance = EventService._();
  factory EventService() => instance;
  final storage = const FlutterSecureStorage();
  EventService._() {
    dio = httpService.dio;
  }
  final httpService = HttpService.instance;
  late final Dio dio;
  final tokenManager = TokenManager();
  // Future GetMyEvents() async {
  //   try {} catch (e) {}
  // }

  Future<Response> getRecommendedEvents() async {
    try {
      final response = dio.get('/event');
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(statusCode: e.response?.statusCode, message: errorMessage);
    }
  }

  Future getAllEvents(context) async {
    try {
      final response = await dio.get('${dotenv.env['API_ENDPOINT']}/event');
      return response;
    } catch (e) {
      if (e is DioError) {
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
        print(e);
      } else {
        print(e);
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
      }
    }
  }

  Future joinEvent(int eventId) async {
    final token = await storage.read(key: 'token');
    try {
      final response = await dio.post(
          '${dotenv.env['API_ENDPOINT']}/tickets/join',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {'eventId': eventId});
    } catch (e) {
      print(e);
    }
  }
}
