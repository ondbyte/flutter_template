import 'package:faker/faker.dart';
import 'api.dart';
import '../../models/model.dart';

class FakeLegalServices implements LegalApi {
  @override
  Future<List<Legal>> getLegalInfo() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Legal>.generate(
      3,
      (index) => Legal(
        id: index + 1,
        name: faker.person.firstName(),
        description: faker.lorem.words(15).toString().replaceAll('[', '').replaceAll(']', ''),
        slug: faker.lorem.word(),
        link: faker.internet.httpsUrl(),
      ),
    );
  }
}
