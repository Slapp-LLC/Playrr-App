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
  //Get reccomended events
  Future<Response> getRecommendedEvents() async {
    try {
      final response = dio.get('/event');
      return response;
    } on DioError catch (e) {
      print(e);
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(statusCode: e.response?.statusCode, message: errorMessage);
    }
  }

  //Get all sports
  Future<Response> getAllSports() async {
    try {
      Response response = await dio.get('/sport');
      return response;
    } on DioError catch (e) {
      print(e);
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(statusCode: e.response?.statusCode, message: errorMessage);
    }
  }

  //Join an event
  Future<Response> joinEvent(int eventId) async {
    final token = await storage.read(key: 'token');
    try {
      Response response = await dio.post('/tickets/join',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {'eventId': eventId});
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(statusCode: e.response?.statusCode, message: errorMessage);
    }
  }

  //Get an event
  Future<Response> getEvent(int eventId) async {
    try {
      final response = await dio.get('/event/$eventId');
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(statusCode: e.response?.statusCode, message: errorMessage);
    }
  }
}
