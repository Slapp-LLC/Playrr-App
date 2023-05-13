import 'package:flutter/material.dart';
import 'package:playrr_app/components/initial_appbar.dart';
import 'package:playrr_app/screens/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: InitialAppBar(),
      body: Body(),
    );
  }
}
