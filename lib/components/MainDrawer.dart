import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/screens/landing/landing.screen.dart';
import 'package:playrr_app/screens/userProfile/profile.screen.dart';
import 'package:playrr_app/services/authentication_service.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryBackground,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              curve: Curves.bounceIn,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      'assets/images/Avatar.png',
                      width: 80,
                    ),
                  ),
                  Text(
                    '${userController.userData['name']} ${userController.userData['lastName']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              )),
          ListTile(
            title: const Text(
              'Mi Perfil',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'myProfile');
            },
          ),
          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {
              AuthService.instance.logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LandingScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
