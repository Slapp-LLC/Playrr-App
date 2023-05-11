import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:playrr_app/constants.dart';

class LevelAndSport extends StatefulWidget {
  final String sportName;
  final String levelName;
  const LevelAndSport(
      {super.key, required this.levelName, required this.sportName});

  @override
  State<LevelAndSport> createState() => _LevelAndSportState();
}

class _LevelAndSportState extends State<LevelAndSport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: secondaryBackground, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Deporte",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                widget.sportName,
                style: const TextStyle(color: bodyTextColor, fontSize: 18),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nivel',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                widget.levelName,
                style: const TextStyle(color: bodyTextColor, fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
