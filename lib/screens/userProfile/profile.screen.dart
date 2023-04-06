import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/components/MainAppBar.dart';
import 'package:playrr_app/components/SecondaryAppBar.dart';
import 'package:playrr_app/screens/userProfile/components/body.dart';

class MyUserProfile extends StatelessWidget {
  const MyUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryAppBar(),
      body: Body(),
    );
  }
}
