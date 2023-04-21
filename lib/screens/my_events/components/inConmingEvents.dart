import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:get/get.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/home/components/EventCard.dart';

class InconmingEvents extends StatefulWidget {
  final List incomingEvents;
  const InconmingEvents({super.key, required this.incomingEvents});

  @override
  State<InconmingEvents> createState() => _InconmingEventsState();
}

class _InconmingEventsState extends State<InconmingEvents> {
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.incomingEvents.length,
        itemBuilder: (context, index) {
          return EventCard(
              eventId: widget.incomingEvents[index]['event']['id'],
              eventTitle: widget.incomingEvents[index]['event']['title'],
              eventDate: widget.incomingEvents[index]['event']['startDate'],
              eventLevel: widget.incomingEvents[index]['event']['level']
                  ['name'],
              eventAddress: widget.incomingEvents[index]['event']['location'],
              eventPhotoUrl: widget.incomingEvents[index]['event']
                  ['eventPhoto'],
              eventSpots: widget.incomingEvents[index]['event']['spots'],
              //Todo Make this dynamic
              attendingAmount: 10);
        });
  }
}
