import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/providers/events.provider.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/home/components/sport_slider.dart';
import 'package:playrr_app/screens/home/components/result_list.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final EventsController _eventsController = Get.find<EventsController>();
  final _eventsProvider = Get.find<EventsProvider>();
  final UserProvider _userProvider = Get.find<UserProvider>();
  final userController = Get.find<UserController>();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  //Todo make a controller for this []
  Future<void> _refreshData() async {
    // Call the API or perform any data loading operations here
    // final response = await Dio().get('${dotenv.env['API_ENDPOINT']}/event');
    // eventsController.setEventResultList(response.data);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _eventsController.getRecomendedEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: const Center(
                    child: CircularProgressIndicator(
                  color: greenPrimaryColor,
                )));
          } else if (snapshot.hasError) {
            return const Text(
              'Error',
              style: TextStyle(color: Colors.white),
            );
          } else {
            return RefreshIndicator(
                backgroundColor: Colors.black,
                color: greenPrimaryColor,
                onRefresh: _refreshData,
                child: const SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MySportsSlider(),
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 20),
                        child: Text(
                          'Recomendados',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Bebas neue'),
                        ),
                      ),
                      EventResultList()
                    ],
                  ),
                ));
          }
        });
  }
}
