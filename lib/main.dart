import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/signup.controller.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
import 'package:playrr_app/screens/login/login.screen.dart';
import 'package:playrr_app/screens/landing/landing.screen.dart';
import 'package:playrr_app/screens/messages/messages.screen.dart';
import 'package:playrr_app/screens/myEvents/myEvents.screen.dart';
import 'package:playrr_app/screens/notifications/notifications.screen.dart';
import 'package:playrr_app/screens/search/search.screen.dart';
import 'package:playrr_app/screens/signup/steOneSignUp.screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:playrr_app/screens/userProfile/profile.screen.dart';
import 'package:playrr_app/services/authentication_service.dart';

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
  final UserController userController = Get.put(UserController());
  final SignUpController signUpController = Get.put(SignUpController());

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
        future: AuthService.instance.getCurrentUser(context),
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
        '/myProfile': (context) => const MyUserProfile(),
        '/myEvents': (context) => const MyEvents(),
        '/searchPage': (context) => const SearchPage(),
        '/notifications': (context) => const NotificationPage(),
        '/messages': (context) => const MessagesPage()
      },
    );
  }
}
