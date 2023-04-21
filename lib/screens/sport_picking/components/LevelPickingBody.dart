import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/MainButton.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/signup.controller.dart';
import 'package:playrr_app/screens/sport_picking/components/LevelList.dart';
import 'package:playrr_app/services/user.service.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<dynamic> _sportLevels = [];
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  void initState() {
    super.initState();
    _getSportLevels();
  }

  Future _getSportLevels() async {
    try {
      //TODO N+1 problem here, it shoudl send back all the levels thoghter with sports, to avoid making multiple queries
      final response =
          await Dio().get('${dotenv.env['API_ENDPOINT']}/sport/levels');
      setState(() {
        _sportLevels = response.data;
      });
      return _sportLevels;
    } catch (e) {
      print(e);
    }
  }

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
                    final sportId = signUpController.pickedSportId();
                    final levelId = signUpController.pickedLevelId();
                    await UserService.instance
                        .setUserSports(sportId, levelId, context);
                  },
                  isPrimary: true)
            ],
          ));
    }
  }
}
