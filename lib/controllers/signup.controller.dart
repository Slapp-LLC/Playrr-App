import 'package:get/get.dart';

class SignUpController extends GetxController {
  var age = 0.obs;
  var gender = ''.obs;

  void setAge(int value) {
    age.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }
}
