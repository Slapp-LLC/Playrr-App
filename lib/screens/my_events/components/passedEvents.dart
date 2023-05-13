import 'package:flutter/material.dart';
import 'package:playrr_app/screens/home/components/event_card.dart';
import 'package:playrr_app/screens/my_events/components/no_events.dart';

class PassedEvents extends StatefulWidget {
  final List? incomingEvents;
  const PassedEvents({super.key, required this.incomingEvents});

  @override
  State<PassedEvents> createState() => _PassedEventsState();
}

class _PassedEventsState extends State<PassedEvents> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().toUtc();
    final passedEvents = widget.incomingEvents?.where((event) {
          final eventDate = DateTime.parse(event['event']['startDate']).toUtc();
          return eventDate.isBefore(now);
        }).toList() ??
        [];

    return passedEvents.isNotEmpty
        ? ListView.builder(
            itemCount: passedEvents.length,
            itemBuilder: (context, index) {
              return EventCard(
                  eventId: passedEvents[index]['event']['id'],
                  eventTitle: passedEvents[index]['event']['title'],
                  eventDate: passedEvents[index]['event']['startDate'],
                  eventLevel: passedEvents[index]['event']['level']['name'],
                  eventAddress: passedEvents[index]['event']['location'],
                  eventPhotoUrl: passedEvents[index]['event']['eventPhoto'],
                  eventSpots: passedEvents[index]['event']['spots'],
                  //Todo Make this dynamic
                  attendingAmount: 10);
            })
        : const NoEvents();
  }
}
