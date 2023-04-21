import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/instance_manager.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/signup.controller.dart';
import 'package:playrr_app/screens/sport_picking/levelPicking.screen.dart';

class SportCard extends StatelessWidget {
  final String sportName;
  final String photoUrl;
  final int id;
  const SportCard(
      {super.key,
      required this.id,
      required this.photoUrl,
      required this.sportName});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

    return GestureDetector(
      onTap: () {
        signUpController.setPickedSportId(id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LevelPickingScreen()));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 12),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(photoUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Chip(
              backgroundColor: secondaryBackground,
              label: Text(
                sportName,
                style: const TextStyle(
                    fontFamily: 'Bebas neue',
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}