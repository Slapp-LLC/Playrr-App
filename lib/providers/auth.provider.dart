import 'package:get/get.dart';

class AuthProvider extends GetxController {
  var age = 0.obs;
  var gender = ''.obs;
  var pickedSportId = 0.obs;
  var pickedLevelId = 0.obs;
  var currentSport = 0.obs;

  void setAge(int value) {
    age.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }

  void setCurrentSport(int sportId) {
    currentSport.value = sportId;
  }

  void setPickedSportId(int sportId) {
    pickedSportId.value = sportId;
  }

  void setPickedLevelId(int levelId) {
    pickedLevelId.value = levelId;
  }
}
