import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/constants.dart';

class EventService {
  //Initializations
  static final EventService instance = EventService._();
  factory EventService() => instance;
  EventService._();
  final dio = Dio();

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
}
