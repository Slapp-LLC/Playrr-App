import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/controllers/events.controller.dart';

class MySportCard extends StatefulWidget {
  final int index;
  final String photoURl;
  final String name;
  final int sportId;
  const MySportCard(
      {super.key,
      required this.index,
      required this.photoURl,
      required this.name,
      required this.sportId});

  @override
  State<MySportCard> createState() => _MySportCardState();
}

class _MySportCardState extends State<MySportCard> {
  final eventsController = Get.find<EventsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            eventsController.setCurrentSportSelection(widget.sportId);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(minWidth: 150),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: secondaryBackground,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: eventsController.currentSportSelection == widget.sportId
                  ? Border.all(color: greenPrimaryColor, width: 2)
                  : Border.all(color: Colors.black, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.photoURl,
                  width: 20,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
