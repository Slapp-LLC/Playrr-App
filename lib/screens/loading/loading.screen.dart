import 'package:flutter/material.dart';
import 'package:playrr_app/screens/loading/components/body.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
