import 'package:flutter/material.dart';
import 'package:playrr_app/components/SecondaryAppBar.dart';
import 'package:playrr_app/screens/my_profile/components/body.dart';

class MyUserProfile extends StatelessWidget {
  const MyUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: SecondaryAppBar(
        title: 'Mi perfil',
      ),
      body: Body(),
    );
  }
}
