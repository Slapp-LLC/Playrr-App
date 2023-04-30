import 'package:get/state_manager.dart';
import 'package:playrr_app/models/user.model.dart';

class UserProvider extends GetxController {
  Rx<UserModel> _user =
      UserModel(id: 0, name: '', lastName: '', photoUrl: '', bio: '').obs;
}
