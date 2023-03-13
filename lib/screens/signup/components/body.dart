import 'package:flutter/material.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/components/OutlineIconButton.dart';
import 'package:playrr_app/screens/stepOne/steOneSignUp.screen.dart';

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
      child: Column(children: [
        Container(
            width: double.infinity,
            height: 417,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/SignUpHero.png'),
                    fit: BoxFit.cover)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Text(
                'Play with players of your same level',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Bebas Neue',
                    fontSize: 30),
                textAlign: TextAlign.center,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 50, left: 29, right: 29),
            child: OutlineIconButton(
                iconPath: 'assets/icons/GoogleIcon.svg',
                onPressed: () {},
                text: 'Registarse con Google')),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 29, right: 29),
          child: MainButton(
            text: 'Registrarse con email',
            isPrimary: true,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StepOneSignUp()));
            },
          ),
        ),
      ]),
    );
  }
}
