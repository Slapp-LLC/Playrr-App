import 'package:get/get.dart';
import 'package:playrr_app/models/user.model.dart';

class UserProvider extends GetxController {
  final Rx<UserModel> _user = UserModel(
    id: 0,
    name: '',
    lastName: '',
    email: '',
    age: 0,
    photoUrl: '',
    userSports: [],
    matches: [],
    role: UserRole(id: 0, name: ''),
  ).obs;

  UserModel get user => _user.value;

  void updateUser(UserModel newUser) {
    _user.value = newUser;
  }
}
