import 'package:flutter/material.dart';
import 'package:playrr_app/components/initial_appbar.dart';
import 'package:playrr_app/screens/password_recovery/components/body.dart';

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
