import '../../../enum/enum.dart';
import '../../../config/config.dart';
import '../../../models/model.dart';
import '../../../services/services.dart';
import '../../../viewmodels/base_viewmodel.dart';

class RegisterViewModel extends BaseViewModel {
  UserApi userService = locator<UserApi>();
  LegalApi legalService = locator<LegalApi>();

  String firstName;
  String lastName;
  String email;
  String mobile;
  String token;
  String password;
  String confirmPassword;

  List<Legal> legals;

  List<Legal> checkbox = [];

  void updateCheckBox(int index, bool value) {
    checkbox[index].value = value;
    notifyListeners();
  }

  void initialise() {
    setState(ViewStateType.Busy);
    notifyListeners();
    getLegalInfo();
    notifyListeners();
  }

  void updateFirstName(String value) {
    firstName = value;
  }

  void updateLastName(String value) {
    lastName = value;
  }

  void updateEmail(String value) {
    email = value;
  }

  void updateMobile(String value) {
    mobile = value;
  }

  void updatePassword(String value) {
    password = value;
  }

  void updateConfirmPassword(String value) {
    confirmPassword = value;
  }

  void initialVariables() {
    firstName = firstName;
    lastName = lastName;
    email = email;
    mobile = mobile;
    notifyListeners();
  }

  Future<Message> registerUser(User user, Profile profile) async {
    setState(ViewStateType.Processing);
    notifyListeners();

    // FirebaseMessaging _fcm = FirebaseMessaging();

    // String token = await _fcm.getToken();

    // Message response = await userService.registerUser(user, profile,  token, email, app, text);
    Message response = await userService.registerUser(user, profile);

    setState(ViewStateType.Completed);
    notifyListeners();

    return response;
  }

  Future<void> getLegalInfo() async {
    legals = await legalService.getLegalInfo();
    checkbox = legals.map((legal) => Legal(id: legal.id, name: legal.name)).toList();
    setState(ViewStateType.Completed);
    notifyListeners();
  }
}
