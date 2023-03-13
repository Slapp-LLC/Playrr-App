import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:playrr_app/components/OutlineIconButton.dart';
import 'package:playrr_app/screens/login/components/loginForm.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 0, left: 29, right: 29),
                  child: OutlineIconButton(
                      iconPath: 'assets/icons/GoogleIcon.svg',
                      onPressed: () {},
                      text: 'Ingresar con Google')),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'O ingresa con',
                  style: TextStyle(color: Colors.grey[350], fontSize: 15),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 29, right: 29),
                  child: LoginForm())
            ],
          ),
        ));
  }
}
