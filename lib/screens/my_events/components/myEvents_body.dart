import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/my_events/components/inConmingEvents.dart';
import 'package:playrr_app/screens/my_events/components/passedEvents.dart';

class MyEventsBody extends StatefulWidget {
  const MyEventsBody({super.key});

  @override
  State<MyEventsBody> createState() => _MyEventsBodyState();
}

class _MyEventsBodyState extends State<MyEventsBody> {
  late List<dynamic>? _incomingEvents = [];
  final userProvider = Get.put<UserProvider>(UserProvider());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incomingEvents = userProvider.user.matches;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: TabBarView(
        children: [
          InconmingEvents(incomingEvents: _incomingEvents!),
          PassedEvents(incomingEvents: _incomingEvents!),
        ],
      ),
    );
  }
}
