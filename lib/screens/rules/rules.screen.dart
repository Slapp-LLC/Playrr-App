import 'package:flutter/material.dart';
import 'package:playrr_app/components/SecondaryAppBar.dart';
import 'package:playrr_app/screens/rules/components/rules.body.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: SecondaryAppBar(),
      body: RulesBody(),
    );
  }
}
