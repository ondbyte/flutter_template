import 'package:shared_preferences/shared_preferences.dart';
import '../../enum/enum.dart';
import '../../config/config.dart';
import '../../models/model.dart';
import '../../services/services.dart';
import '../../viewmodels/base_viewmodel.dart';

class IntroViewModel extends BaseViewModel {
  UserApi userService = locator<UserApi>();
  User user;

  void initialise() {
    setState(ViewStateType.Busy);
    _updateUserInfo();
    notifyListeners();
  }

  Future<void> _updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('userToken');

    if (token != null && token != '') {
      user = await userService.getUser(token);
    }

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}
