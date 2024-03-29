import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/main_button.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/auth.controller.dart';
import 'package:playrr_app/screens/sport_picking/components/level_list.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<dynamic> _sportLevels = [];
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() async {
    super.initState();
    _sportLevels = await authController.getSportsLevels();
  }

  //Todo SportLevels
  // Future _getSportLevels() async {
  //   try {
  //     //TODO N+1 problem here, it shoudl send back all the levels thoghter with sports, to avoid making multiple queries
  //     final response =
  //         await Dio().get('${dotenv.env['API_ENDPOINT']}/sport/levels');
  //     setState(() {
  //       _sportLevels = response.data;
  //     });
  //     return _sportLevels;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (_sportLevels.isEmpty) {
      return Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: const Center(
          child: CircularProgressIndicator(color: greenPrimaryColor),
        ),
      );
    } else {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              Expanded(
                child: LevelList(
                  levelsData: _sportLevels,
                ),
              ),
              MainButton(
                  text: 'Empezar',
                  onPressed: () async {
                    final sportId = authController.pickedSportId();
                    final levelId = authController.pickedLevelId();
                    // await UserService.instance
                    //     .setUserSports(sportId, levelId, context);
                  },
                  isPrimary: true)
            ],
          ));
    }
  }
}
