import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/edit_profle/components/profile_picture.dart';
import 'package:playrr_app/screens/edit_profle/components/user_data_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final userController = Get.find<UserController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(userController.userData);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ProfilePicture(
            photoUrl: userController.userData['photoUrl'],
          ),
          UserDataForm(
              email: userController.userData['email'],
              name: userController.userData['name'],
              lastName: userController.userData['lastName'],
              bio: ''),
        ],
      ),
    );
  }
}
