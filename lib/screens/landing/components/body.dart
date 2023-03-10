import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/MainButton.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  void printHello() {
    print('Hello');
  }

  @override
  Widget build(BuildContext context) {
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
                    printHello();
                  },
                  isPrimary: false),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, left: 25, right: 25),
              child: MainButton(
                text: 'Registrarse',
                isPrimary: true,
                onPressed: () {
                  printHello();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
