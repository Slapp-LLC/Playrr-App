import 'package:get/get.dart';

class EventsProvider extends GetxController {
  var currentSportSelection = 0.obs;
  var eventResultList = RxList<dynamic>([]);

  void setCurrentSportSelection(int value) {
    currentSportSelection.value = value;
  }

  void setEventResultList(List<dynamic> results) {
    eventResultList.assignAll(results);
  }
}
