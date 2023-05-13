import 'package:flutter/material.dart';
import 'package:playrr_app/models/event.model.dart';
import 'package:playrr_app/screens/event_participants/components/player_item.dart';

class EventParticipantBody extends StatefulWidget {
  final List<Ticket> playersList;
  const EventParticipantBody({super.key, required this.playersList});

  @override
  State<EventParticipantBody> createState() => _EventParticipantBodyState();
}

class _EventParticipantBodyState extends State<EventParticipantBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: widget.playersList.length,
        itemBuilder: (context, index) {
          return PlayerItem(
            playerId: widget.playersList[index].user.id,
            playerLastName: widget.playersList[index].user.lastName,
            playerName: widget.playersList[index].user.name,
            playerPhotoUrl: widget.playersList[index].user.photoUrl,
          );
        });
  }
}
