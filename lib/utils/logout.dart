import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:playrr_app/screens/landing/landing.screen.dart';

final storage = FlutterSecureStorage();

void logout(BuildContext context) async {
  await storage.delete(key: 'token');
}
