import 'package:flutter/material.dart';
import 'package:playrr_app/screens/chat/components/app_bar.dart';
import 'package:playrr_app/screens/chat/components/body.dart';

class Chat extends StatefulWidget {
  final int userId;
  const Chat({super.key, required this.userId});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black, appBar: ChatAppbar(), body: ChatBody());
  }
}
