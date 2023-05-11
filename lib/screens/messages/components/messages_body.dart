import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/controllers/chats.controller.dart';
import 'package:playrr_app/providers/chat.provider.dart';
import 'package:playrr_app/screens/messages/components/chat_item.dart';

class MessagesBody extends StatefulWidget {
  const MessagesBody({Key? key}) : super(key: key);

  @override
  State<MessagesBody> createState() => _MessagesBodyState();
}

class _MessagesBodyState extends State<MessagesBody> {
  final ChatProvider _chatProvider = Get.find<ChatProvider>();
  final ChatController _chatController = Get.find<ChatController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatController.getMyChats();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Obx(() {
        return ListView.builder(
          itemCount: _chatProvider.chats.length,
          itemBuilder: (context, index) {
            return ChatItem(chat: _chatProvider.chats[index]);
          },
        );
      }),
    );
  }
}
