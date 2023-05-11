import 'package:get/get.dart';
import 'package:playrr_app/models/event.model.dart';
import 'package:playrr_app/providers/events.provider.dart';
import 'package:playrr_app/services/errorHandling.service.dart';
import 'package:playrr_app/services/events.service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:playrr_app/utils/api_error.dart'; // Add an alias to the dio import

class EventsController extends GetxController {
  final EventsProvider _eventsProvider = Get.put(EventsProvider());
  final EventService _eventService = EventService.instance;

  Future<bool> getRecomendedEvents() async {
    try {
      dio.Response sportsResponse = await _eventService.getAllSports();
      dio.Response eventsResponse = await _eventService.getRecommendedEvents();
      if (sportsResponse.data != null) {
        List<Map<String, dynamic>> sportsList =
            List<Map<String, dynamic>>.from(sportsResponse.data);
        _eventsProvider.setSports(sportsList);
        if (_eventsProvider.currentSportSelection.value == 0 &&
            sportsList.isNotEmpty) {
          _eventsProvider.setCurrentSportSelection(sportsList[0]['id']);
        }
      }

      _eventsProvider.setEventResultList(eventsResponse.data);
      return true;
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
      return false;
    } catch (e) {
      printError(info: e.toString());
      ErrorHandlingService.instance
          .showError('Un error inesperado ha ocurrido');
      return false;
    }
  }

  Future<bool> getAnEvent(int id) async {
    try {
      dio.Response eventResponse = await _eventService.getEvent(id);
      print(eventResponse.data);
      Event currentEvent =
          Event.fromJson(eventResponse.data as Map<String, dynamic>);
      _eventsProvider.setCurrentEvent(currentEvent);

      return true;
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
      return false;
    } catch (e) {
      printError(info: e.toString());
      ErrorHandlingService.instance
          .showError('Un error inesperado ha ocurrido');
      return false;
    }
  }
}
