import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:get/get.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/home/components/EventCard.dart';
import 'package:playrr_app/screens/my_events/components/no_events.dart';

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
    final now = DateTime.now().toUtc();
    final incomingEvents = widget.incomingEvents.where((event) {
      final eventDate = DateTime.parse(event['event']['startDate']).toUtc();
      return now.isBefore(eventDate);
    }).toList();
    return incomingEvents.isNotEmpty
        ? ListView.builder(
            itemCount: incomingEvents.length,
            itemBuilder: (context, index) {
              return EventCard(
                  eventId: incomingEvents[index]['event']['id'],
                  eventTitle: incomingEvents[index]['event']['title'],
                  eventDate: incomingEvents[index]['event']['startDate'],
                  eventLevel: incomingEvents[index]['event']['level']['name'],
                  eventAddress: incomingEvents[index]['event']['location'],
                  eventPhotoUrl: incomingEvents[index]['event']['eventPhoto'],
                  eventSpots: incomingEvents[index]['event']['spots'],
                  //Todo Make this dynamic
                  attendingAmount: 10);
            })
        : const NoEvents();
  }
}
