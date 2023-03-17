import 'package:flutter/material.dart';
import 'package:playrr_app/components/InitialAppBar.dart';
import 'package:playrr_app/screens/passwordRecovery/components/body.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: InitialAppBar(),
      body: Body(),
    );
  }
}
