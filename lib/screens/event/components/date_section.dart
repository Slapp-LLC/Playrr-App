import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playrr_app/constants.dart';
import 'package:playrr_app/utils/date.utils.dart';
import 'package:url_launcher/url_launcher.dart';

class DateSection extends StatefulWidget {
  final DateTime date;

  const DateSection({super.key, required this.date});

  @override
  State<DateSection> createState() => _DateSectionState();
}

class _DateSectionState extends State<DateSection> {
  String? formatedDate;
  String? formatedTime;

  @override
  void initState() {
    super.initState();
    formatedDate = DateUtil.getMonthAndDay(widget.date.toString());
    formatedTime = DateUtil.getTime(widget.date.toString());
  }

  void _launchGoogleCalendar() async {
    //Todo make this dinamic
    final String eventTitle = 'My Event';
    final String location = '123 Main St, Anytown USA';
    final DateTime startTime = DateTime.now().add(Duration(hours: 1));
    final DateTime endTime = DateTime.now().add(Duration(hours: 2));
    final String description = 'This is a description of my event.';

    final String startDate = startTime.toUtc().toString().replaceAll(' ', 'T');
    final String endDate = endTime.toUtc().toString().replaceAll(' ', 'T');

    final String url =
        'https://www.google.com/calendar/render?action=TEMPLATE&text=$eventTitle&location=$location&dates=$startDate/$endDate&details=$description';

    final Uri urlFormatedd = Uri.parse(url);
    if (!await launchUrl(urlFormatedd)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: secondaryBackground,
            width: 1.5,
          ),
        ),
      ),
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
                  'assets/icons/CalendarIcon.svg',
                ),
              )),
          Expanded(
              child: GestureDetector(
            onTap: _launchGoogleCalendar,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            formatedDate!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ),
                        Text(
                          formatedTime!,
                          style: const TextStyle(color: bodyTextColor),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Transform.rotate(
                      angle: 180 * 3.14 / 180,
                      child: SvgPicture.asset(
                          'assets/icons/SecondaryBackButton.svg'),
                    ),
                  )
                ]),
          ))
        ],
      ),
    );
  }
}
