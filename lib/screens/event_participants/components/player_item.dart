import 'package:flutter/material.dart';
import 'package:playrr_app/components/avatar.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class PlayerItem extends StatefulWidget {
  final int playerId;
  final String? playerPhotoUrl;
  final String playerName;
  final String playerLastName;
  const PlayerItem(
      {super.key,
      required this.playerId,
      required this.playerLastName,
      required this.playerName,
      required this.playerPhotoUrl});

  @override
  State<PlayerItem> createState() => _PlayerItemState();
}

class _PlayerItemState extends State<PlayerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.User,
                    arguments: widget.playerId);
              },
              child: Row(
                children: [
                  AvatarImage(photoUrl: widget.playerPhotoUrl),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '${widget.playerName} ${widget.playerLastName}',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
