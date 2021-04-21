import 'package:faker/faker.dart';
import 'api.dart';
import '../../models/model.dart';

class FakeApplicationServices implements ApplicationApi {
  @override
  Future<Application> getApplication() async {
    await Future.delayed(Duration(seconds: 1));
    return Application(
      name: 'Test Flutter App',
      version: '1.0.0',
      environment: "testing",
      year: faker.date.year(),
    );
  }
}
