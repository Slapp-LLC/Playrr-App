import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/providers/location.provider.dart';
import 'package:playrr_app/providers/user.provider.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Get.find<UserProvider>();
    final LocationProvider locationProvider = Get.find<LocationProvider>();
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[Container()], // this will hide endDrawer hamburger icon
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/LocationGreenIcon.svg',
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Obx(() {
                  return Text(
                    locationProvider.locality.value,
                    style: const TextStyle(fontSize: 15),
                  );
                }),
              )
            ],
          ),
          SizedBox(
              width: 52,
              height: 52,
              child: IconButton(
                  color: secondaryBackground,
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: CircleAvatar(
                    backgroundColor: secondaryBackground,
                    radius: 175,
                    child: CircleAvatar(
                      backgroundColor: secondaryBackground,
                      backgroundImage: userProvider.user.photoUrl != null
                          ? NetworkImage(userProvider.user.photoUrl!)
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
