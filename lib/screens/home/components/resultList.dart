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
      final filteredResult =
          eventsController.eventResultList.where((resultData) {
        if (resultData == null) {
          return false;
        }

        return resultData['sport'] != null &&
            resultData['sport']['id'] ==
                eventsController.currentSportSelection.value;
      });
      return Column(
        children: filteredResult.isNotEmpty
            ? filteredResult
                .map(
                  (resultData) => Container(
                    decoration: const BoxDecoration(color: Colors.black),
                    // child: Text(
                    //   resultData['id'].toString() +
                    //       resultData['title'] +
                    //       resultData['startDate'] +
                    //       resultData['level']['name'] +
                    //       resultData['location'] +
                    //       resultData['spots'].to,
                    //   style: TextStyle(color: Colors.amber),
                    // ),
                    child: EventCard(
                        eventId: resultData['id'],
                        eventTitle: resultData['title'],
                        eventDate: resultData['startDate'],
                        eventLevel: resultData['level']['name'],
                        eventAddress: resultData['location'],
                        eventSpots: resultData['spots'],
                        eventPhotoUrl: resultData['eventPhoto'],
                        attendingAmount: resultData['players'].length),
                    // child: EventCard(
                    //   eventTitle: resultData['title'],
                    //   eventDate: resultData['startDate'],
                    //   eventId: resultData['id'],
                    //   eventLevel: resultData['level']['name'],
                    //   eventAddress: resultData['location'],
                    //   eventPhotoUrl: resultData['photo'],
                    // ),
                  ),
                )
                .toList()
            : [const NoResults()],
      );
    });
  }
}
