import 'package:flutter/material.dart';
import 'package:playrr_app/screens/chat/chat.screen.dart';
import 'package:playrr_app/screens/edit_profle/edit_profile.screen.dart';
import 'package:playrr_app/screens/event/event.screen.dart';
import 'package:playrr_app/screens/event_participants/eventParticipants.screen.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
import 'package:playrr_app/screens/my_profile/my_profile.screen.dart';
import 'package:playrr_app/screens/post_signup/secondStep/stepTwo.screen.dart';
import 'package:playrr_app/screens/sport_picking/levelPicking.screen.dart';
import 'package:playrr_app/screens/sport_picking/sportPicking.screen.dart';
import 'package:playrr_app/screens/user/user.screen.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class RouterGen {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case (RoutePaths.Event):
        var data = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => EventPage(
                  id: data,
                ));
      case (RoutePaths.EventParticipants):
        var data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => EventParticipantsPage(usersList: data));
      case (RoutePaths.User):
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => UserPage(userId: data));

      case (RoutePaths.StepTwoSignUp):
        return MaterialPageRoute(builder: (_) => const StepTwo());

      case (RoutePaths.MyProfile):
        return MaterialPageRoute(builder: (_) => const Home());

      case (RoutePaths.SportPicking):
        return MaterialPageRoute(builder: (_) => const SportPickingScreen());

      case (RoutePaths.EditMyProfile):
        return MaterialPageRoute(builder: (_) => const EditProfile());

      case (RoutePaths.ChatUser):
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => Chat(userId: data));

      case (RoutePaths.LevelPicking):
        return MaterialPageRoute(builder: (_) => const LevelPickingScreen());

      default:
        return MaterialPageRoute(builder: (_) => const MyUserProfile());
    }
  }
}
