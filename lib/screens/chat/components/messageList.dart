import 'package:flutter/material.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/chat/components/message_box.dart';

class MessageList extends StatefulWidget {
  final List messages;
  const MessageList({super.key, required this.messages});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: 100,
          reverse: true,
          itemBuilder: (context, index) {
            print(index);
            return MessageBox(
              date: 'Today',
              message: 'Hello',
              messageId: 2,
              index: index,
            );
          }),
    );
  }
}
