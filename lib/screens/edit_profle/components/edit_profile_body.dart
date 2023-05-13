import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/edit_profle/components/profile_picture.dart';
import 'package:playrr_app/screens/edit_profle/components/user_data_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final UserProvider _userProvider = Get.find<UserProvider>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ProfilePicture(
            photoUrl: _userProvider.user.photoUrl ?? '',
          ),
          UserDataForm(
              email: _userProvider.user.email,
              name: _userProvider.user.name,
              lastName: _userProvider.user.lastName,
              bio: _userProvider.user.bio ?? ''),
        ],
      ),
    );
  }
}
