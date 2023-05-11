import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:playrr_app/services/http.service.dart';
import 'package:playrr_app/utils/api_error.dart';
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
  Future<Response> getUserData(String accessToken) async {
    try {
      Response response = await dio.get('/auth/profile',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return response;
    } on DioError catch (e) {
      print(e);
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

  Future<Response> setAgeAndGender(int age, String gender, int userId) async {
    final accessToken = await tokenManager.getToken();
    try {
      Response response = await dio.put('/user/edit/${userId.toString()}',
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

  Future<Response> getSportLevels() async {
    try {
      final response = await dio.get('/sport/levels');
      return response;
    } on DioError catch (e) {
      String errorMessage = e.response?.data['message'] ?? 'An error occurred';
      throw ApiError(message: errorMessage, statusCode: e.response?.statusCode);
    }
  }
}
