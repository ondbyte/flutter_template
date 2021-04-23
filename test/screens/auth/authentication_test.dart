import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import './../../../lib/services/services.dart';
import './../../../lib/models/model.dart';

class MockUserApi extends Mock implements UserApi {}

void main() {
  final MockUserApi mockUserApi = MockUserApi();

  setUp(() {});

  group('User login process', () {
    test('User can log in to app.', () async {
      User user = User(name: "Test User", email: "test.user@test.com", password: "password");

      when(mockUserApi.loginUser(user)).thenAnswer((_) async => Message(status: 200, title: 'Success', message: 'Logging you in...'));

      expect(await mockUserApi.loginUser(user), isInstanceOf<Message>());
      expect(await mockUserApi.loginUser(user).then((res) => res.toString()), Message(status: 200, title: 'Success', message: 'Logging you in...').toString());
    });

    test('User tries to log in without confirming their email.', () async {
      User user = User(name: "Test User", email: "test.user@test.com", password: "password");

      when(mockUserApi.loginUser(user)).thenAnswer((_) async => Message(status: 301, title: 'Warning', message: 'Please verify your email.'));

      expect(await mockUserApi.loginUser(user), isInstanceOf<Message>());
      expect(await mockUserApi.loginUser(user).then((res) => res.toString()), Message(status: 301, title: 'Warning', message: 'Please verify your email.').toString());
    });

    test('User gets an error when they log in.', () async {
      User user = User(name: "Test User", email: "test.user@test.com", password: "password");

      when(mockUserApi.loginUser(user)).thenAnswer((_) async => Exception('Something has gone wrong.'));

      expect(await mockUserApi.loginUser(user), isInstanceOf<Exception>());
      expect(await mockUserApi.loginUser(user).then((res) => res.toString()), "Exception: Something has gone wrong.");
    });
  });

  group('User register process', () {
    test('', () {});
  });

  group('User forgotten password process', () {
    test('', () {});
  });
}
