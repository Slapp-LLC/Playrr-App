import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  var currentSportSelection = 0.obs;
  void setCurrentSportSelection(int value) {
    currentSportSelection.value = value;
  }
}
