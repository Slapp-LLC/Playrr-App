import 'package:flutter/material.dart';
import 'package:playrr_app/screens/sport_picking/components/sportpicking.body.dart';

class SportPickingScreen extends StatelessWidget {
  const SportPickingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text('Playrr',
            style: TextStyle(fontFamily: 'Medula One', fontSize: 50)),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
