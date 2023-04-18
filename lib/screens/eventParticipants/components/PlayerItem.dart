import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/Avatar.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class PlayerItem extends StatefulWidget {
  final int player_id;
  final String player_photoUrl;
  final String player_name;
  final String player_lastName;
  const PlayerItem(
      {super.key,
      required this.player_id,
      required this.player_lastName,
      required this.player_name,
      required this.player_photoUrl});

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
                    arguments: widget.player_id);
              },
              child: Row(
                children: [
                  AvatarImage(photoUrl: widget.player_photoUrl),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '${widget.player_name} ${widget.player_lastName}',
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
