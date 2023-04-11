import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/home/components/MySportsSlider.dart';
import 'package:playrr_app/screens/home/components/resultList.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final eventsController = Get.find<EventsController>();
  final userController = Get.find<UserController>();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _refreshData() async {
    // Call the API or perform any data loading operations here
    final response =
        await Dio().get('${dotenv.env['API_ENDPOINT']}/event/filter');
    eventsController.setEventResultList(response.data);
    return;
  }

  Future _getEventSports() async {
    final response =
        await Dio().get('${dotenv.env['API_ENDPOINT']}/event/filter');
    eventsController.setEventResultList(response.data);
    if (eventsController.currentSportSelection.value == 0) {
      eventsController.setCurrentSportSelection(
          userController.userData['userSports'][0]['sportId']);
    }
  }

  @override
  void initState() {
    super.initState();
    _getEventSports();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (eventsController.eventResultList.isEmpty) {
        return Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: const Center(
            child: CircularProgressIndicator(
              color: greenPrimaryColor,
            ),
          ),
        );
      } else {
        return RefreshIndicator(
            backgroundColor: Colors.black,
            color: greenPrimaryColor,
            onRefresh: _refreshData,
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Tus deportes',
                        style: TextStyle(
                          fontFamily: 'Bebas neue',
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const MySportsSlider(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Recomendados',
                        style: TextStyle(
                          fontFamily: 'Bebas neue',
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    EventResultList(
                      resultsData: eventsController.eventResultList,
                    ),
                  ],
                ),
              ),
            ));
      }
    });
  }
}
