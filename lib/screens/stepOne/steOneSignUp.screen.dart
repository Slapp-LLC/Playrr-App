import 'package:flutter/material.dart';
import 'package:playrr_app/components/InitialAppBar.dart';
import 'package:playrr_app/screens/stepOne/components/body.dart';

class StepOneSignUp extends StatelessWidget {
  const StepOneSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: InitialAppBar(),
      body: Body(),
    );
  }
}
