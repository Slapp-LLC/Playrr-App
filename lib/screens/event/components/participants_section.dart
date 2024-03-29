import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/avatar.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/models/event.model.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/event/components/participants_image_list.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class ParticipantsSection extends StatefulWidget {
  final String? hostAvatar;
  final int hostId;
  final spotsNumber;
  final List<Ticket> playersList;

  const ParticipantsSection(
      {super.key,
      this.hostAvatar,
      required this.hostId,
      required this.spotsNumber,
      required this.playersList});

  @override
  State<ParticipantsSection> createState() => _ParticipantsSectionState();
}

class _ParticipantsSectionState extends State<ParticipantsSection> {
  // final userController = Get.find<UserController>();

  final UserProvider _userProvider = Get.find<UserProvider>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: secondaryBackground,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Host',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    if (widget.hostId == _userProvider.user.id) {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.myProfile,
                      );
                    } else {
                      Navigator.pushNamed(context, RoutePaths.user,
                          arguments: widget.hostId);
                    }
                  },
                  child: AvatarImage(photoUrl: widget.hostAvatar),
                ),
              )
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Players ${widget.playersList.length} /${widget.spotsNumber}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            widget.playersList.isEmpty
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text('Se el primero!',
                        style: TextStyle(color: Colors.white)))
                : GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutePaths.eventParticipants,
                          arguments: widget.playersList);
                    },
                    child: SizedBox(
                        width: 130,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ParticipantImageList(
                                playerList: widget.playersList))))
          ])
        ],
      ),
    );
  }
}
