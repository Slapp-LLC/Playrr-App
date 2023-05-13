import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/providers/events.provider.dart';
import 'package:playrr_app/screens/home/components/event_card.dart';
import 'package:playrr_app/screens/home/components/no_results.dart';

class EventResultList extends StatefulWidget {
  const EventResultList({
    super.key,
  });
  @override
  State<EventResultList> createState() => _EventResultListState();
}

class _EventResultListState extends State<EventResultList> {
  final _eventProvider = Get.find<EventsProvider>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      //There are not results

      final filteredResult = _eventProvider.eventResultList.where((resultData) {
        if (resultData == null) {
          return false;
        }

        return resultData['sport'] != null &&
            resultData['sport']['id'] ==
                _eventProvider.currentSportSelection.value;
      });

      return Column(
          children: filteredResult.isNotEmpty
              ? filteredResult
                  .map(
                    (resultData) => Container(
                      decoration: const BoxDecoration(color: Colors.black),
                      child: EventCard(
                          eventId: resultData['id'],
                          eventTitle: resultData['title'],
                          eventDate: resultData['startDate'],
                          eventLevel: resultData['level']['name'],
                          eventAddress: resultData['location'],
                          eventSpots: resultData['spots'],
                          eventPhotoUrl: resultData['eventPhoto'],
                          attendingAmount: resultData['players'].length),
                    ),
                  )
                  .toList()
              : [const NoResults()]);
    });
  }
}
