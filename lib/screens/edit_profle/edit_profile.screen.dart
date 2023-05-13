import 'package:flutter/material.dart';
import 'package:playrr_app/components/SecondaryAppBar.dart';
import 'package:playrr_app/screens/edit_profle/components/edit_profile_body.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryAppBar(),
      body: Body(),
      backgroundColor: Colors.black,
    );
  }
}
