import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/auth.controller.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/screens/landing/landing.screen.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final UserProvider _userProvider = Get.put(UserProvider());
  final AuthController authController = AuthController();
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
              child: Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border:
                              Border.all(color: secondaryBackground, width: 3),
                          image: _userProvider.user.photoUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                      _userProvider.user.photoUrl!),
                                  fit: BoxFit.cover,
                                )
                              : const DecorationImage(
                                  image: AssetImage('assets/images/Avatar.png'),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Text(
                      '${_userProvider.user.name} ${_userProvider.user.lastName}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                );
              })),
          ListTile(
            title: const Text(
              'Mi Perfil',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.MyProfile);
            },
          ),
          ListTile(
            title: const Text(
              'Configuraciones',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Get.toNamed(RoutePaths.Settings);
            },
          ),
          ListTile(
            title: const Text(
              'Preguntas frencuentes',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Get.toNamed(RoutePaths.Questions);
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
              authController.logOut();
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
