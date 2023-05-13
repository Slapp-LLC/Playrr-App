import 'package:flutter/material.dart';
import 'package:playrr_app/components/main_button.dart';
import 'package:playrr_app/components/outer_link.dart';
import 'package:playrr_app/screens/login/login.screen.dart';
import 'package:playrr_app/screens/signup/steOneSignUp.screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri terms = Uri.parse('https://flutter.dev');

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/LandingBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 79),
              child: Text(
                'Bienvenido a ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                'Playrr',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Medula One',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 300, left: 10, right: 10),
              child: Text(
                'Unete a nuestra comunidad y practica tus deportes favoritos.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 72, left: 25, right: 25),
              child: MainButton(
                  text: 'Ingresar',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  isPrimary: false),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, left: 25, right: 25),
              child: MainButton(
                text: 'Registrarse',
                isPrimary: true,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StepOneSignUp()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: OuterLink(url: terms, text: 'Terminos y condiciones'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: OuterLink(url: terms, text: 'Politicas de privacidad'),
            )
          ],
        ),
      ),
    );
  }
}
