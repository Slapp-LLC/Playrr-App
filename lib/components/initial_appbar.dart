import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitialAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InitialAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text('Playrr',
          style: TextStyle(fontFamily: 'Medula One', fontSize: 50)),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/BackIcon.svg',
          width: 32,
          height: 32,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
