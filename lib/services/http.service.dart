import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/utils/api_error.dart';

class HttpService {
  static final HttpService instance = HttpService._();
  factory HttpService() => instance;
  HttpService._();
  final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['API_ENDPOINT']!,
      connectTimeout: Duration(seconds: 5)));
}
