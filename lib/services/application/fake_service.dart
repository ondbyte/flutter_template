import 'package:faker/faker.dart';
import 'api.dart';
import '../../models/model.dart';

class FakeApplicationServices implements ApplicationApi {
  @override
  Future<Application> getApplication() async {
    await Future.delayed(Duration(seconds: 1));
    return Application(
      name: faker.company.name(),
      version: faker.guid.guid(),
      environment: "testing",
      year: faker.date.year(),
    );
  }
}
