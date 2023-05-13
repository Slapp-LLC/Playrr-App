import 'package:flutter/material.dart';
import 'package:playrr_app/screens/signup/components/signup_form.dart';

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
      decoration: const BoxDecoration(color: Colors.black, border: Border()),
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: const SignUpForm(),
    );
  }
}
