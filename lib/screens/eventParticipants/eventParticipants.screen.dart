import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/SecondaryAppBar.dart';
import 'package:playrr_app/screens/eventParticipants/components/body.dart';

class EventParticipantsPage extends StatefulWidget {
  final usersList;
  const EventParticipantsPage({super.key, this.usersList});

  @override
  State<EventParticipantsPage> createState() => _EventParticipantsPageState();
}

class _EventParticipantsPageState extends State<EventParticipantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const SecondaryAppBar(),
      body: EventParticipantBody(
        playersList: widget.usersList,
      ),
    );
  }
}
