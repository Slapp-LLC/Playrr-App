import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/models/user.model.dart';
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
  UserProvider userProvider = Get.find<UserProvider>();
  List<dynamic> _sportLevels = [];
  @override
  void initState() {
    super.initState();
    _getUserSports();
    UserModel currentUser = userProvider.user;
    print(currentUser.userSports);
  }

  void _getUserSports() {
    setState(() {
      _sportLevels = userProvider.user.userSports;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      margin: const EdgeInsets.only(bottom: 25, top: 10),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _sportLevels.length,
              itemBuilder: (BuildContext context, int index) {
                UserSport sportLevel = _sportLevels[index];
                return MySportCard(
                  index: index,
                  photoURl: sportLevel.sport.iconUrl,
                  name: sportLevel.sport.name,
                  sportId: sportLevel.sport.id,
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.SportPicking);
            },
            icon: SvgPicture.asset('assets/icons/AddIcon.svg'),
          ),
        ],
      ),
    );
  }
}
