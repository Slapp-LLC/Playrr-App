import 'package:flutter/material.dart';
import 'package:playrr_app/screens/login/components/loginForm.dart';
import 'package:playrr_app/screens/passwordRecovery/passwordRecover.screen.dart';

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
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 29, right: 29),
                  child: LoginForm()),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PasswordRecovery()));
                    },
                    style: const ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    child: const Text(
                      'Olvide mi contraseña',
                      style: TextStyle(color: Colors.white60),
                    )),
              )
            ],
          ),
        ));
  }
}
