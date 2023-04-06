import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/utils/date.utils.dart';

class EventCard extends StatefulWidget {
  final String eventTitle;
  final String eventDate;
  final String eventLevel;
  final String eventAddress;
  final int eventSpots;

  const EventCard(
      {super.key,
      required this.eventDate,
      required this.eventTitle,
      required this.eventLevel,
      required this.eventAddress,
      required this.eventSpots});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  String? formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = DateUtil.formatDate(widget.eventDate);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.black,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.white24))),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate ?? '',
                  style: const TextStyle(color: bodyTextColor),
                  textAlign: TextAlign.left,
                ),
                Text(
                  widget.eventTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                Text(
                  widget.eventLevel,
                  style: const TextStyle(
                    color: bodyTextColor,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/LocationIcon.svg',
                      width: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.eventAddress,
                        style: const TextStyle(
                          color: bodyTextColor,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/SpotsIcon.svg',
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '0/${widget.eventSpots}',
                        style: const TextStyle(
                          color: bodyTextColor,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}