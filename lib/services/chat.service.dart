import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:playrr_app/services/http.service.dart';
import 'package:playrr_app/utils/api_error.dart';
import 'package:playrr_app/utils/token_manager.dart';

class ChatService {
  static final ChatService instance = ChatService._();
  factory ChatService() => instance;
  ChatService._() {
    dio = httpService.dio;
  }
  final storage = const FlutterSecureStorage();
  final httpService = HttpService.instance;
  late final Dio dio;
  final tokenManager = TokenManager();

  Future<Response> getMyChats(int userID) async {
    try {
      final response = dio.get('/chat/myChats/$userID');
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(statusCode: e.response?.statusCode, message: errorMessage);
    }
  }
}
