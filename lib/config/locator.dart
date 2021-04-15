import 'package:fluuter_template/services/services.dart';
import 'package:fluuter_template/viewmodels/viewmodels.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton(() => UserService());

  // Register view models
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}