import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/auth.controller.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/providers/events.provider.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
import 'package:playrr_app/screens/login/login.screen.dart';
import 'package:playrr_app/screens/landing/landing.screen.dart';
import 'package:playrr_app/screens/messages/messages.screen.dart';
import 'package:playrr_app/screens/my_events/myEvents.screen.dart';
import 'package:playrr_app/screens/my_profile/my_profile.screen.dart';
import 'package:playrr_app/screens/notifications/notifications.screen.dart';
import 'package:playrr_app/screens/post_signup/secondStep/stepTwo.screen.dart';
import 'package:playrr_app/screens/search/search.screen.dart';
import 'package:playrr_app/screens/signup/steOneSignUp.screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'utils/router.utils.dart';

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
  //State Initialization
  final UserController userController = Get.put(UserController());
  final AuthController authController = Get.put(AuthController());
  final EventsController eventsController = Get.put(EventsController());
  final UserProvider userProvider = Get.put(UserProvider());
  final EventsProvider eventsProvider = Get.put(EventsProvider());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Playrr',
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      home: FutureBuilder<bool>(
        future: authController.getCurrenUser(),
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
            print(isLoggedIn);
            return isLoggedIn ? const Home() : const LandingScreen();
          }
        },
      ),
      onGenerateRoute: RouterGen.generatedRoute,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup/stepOne': (context) => const StepOneSignUp(),
        '/signup/stepTwo': (context) => const StepTwo(),
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
