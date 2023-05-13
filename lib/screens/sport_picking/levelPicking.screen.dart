import 'package:flutter/material.dart';
import 'package:playrr_app/components/initial_appbar.dart';
import 'package:playrr_app/screens/sport_picking/components/level_picking_body.dart';

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
