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
    return ListView.builder(
      itemCount: widget.resultsData.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: EventCard(
              eventTitle: widget.resultsData[index]['title'],
              eventDate: widget.resultsData[index]['startDate'],
              eventLevel: widget.resultsData[index]['level']['name'],
              eventAddress: widget.resultsData[index]['location'],
              eventSpots: widget.resultsData[index]['spots'],
            ));
      },
    );
  }
}
