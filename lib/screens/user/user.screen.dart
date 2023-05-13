import 'package:flutter/material.dart';
import 'package:playrr_app/components/secondary_appbar.dart';
import 'package:playrr_app/screens/user/components/user_body.dart';

class UserPage extends StatefulWidget {
  final int userId;
  const UserPage({super.key, required this.userId});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const SecondaryAppBar(),
      body: UserBody(
        userId: widget.userId,
      ),
    );
  }
}
