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
  void initState() {
    super.initState();
    print(widget.playersList);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            'Jugadores',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Column(
              children: widget.playersList
                  .map((player) => PlayerItem(
                      player_id: player['user']['id'],
                      player_lastName: player['user']['lastName'],
                      player_name: player['user']['name'],
                      player_photoUrl: player['user']['photoUrl']))
                  .toList())
        ],
      ),
    ));
  }
}
// const Text(
//           'Jugadores',
//           style: const TextStyle(color: Colors.white),
//         ),