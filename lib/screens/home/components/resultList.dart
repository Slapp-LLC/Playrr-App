import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:playrr_app/controllers/events.controller.dart';
import 'package:playrr_app/screens/home/components/EventCard.dart';
import 'package:playrr_app/screens/home/components/noResults.dart';

class EventResultList extends StatefulWidget {
  final List resultsData;

  const EventResultList({super.key, required this.resultsData});
  @override
  State<EventResultList> createState() => _EventResultListState();
}

class _EventResultListState extends State<EventResultList> {
  final eventsController = Get.find<EventsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final filteredResult = eventsController.eventResultList.where(
          (resultData) =>
              resultData['sport']['id'] ==
              eventsController.currentSportSelection.value);
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
                    ),
                  ),
                )
                .toList()
            : [const NoResults()],
      );
    });
  }
}
