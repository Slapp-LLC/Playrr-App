import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';

class CustomNotification extends StatefulWidget {
  final String title;
  final String message;
  final String notificationType;
  final int id;
  const CustomNotification(
      {super.key,
      required this.title,
      required this.id,
      required this.message,
      required this.notificationType});

  @override
  State<CustomNotification> createState() => _CustomNotificationState();
}

class _CustomNotificationState extends State<CustomNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: secondaryBackground))),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
              width: 52,
              height: 52,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: greenPrimaryColor.withOpacity(0.33), width: 1)),
              child: Transform.scale(
                scale: 0.75,
                child: SvgPicture.asset(
                  'assets/icons/ActiveNotificationIcon.svg',
                ),
              )),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                          const Text(
                            'Just Now',
                            style:
                                TextStyle(color: bodyTextColor, fontSize: 13),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          widget.message,
                          style: const TextStyle(
                              color: bodyTextColor, fontSize: 15),
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
