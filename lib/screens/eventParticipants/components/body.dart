import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/screens/eventParticipants/components/PlayerItem.dart';

class EventParticipantBody extends StatefulWidget {
  final List playersList;
  const EventParticipantBody({super.key, required this.playersList});

  @override
  State<EventParticipantBody> createState() => _EventParticipantBodyState();
}

class _EventParticipantBodyState extends State<EventParticipantBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: widget.playersList.length,
        itemBuilder: (context, index) {
          return PlayerItem(
            player_id: widget.playersList[index]['user']['id'],
            player_lastName: widget.playersList[index]['user']['lastName'],
            player_name: widget.playersList[index]['user']['name'],
            player_photoUrl: widget.playersList[index]['user']['photoUrl'],
          );
        });
    ;
  }
}
// const Text(
//           'Jugadores',
//           style: const TextStyle(color: Colors.white),
//         ),