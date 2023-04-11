import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  var currentSportSelection = 0.obs;
  var eventResultList = RxList<dynamic>([]);

  // @override
  // void onInit() {
  //   super.onInit();
  //   Get.put(EventsController());
  // }
  void setCurrentSportSelection(int value) {
    currentSportSelection.value = value;
  }

  void setEventResultList(List<dynamic> results) {
    eventResultList.assignAll(results);
  }
}
