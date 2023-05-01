import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playrr_app/providers/events.provider.dart';
import 'package:playrr_app/services/errorHandling.service.dart';
import 'package:playrr_app/services/events.service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:playrr_app/utils/api_error.dart'; // Add an alias to the dio import

class EventsController extends GetxController {
  final EventService _eventService = EventService.instance;
  final _eventsProvider = Get.find<EventsProvider>();

  Future<void> getReccomendedEvents() async {
    try {
      dio.Response response = await _eventService.getRecommendedEvents();
      _eventsProvider.setEventResultList(response.data);
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
    }
  }
}
