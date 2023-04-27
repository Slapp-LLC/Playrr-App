import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/screens/chat/components/appbar.dart';
import 'package:playrr_app/screens/chat/components/body.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black, appBar: ChatAppbar(), body: ChatBody());
  }
}
