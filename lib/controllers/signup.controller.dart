import 'package:get/get.dart';

class SignUpController extends GetxController {
  var age = 0.obs;
  var gender = ''.obs;
  var pickedSports = [].obs;
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

  void addSportWithLevel(int sportId, int levelId) {
    // Check if an item with the given sportId already exists
    var existingItem = pickedSports
        .firstWhere((item) => item['sportId'] == sportId, orElse: () => null);

    if (existingItem != null) {
      // Modify the levelId of the existing item
      existingItem['levelId'] = levelId;
    } else {
      // Add a new item to the list
      pickedSports.add({'sportId': sportId, 'levelId': levelId});
    }
  }

  void removeSport(int index) {
    pickedSports.removeAt(index);
  }
}
