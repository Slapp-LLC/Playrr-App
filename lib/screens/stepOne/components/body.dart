import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/screens/stepOne/components/SignUpForm.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 35),
      child: Column(
        children: [
          const SignUpForm(),
          MainButton(text: 'Siguiente', onPressed: () {}, isPrimary: true)
        ],
      ),
    );
  }
}
