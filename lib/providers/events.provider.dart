import 'package:get/get.dart';
import 'package:playrr_app/models/event.model.dart';
import 'package:playrr_app/models/sport.model.dart';

class EventsProvider extends GetxController {
  var sports = <Sport>[].obs;
  var currentSportSelection = 0.obs;
  var eventResultList = RxList<dynamic>([]);
  Rx<Event> currentEvent = Rx<Event>(Event.empty());

  void setCurrentEvent(Event newEvent) {
    currentEvent.value = newEvent;
  }

  void setCurrentSportSelection(int value) {
    currentSportSelection.value = value;
  }

  void setEventResultList(List<dynamic> results) {
    eventResultList.assignAll(results);
  }

  void setSports(List<dynamic> newSports) {
    sports.value =
        newSports.map((sportJson) => Sport.fromJson(sportJson)).toList();
  }
}
