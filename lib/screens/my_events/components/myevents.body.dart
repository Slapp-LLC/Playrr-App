import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/my_events/components/incoming_events.dart';
import 'package:playrr_app/screens/my_events/components/passedEvents.dart';

class MyEventsBody extends StatefulWidget {
  const MyEventsBody({super.key});

  @override
  State<MyEventsBody> createState() => _MyEventsBodyState();
}

class _MyEventsBodyState extends State<MyEventsBody> {
  final UserProvider _userProvider = Get.find<UserProvider>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: TabBarView(
        children: [
          InconmingEvents(incomingEvents: _userProvider.user.matches),
          PassedEvents(incomingEvents: _userProvider.user.matches),
        ],
      ),
    );
  }
}
