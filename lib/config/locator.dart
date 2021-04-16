import './../services/services.dart';
import './../viewmodels/viewmodels.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<ApplicationApi>(() => USE_FAKE_IMPLEMENTATION ? FakeApplicationServices() : ApplicationService());
  locator.registerLazySingleton<UserApi>(() => USE_FAKE_IMPLEMENTATION ? FakeUserServices() : UserService());

  // Register view models
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}
