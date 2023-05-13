import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/providers/auth.provider.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

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
    final AuthProvider authProvider = Get.find<AuthProvider>();

    return GestureDetector(
      onTap: () {
        authProvider.setPickedSportId(id);
        Get.toNamed(RoutePaths.levelPicking);
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
