import 'package:get/get.dart';

class LocationProvider extends GetxController {
  var locality = ''.obs;
  var country = ''.obs;
  var latitude = ''.obs;

  var longitude = ''.obs;

  void setLocality(String value) {
    locality.value = value;
  }
}
