import 'package:flutter/material.dart';
import 'package:playrr_app/screens/chat/chat.screen.dart';
import 'package:playrr_app/screens/edit_profle/edit_profile.screen.dart';
import 'package:playrr_app/screens/event/event.screen.dart';
import 'package:playrr_app/screens/eventChat/eventChat.screen.dart';
import 'package:playrr_app/screens/event_participants/eventParticipants.screen.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
import 'package:playrr_app/screens/my_profile/my_profile.screen.dart';
import 'package:playrr_app/screens/post_signup/secondStep/stepTwo.screen.dart';
import 'package:playrr_app/screens/questions/questions.screen.dart';
import 'package:playrr_app/screens/rules/rules.screen.dart';
import 'package:playrr_app/screens/settings/settings.screen.dart';
import 'package:playrr_app/screens/sport_picking/levelPicking.screen.dart';
import 'package:playrr_app/screens/sport_picking/sportPicking.screen.dart';
import 'package:playrr_app/screens/user/user.screen.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class RouterGen {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case (RoutePaths.event):
        var data = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => EventPage(
                  id: data,
                ));
      case (RoutePaths.eventParticipants):
        var data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => EventParticipantsPage(usersList: data));
      case (RoutePaths.user):
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => UserPage(userId: data));

      case (RoutePaths.stepTwoSignUp):
        return MaterialPageRoute(builder: (_) => const StepTwo());

      case (RoutePaths.myProfile):
        return MaterialPageRoute(builder: (_) => const Home());

      case (RoutePaths.sportsPicking):
        return MaterialPageRoute(builder: (_) => const SportPickingScreen());

      case (RoutePaths.editProfile):
        return MaterialPageRoute(builder: (_) => const EditProfile());

      case (RoutePaths.chatUser):
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => Chat(userId: data));

      case (RoutePaths.levelPicking):
        return MaterialPageRoute(builder: (_) => const LevelPickingScreen());

      case (RoutePaths.eventChat):
        return MaterialPageRoute(builder: (_) => const EventChatScreen());

      case (RoutePaths.rules):
        return MaterialPageRoute(builder: (_) => const RulesScreen());

      case (RoutePaths.settings):
        return MaterialPageRoute(builder: (_) => const ConfigScreen());

      case (RoutePaths.questions):
        return MaterialPageRoute(builder: (_) => const Questions());

      default:
        return MaterialPageRoute(builder: (_) => const MyUserProfile());
    }
  }
}
