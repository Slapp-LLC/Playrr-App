import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/screens/event_participants/components/body.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Jugadores',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/SecondaryBackButton.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: EventParticipantBody(
        playersList: widget.usersList,
      ),
    );
  }
}
