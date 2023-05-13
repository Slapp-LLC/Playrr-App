import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/utils/date.utils.dart';
import 'package:playrr_app/utils/routePaths.utils.dart';

//TODO Manegar null values, bug al no tener imagen los eventos
class EventCard extends StatefulWidget {
  final String eventTitle;
  final String eventDate;
  final String eventLevel;
  final String eventAddress;
  final int eventSpots;
  final String? eventPhotoUrl;
  final int eventId;
  final int attendingAmount;
  const EventCard(
      {super.key,
      required this.eventId,
      required this.eventTitle,
      required this.eventDate,
      required this.eventLevel,
      required this.eventAddress,
      required this.eventPhotoUrl,
      required this.eventSpots,
      required this.attendingAmount});

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
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.event,
            arguments: widget.eventId);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: const BoxDecoration(
            color: Colors.black,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.white24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    formattedDate ?? '',
                    style: const TextStyle(color: bodyTextColor),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      widget.eventTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      widget.eventLevel,
                      style: const TextStyle(
                        color: bodyTextColor,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
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
                    )),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/SpotsIcon.svg',
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '${widget.attendingAmount}/${widget.eventSpots}',
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
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  8.0), // Adjust the border radius if needed
              child: widget.eventPhotoUrl != null
                  ? Image.network(
                      widget.eventPhotoUrl!,
                      height: 152,
                      width: 115,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/Splash.png',
                      fit: BoxFit.cover,
                      width: 115,
                      height: 152,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
