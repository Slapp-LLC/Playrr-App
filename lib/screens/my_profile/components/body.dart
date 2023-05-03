import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

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
              image: _userProvider.user.photoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(_userProvider.user.photoUrl!),
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
                '${_userProvider.user.name} ${_userProvider.user.lastName}',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Bebas neue',
                    fontSize: 25),
              )),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, RoutePaths.EditMyProfile);
            },
            icon: SvgPicture.asset('assets/icons/EditIcon.svg'),
            label: const Text(
              'Editar perfil',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  width: 1,
                  color: greenPrimaryColor.withOpacity(0.44),
                ),
              ),
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
                      _userProvider.user.bio ?? 'No bio yet.',
                      style:
                          const TextStyle(color: bodyTextColor, fontSize: 17),
                    )
                  ])),
        ],
      ),
    ));
  }
}
