import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/my_events/components/inConmingEvents.dart';
import 'package:playrr_app/screens/my_events/components/passedEvents.dart';

class MyEventsBody extends StatefulWidget {
  const MyEventsBody({super.key});

  @override
  State<MyEventsBody> createState() => _MyEventsBodyState();
}

class _MyEventsBodyState extends State<MyEventsBody> {
  late List<dynamic>? _incomingEvents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userController = Get.find<UserController>();
    _incomingEvents = userController.userData['matches'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: TabBarView(
        children: [
          InconmingEvents(incomingEvents: _incomingEvents!),
          PassedEvents(),
        ],
      ),
    );
  }
}
