import 'package:flutter/material.dart';
import 'package:playrr_app/screens/event/event.screen.dart';
import 'package:playrr_app/screens/home/home.screen.dart';
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
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
