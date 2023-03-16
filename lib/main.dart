import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
import 'package:playrr_app/screens/login/login.screen.dart';
import 'package:playrr_app/screens/landing/landing.screen.dart';
import 'package:playrr_app/screens/stepOne/steOneSignUp.screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/utils/check_session.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playrr',
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      home: FutureBuilder<bool>(
        future: checkSession(),
        builder: (context, spanshot) {
          if (spanshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                    child: Column(children: [
                  Image.asset('assets/images/Splash.png'),
                  const CircularProgressIndicator(
                    color: greenPrimaryColor,
                  )
                ])));
          } else {
            final bool isLoggedIn = spanshot.data!;
            return isLoggedIn ? const Home() : const LandingScreen();
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup/stepOne': (context) => const StepOneSignUp(),
        '/home': (context) => const Home(),
      },
    );
  }
}
