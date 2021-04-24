import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import './../../../lib/services/services.dart';
import './../../../lib/models/model.dart';

class MockUserApi extends Mock implements UserApi {}

void main() {
  final MockUserApi mockUserApi = MockUserApi();
  final User user = User(
      name: "Test User", email: "test.user@test.com", password: "password");
  final Profile profile = Profile(firstname: "Test", lastname: "User");

  setUp(() {});

  group('User login process', () {
    test('User can log in to app.', () async {
      when(mockUserApi.loginUser(user)).thenAnswer((_) async =>
          Message(status: 200, title: 'Success', message: 'Logging you in...'));

      expect(await mockUserApi.loginUser(user), isInstanceOf<Message>());
      expect(
          await mockUserApi.loginUser(user).then((res) => res.toString()),
          Message(status: 200, title: 'Success', message: 'Logging you in...')
              .toString());
    });

    test('User tries to log in without confirming their email.', () async {
      when(mockUserApi.loginUser(user)).thenAnswer((_) async => Message(
          status: 301, title: 'Warning', message: 'Please verify your email.'));

      expect(await mockUserApi.loginUser(user), isInstanceOf<Message>());
      expect(
          await mockUserApi.loginUser(user).then((res) => res.toString()),
          Message(
                  status: 301,
                  title: 'Warning',
                  message: 'Please verify your email.')
              .toString());
    });

    test('User gets an error when they log in.', () async {
      when(mockUserApi.loginUser(user))
          .thenAnswer((_) async => Exception('Something has gone wrong.'));

      expect(await mockUserApi.loginUser(user), isInstanceOf<Exception>());
      expect(await mockUserApi.loginUser(user).then((res) => res.toString()),
          "Exception: Something has gone wrong.");
    });
  });

  group('User register process', () {
    test('User can register in app.', () async {
      when(mockUserApi.registerUser(user, profile)).thenAnswer((_) async => Message(
          status: 200,
          title: 'Success',
          message:
              'You have been registered successfully. Please check your email.'));

      expect(await mockUserApi.registerUser(user, profile),
          isInstanceOf<Message>());
      expect(
          await mockUserApi
              .registerUser(user, profile)
              .then((res) => res.toString()),
          Message(
                  status: 200,
                  title: 'Success',
                  message:
                      'You have been registered successfully. Please check your email.')
              .toString());
    });
    test('User can not use an email that has already been taken.', () async {
      when(mockUserApi.registerUser(user, profile)).thenAnswer((_) async => Message(
          status: 301,
          title: 'Warning',
          message:
          'Email has already been taken. Please try again.'));

      expect(await mockUserApi.registerUser(user, profile),
      isInstanceOf<Message>());
      expect(
      await mockUserApi
          .registerUser(user, profile)
          .then((res) => res.toString()),
      Message(
      status: 301,
      title: 'Warning',
      message:
      'Email has already been taken. Please try again.')
      .toString());
    });
    test('User gets an error when they try to register.', () async {
      when(mockUserApi.registerUser(user, profile)).thenAnswer((_) async => Exception('Something has gone wrong.'));

      expect(await mockUserApi.registerUser(user, profile), isInstanceOf<Exception>());
      expect(
      await mockUserApi
          .registerUser(user, profile)
          .then((res) => res.toString()),
          "Exception: Something has gone wrong.");
    });
  });

  group('User forgotten password process', () {
    test('', () {});
  });
}
