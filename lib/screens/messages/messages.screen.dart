import 'package:flutter/material.dart';
import 'package:playrr_app/components/navigation_bar.dart';
import 'package:playrr_app/components/secondary_appbar.dart';
import 'package:playrr_app/screens/messages/components/messages_body.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(
        title: 'Chats',
      ),
      body: const MessagesBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        context: context,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
