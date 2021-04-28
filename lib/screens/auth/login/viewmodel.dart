import '../../../enum/enum.dart';
import '../../../config/config.dart';
import '../../../models/model.dart';
import '../../../services/services.dart';
import '../../../viewmodels/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  UserApi userApi = locator<UserApi>();

  Future logUserIn(User user) async {
    setState(ViewStateType.Processing);
    notifyListeners();

    dynamic response = await userApi.loginUser(user);

    setState(ViewStateType.Completed);
    notifyListeners();

    return response;
  }

  Future<Message> getForgottenPassword(String email) async {
    Message response = await userApi.forgottenPassword(email);

    notifyListeners();

    return response;
  }
}
