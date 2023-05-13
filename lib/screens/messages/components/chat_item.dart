import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/components/avatar.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/models/chat/chat.model.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/utils/date.utils.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class ChatItem extends StatefulWidget {
  final ChatModel chat;

  const ChatItem({Key? key, required this.chat}) : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  String? formattedDate;
  final UserProvider _userProvider = Get.find<UserProvider>();

  @override
  void initState() {
    super.initState();
    if (widget.chat.messages.isNotEmpty) {
      formattedDate =
          DateUtil.formatDate(widget.chat.messages.last.createdAt.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final lastMessage =
        widget.chat.messages.isNotEmpty ? widget.chat.messages.first : null;
    final otherParticipant = widget.chat.participants
        .firstWhere((participant) => participant.id != _userProvider.user.id);

    if (lastMessage == null) {
      return const SizedBox.shrink();
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutePaths.chatUser,
              arguments: otherParticipant.id);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: secondaryBackground),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvatarImage(photoUrl: otherParticipant.photoUrl),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${otherParticipant.name} ${otherParticipant.lastName}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            formattedDate!, // You might need to format this date string
                            style: const TextStyle(color: bodyTextColor),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lastMessage.content,
                              style: const TextStyle(
                                color: bodyTextColor,
                                fontSize: 17,
                              ),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: const BoxDecoration(
                                  color: greenPrimaryColor,
                                  shape: BoxShape.circle),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
