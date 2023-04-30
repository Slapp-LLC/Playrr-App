import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:playrr_app/constants.dart';

class EventService {
  //Initializations
  static final EventService instance = EventService._();
  factory EventService() => instance;
  final storage = const FlutterSecureStorage();

  EventService._();
  final dio = Dio();
  // Future GetMyEvents() async {
  //   try {} catch (e) {}
  // }

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
