import 'package:faker/faker.dart';
import 'api.dart';
import '../../models/model.dart';
import '../../config/config.dart';

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

  @override
  Future<Message> loginUser(User user) async {
    await Future.delayed(Duration(seconds: 1));

    return Message(
      status: 200,
      title: 'Success',
      message: 'Test - Logging you in...',
      colour: Palette.successColour,
      data: User(
        id: 1,
        name: "Test User",
        avatar: "images/user/user.png",
        email: "test.user@test.com",
        role: Role(
          id: 1,
          name: "test-role",
        ),
        profile: Profile(
          firstname: "Test",
          lastname: "USer",
        ),
      ),
    );
  }

  @override
  Future<Message> registerUser(User user, Profile profile) async {
    await Future.delayed(Duration(seconds: 1));

    return Message(
      status: 200,
      title: 'Success',
      message:
      'Test - You have been registered successfully. Please check your email.',
      colour: Palette.successColour,
    );
  }

  @override
  Future<Message> forgottenPassword(String email) async {
    await Future.delayed(Duration(seconds: 1));

    return Message(
      status: 200,
      title: 'Success',
      message: "Test - That has been processed for you.",
      colour: Palette.successColour,
    );
  }

  @override
  Future<Message> updateUserDetails(int id, User user) async {
    await Future.delayed(Duration(seconds: 1));

    return Message(
      status: 200,
      title: 'Success',
      message: 'Test - User details have been updated.',
      colour: Palette.successColour,
    );
  }

  @override
  Future<Message> uploadUserAvatar(int id, dynamic imageFile) async {
    await Future.delayed(Duration(seconds: 1));

    return Message(
      status: 200,
      title: 'Success',
      message: 'Test - That has been uploaded.',
      colour: Palette.successColour,
    );
  }
}
