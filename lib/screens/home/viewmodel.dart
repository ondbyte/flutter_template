import 'package:shared_preferences/shared_preferences.dart';

import '../../enum/enum.dart';
import '../../config/config.dart';
import '../../models/model.dart';
import '../../services/services.dart';
import '../../viewmodels/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  ApplicationApi applicationService = locator<ApplicationApi>();
  UserApi userService = locator<UserApi>();
  String token;

  Application application;

  void initialise() {
    setState(ViewStateType.Busy);
    _applicationInfo();
    notifyListeners();
  }

  Future<void> _applicationInfo() async {
    application = await applicationService.getApplication();

    setState(ViewStateType.Completed);
    notifyListeners();
  }

  Future<void> logUserOut() async {

    setState(ViewStateType.Busy);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', '');

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}
