import 'package:flutter/material.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
import 'package:playrr_app/screens/login/login.screen.dart';
import 'package:playrr_app/screens/landing/landing.screen.dart';
import 'package:playrr_app/screens/signup/signup.screen.dart';
import 'package:playrr_app/screens/stepOne/steOneSignUp.screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playrr',
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      home: const LandingScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/signup/stepOne': (context) => const StepOneSignUp(),
        '/home': (context) => const Home(),
      },
    );
  }
}
