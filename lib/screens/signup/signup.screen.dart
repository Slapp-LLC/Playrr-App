import 'package:flutter/material.dart';
import 'package:playrr_app/components/InitialAppBar.dart';
import 'package:playrr_app/screens/signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: InitialAppBar(),
      body: Body(),
    );
  }
}
