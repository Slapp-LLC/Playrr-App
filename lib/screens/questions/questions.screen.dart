import 'package:flutter/material.dart';
import 'package:playrr_app/components/secondary_appbar.dart';
import 'package:playrr_app/screens/questions/components/questions.body.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        appBar: SecondaryAppBar(
          title: 'Preguntas frecuentes',
        ),
        body: QuestionsBody());
  }
}
