import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/InitialAppBar.dart';
import 'package:playrr_app/screens/postSignup/secondStep/components/body.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

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
