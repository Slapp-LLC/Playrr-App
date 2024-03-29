import 'package:flutter/material.dart';
import 'package:playrr_app/components/secondary_appbar.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/event/components/body.dart';

class EventPage extends StatefulWidget {
  final int id;
  const EventPage({super.key, required this.id});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: generalBackground,
      appBar: const SecondaryAppBar(),
      body: EventBody(eventId: widget.id),
    );
  }
}
