import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../models/model.dart';
import './../../../services/services.dart';
import './../../../viewmodels/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  ApplicationApi applicationService = locator<ApplicationApi>();

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
}
