import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/models/sport.model.dart';
import 'package:playrr_app/models/myUser.model.dart';
import 'package:playrr_app/providers/events.provider.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/home/components/MySportCard.dart';
import 'package:get/instance_manager.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class MySportsSlider extends StatefulWidget {
  const MySportsSlider({super.key});

  @override
  State<MySportsSlider> createState() => _MySportsSliderState();
}

class _MySportsSliderState extends State<MySportsSlider> {
  final userController = Get.find<UserController>();
  final eventsController = Get.find<EventsController>();
  final EventsProvider _eventsProvider = Get.find<EventsProvider>();
  UserProvider userProvider = Get.find<UserProvider>();
  List<Sport> _sports = [];
  @override
  void initState() {
    super.initState();
    _getUserSports();
    MyUserModel currentUser = userProvider.user;
  }

  void _getUserSports() {
    setState(() {
      _sports = _eventsProvider.sports;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _sports.length,
              itemBuilder: (BuildContext context, int index) {
                Sport sport = _sports[index];
                return MySportCard(
                  index: index,
                  photoURl: sport.iconUrl,
                  name: sport.name,
                  sportId: sport.id,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
