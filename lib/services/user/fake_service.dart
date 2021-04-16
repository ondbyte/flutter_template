import 'package:faker/faker.dart';
import 'api.dart';
import '../../models/model.dart';

class FakeUserServices implements UserApi {
  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(Duration(seconds: 1));

    return List<User>.generate(
      5,
      (index) => User(
        id: index + 1,
        name: faker.person.name(),
        email: faker.internet.email(),
        avatar: index % 2 == 0 ? "images/user/user.png" : "images/user/no-user.png",
      ),
    );
  }

  @override
  Future<User> getUser(int userId) async {
    await Future.delayed(Duration(seconds: 1));

    if (userId % 2 == 0) {
      return User(
        id: userId,
        name: faker.person.name(),
        email: faker.internet.email(),
        avatar: "images/user/no-user.png",
      );
    }

    return User(
      id: userId,
      name: faker.person.name(),
      email: faker.internet.email(),
      avatar: "images/user/user.png",
    );

  }
}
