import 'package:flutter_test/flutter_test.dart';
import '../../lib/config/config.dart';

void main() {
  group('InputField validation', () {
    test('Input field is empty', () {
      var inputField = FormValidator.validateInputField('', 'firstname');

      expect(inputField, 'Missing firstname field!');
    });

    test('Input field is not valid because there is not enough characters.', () {
      var inputField = FormValidator.validateInputField('j', 'firstname');

      expect(inputField, 'At least 2 characters!');
    });

    test('Input field is valid', () {
      var inputField = FormValidator.validateInputField('John', 'firstname');

      expect(inputField, null);
    });
  });

  group('InputNumberField validation', () {
    test('Input field is empty', () {
      var inputField = FormValidator.validateNumberField('', 'mobile');

      expect(inputField, 'Missing mobile field!');
    });

    test('Input field is not valid', () {
      var inputField = FormValidator.validateNumberField('rwerfsdfs', 'mobile');

      expect(inputField, 'Mobile not valid number!');
    });

    test('Input field is valid', () {
      var inputField = FormValidator.validateNumberField('01234567890', 'mobile');

      expect(inputField, null);
    });
  });

  group('Email Validation', () {
    test('the email field is empty', () {
      var inputField = FormValidator.validateEmail('');

      expect(inputField, 'Missing email address!');
    });

    test('the email field is not valid', () {
      var inputField = FormValidator.validateEmail('test');

      expect(inputField, 'Email address not valid.');
    });

    test('the email field is valid', () {
      var inputField = FormValidator.validateEmail('test@test.com');

      expect(inputField, null);
    });
  });

  group('Password Validation', () {
    test('the password field is empty', () {
      var inputField = FormValidator.validatePassword(value: '', passNumber: null);

      expect(inputField, 'Please complete the password field.');
    });

    test('the password field does not have enough characters', () {
      var inputField = FormValidator.validatePassword(value: 'pass', passNumber: 5);

      expect(inputField, 'Password must contain at least 5 characters.');
    });

    test('Check to see if password is valid with a set number of characters', () {
      var inputField = FormValidator.validatePassword(value: 'secure', passNumber: 6);

      expect(inputField, null);
    });

    test('Check to see if password is valid using rge default number of characters', () {
      var inputField = FormValidator.validatePassword(value: 'password');

      expect(inputField, null);
    });
  });

  group('Confirm Password Validation', () {
    test('the confirm password field is empty', () {
      var inputField = FormValidator.validatePasswordConfirmation('', 'password');

      expect(inputField, 'Please complete the password field.');
    });

    test('the password confirmation field does not match.', () {
      var inputField = FormValidator.validatePasswordConfirmation('passwrod', 'password');

      expect(inputField, 'The passwords do not match.');
    });

    test('the password confirmation field matches the password field.', () {
      var inputField = FormValidator.validatePasswordConfirmation('password', 'password');

      expect(inputField, null);
    });
  });
}
