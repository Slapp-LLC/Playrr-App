import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/screens/home/components/EventCard.dart';

class EventResultList extends StatefulWidget {
  final List resultsData;
  const EventResultList({super.key, required this.resultsData});
  @override
  State<EventResultList> createState() => _EventResultListState();
}

class _EventResultListState extends State<EventResultList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.resultsData.map((resultData) {
        return Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: EventCard(
            eventTitle: resultData['title'],
            eventDate: resultData['startDate'],
            eventLevel: resultData['level']['name'],
            eventAddress: resultData['location'],
            eventSpots: resultData['spots'],
            eventPhotoUrl: resultData['eventPhoto'],
          ),
        );
      }).toList(),
    );
  }
}
