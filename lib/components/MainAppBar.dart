import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/user.controller.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    print(userController.userData['photoUrl']);
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[Container()], // this will hide endDrawer hamburger icon
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Playrr',
            style: TextStyle(fontFamily: 'Medula One', fontSize: 30),
          ),
          SizedBox(
              width: 52,
              height: 52,
              child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: CircleAvatar(
                    backgroundColor: greenPrimaryColor,
                    radius: 175,
                    child: CircleAvatar(
                      backgroundImage: userController.userData['photoUrl'] !=
                                  null &&
                              userController.userData['photoUrl'].isNotEmpty
                          ? NetworkImage(userController.userData['photoUrl'])
                          : Image.asset('assets/images/Avatar.png').image,
                      radius: 90,
                    ),
                  ))),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
