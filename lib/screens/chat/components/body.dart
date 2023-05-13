import 'package:flutter/material.dart';
import 'package:playrr_app/screens/chat/components/bottom_input_bar.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Expanded(child: Text('')), BottomInputBar()],
    );
  }
}
