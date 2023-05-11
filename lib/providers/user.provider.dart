import 'package:get/get.dart';
import 'package:playrr_app/models/myUser.model.dart';

class UserProvider extends GetxController {
  final Rx<MyUserModel> _user = MyUserModel(
    id: 0,
    name: '',
    lastName: '',
    email: '',
    age: 0,
    photoUrl: '',
    bio: null,
    country: null,
    userSports: [],
    matches: [],
    role: UserRole(id: 0, name: ''),
  ).obs;

  MyUserModel get user => _user.value;

  void updateUser(MyUserModel newUser) {
    _user.value = newUser;
  }

  void resetUser() {
    _user.value = MyUserModel(
      id: 0,
      name: '',
      lastName: '',
      email: '',
      age: 0,
      photoUrl: '',
      userSports: [],
      matches: [],
      role: UserRole(id: 0, name: ''),
    );
  }
}
