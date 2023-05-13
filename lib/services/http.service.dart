import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  static final HttpService instance = HttpService._();
  factory HttpService() => instance;
  HttpService._();
  final dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_ENDPOINT']!,
  ));
}
