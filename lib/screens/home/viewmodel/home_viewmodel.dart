import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../models/model.dart';
import './../../../services/services.dart';
import './../../../viewmodels/base_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseViewModel {
  UserService userService = locator<UserService>();

  User user;
  List<User> users;

  void initialise() {
    setState(ViewStateType.Busy);
//    _userInfo();
    _usersInfo();
    notifyListeners();
  }

  Future<void> _userInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    int id = prefs.getInt('userId');
    int id = 1;

    user = await userService.getUser(id);

    setState(ViewStateType.Completed);
    notifyListeners();
  }

  Future<void> _usersInfo() async {
    users = await userService.getUsers();

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}
