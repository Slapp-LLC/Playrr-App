import 'package:get/get.dart';

class UserController extends GetxController {
  var _userData;
  get userData => _userData;
  void setUserData(data) {
    _userData = data;
    update();
  }

  void deleteUserData() {
    _userData = null;
    update();
  }
}
