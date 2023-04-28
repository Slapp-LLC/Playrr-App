import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/screens/my_profile/components/body.dart';

class MyUserProfile extends StatelessWidget {
  const MyUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/SecondaryBackButton.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Mi perfil',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
    );
  }
}
