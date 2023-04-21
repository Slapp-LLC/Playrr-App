import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/Avatar.dart';
import 'package:playrr_app/constants.dart';

class ParticipantImageList extends StatefulWidget {
  final List playerList;
  const ParticipantImageList({super.key, required this.playerList});

  @override
  State<ParticipantImageList> createState() => _ParticipantImageListState();
}

class _ParticipantImageListState extends State<ParticipantImageList> {
  @override
  void initState() {
    // TODO: implement initState

    print(widget.playerList[0]['user']['photoUrl']);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.playerList.isEmpty)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: const Text('Se el primero!',
                  style: TextStyle(color: Colors.white))),
        if (widget.playerList.isNotEmpty && widget.playerList.length > 0)
          Positioned(
            child:
                AvatarImage(photoUrl: widget.playerList[0]['user']['photoUrl']),
          ),
        // if (widget.playerList.isNotEmpty && widget.playerList.length > 1)
        //   Positioned(
        //     left: 25,
        //     child:
        //         AvatarImage(photoUrl: widget.playerList[1]['user']['photoUrl']),
        //   ),
        // if (widget.playerList.isNotEmpty && widget.playerList.length > 2)
        //   Positioned(
        //     left: 50,
        //     child:
        //         AvatarImage(photoUrl: widget.playerList[2]['user']['photoUrl']),
        //   ),
        // if (widget.playerList.length > 3 && widget.playerList.isNotEmpty)
        //   Positioned(
        //     left: 75,
        //     child: Container(
        //       width: 50.5,
        //       height: 50.5,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(25),
        //           border:
        //               Border.all(color: greenPrimaryColor.withOpacity(0.50))),
        //       child: ClipRRect(
        //         borderRadius: BorderRadius.circular(25),
        //         child: BackdropFilter(
        //           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //           child: Container(
        //               decoration: BoxDecoration(
        //                 color: const Color(0x001e2021).withOpacity(0.4),
        //                 borderRadius: BorderRadius.circular(25),
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   '+${widget.playerList.length - 3}',
        //                   textAlign: TextAlign.center,
        //                   style: const TextStyle(
        //                       fontSize: 17,
        //                       color: greenPrimaryColor,
        //                       fontWeight: FontWeight.w600),
        //                 ),
        //               )),
        //         ),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
