import 'package:flutter/material.dart';
import 'package:playrr_app/screens/event/event.screen.dart';
import 'package:playrr_app/screens/eventParticipants/eventParticipants.screen.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
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
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
