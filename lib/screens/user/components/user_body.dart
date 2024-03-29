import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/user.controller.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

class UserBody extends StatefulWidget {
  final int userId;
  const UserBody({super.key, required this.userId});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  final UserController _userController = Get.find<UserController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _userController.getUserData(widget.userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: const Center(
              child: CircularProgressIndicator(
                color: greenPrimaryColor,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: const Center(
              child: Text(
                'Error loading event data',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          final userData = snapshot.data;
          return SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: userData?['photoUrl'] != null &&
                            userData?['photoUrl'].isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(userData?['photoUrl']),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage('assets/images/Avatar.png'),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '${userData?['name']} ${userData?['lastName']}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Bebas neue',
                          fontSize: 25),
                    )),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: greenPrimaryColor.withOpacity(0.44), width: 1.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pushNamed(context, RoutePaths.chatUser,
                          arguments: widget.userId);
                    },
                    icon: SvgPicture.asset('assets/icons/MessageGreenIcon.svg'),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 5),
                            child: Text(
                              'Sobre mi',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            userData?['bio'] ?? 'No bio yet.',
                            style: const TextStyle(
                                color: bodyTextColor, fontSize: 17),
                          )
                        ])),
              ],
            ),
          ));
        }
      },
    );
  }
}
