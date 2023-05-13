import 'package:flutter/material.dart';
import 'package:playrr_app/components/InitialAppBar.dart';
import 'package:playrr_app/screens/sport_picking/components/LevelPickingBody.dart';

class LevelPickingScreen extends StatelessWidget {
  const LevelPickingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: InitialAppBar(),
      body: Body(),
    );
  }
}
