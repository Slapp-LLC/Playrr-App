import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> checkSession() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'token');
  print(token);
  if (token == null) {
    return false;
  }

  final dio = Dio();

  try {
    final response = await dio.get('${dotenv.env['API_ENDPOINT']}/auth/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    if (response.statusCode == 200) {
      print(response);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
