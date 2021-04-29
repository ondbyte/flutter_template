import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import './../../services/user/api.dart';
import '../../models/model.dart';
import '../../config/config.dart';
import '../../api/api.dart';

UserQuery userQuery = UserQuery();
UserMutation userMutation = UserMutation();

class UserService implements UserApi {
  // Get a list of users from the site.
  @override
  Future getUsers() async {
    try {
      final String bearerToken = null;
      final GraphQLClient _user = getGraphQLClient(bearerToken);

      final QueryOptions options = QueryOptions(
        document: gql(
          userQuery.getUsers(),
        ),
      );

      final QueryResult response = await _user.query(options);

      if (response.hasException) {
        throw new Exception('USERS ERROR: ${response.exception.toString()}.');
      }

      final result = response.data;

      Iterable list = result['users'];

      return list.map((users) => User.fromJson(users)).toList();
    } catch (e) {
      return Message(
        status: 401,
        title: 'Error',
        message: e.toString(),
        colour: Palette.errorColour,
        data: null,
      );
    }
  }

  // Get a specific user from ID.
  @override
  Future getUser(String token) async {
    try {
      final GraphQLClient _user = getGraphQLClient(token);

      final QueryOptions options = QueryOptions(
          document: gql(
        userQuery.getUser(),
      ));

      final QueryResult response = await _user.query(options);

      if (response.hasException) {
        throw new Exception('USER ERROR:  ${response.exception.toString()}');
      }

      final result = response.data;

      User user = User(
        id: int.parse(result['me']['id']),
        name: result['me']['name'],
        avatar: result['me']['avatar'],
        email: result['me']['email'],
      );

      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Log user into application.
  @override
  Future loginUser(User user) async {
    // print(user);
    try {
      final String bearerToken = null;
      final GraphQLClient _user = getGraphQLClient(bearerToken);

      final MutationOptions options = MutationOptions(
        document: gql(
          userMutation.loginUser(),
        ),
        variables: {
          "input": {
            "username": user.email,
            "password": user.password,
          }
        },
      );

      final QueryResult response = await _user.mutate(options);

      if (response.hasException) {
        String message = response.exception.graphqlErrors.first.message;

        // Incorrect user credentials.
        if (message == 'The user credentials were incorrect.') {
          throw new Exception(message + ' Please try again');
        } else {
          // Any other message.
          throw new Exception(response.exception.graphqlErrors.toString());
        }
      }

      final result = response.data;

      if (response.data['login']['user']['email_verified_at'] == null) {
        return Message(
          status: 301,
          title: 'Warning',
          message: 'Please verify your email.',
          colour: Palette.warningColour,
          data: null,
        );
      }

      this.setUserToken(response.data['login']['access_token']);

      return Message(
        status: 200,
        title: 'Success',
        message: 'Logging you in...',
        colour: Palette.successColour,
        data: User(
          id: int.parse(result['login']['user']['id']),
          name: result['login']['user']['name'],
          avatar: result['login']['user']['avatar'],
          email: result['login']['user']['email'],
          role: Role(
            id: int.parse(result['login']['user']['role']['id']),
            name: result['login']['user']['role']['name'],
          ),
          profile: Profile(
            firstname: result['login']['user']['profile']['firstname'],
            lastname: result['login']['user']['profile']['lastname'],
          ),
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Set the user token in a shared preference variable.
  @override
  Future<void> setUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userToken", token);
  }

  // Set the user token in a shared preference variable.
  @override
  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userToken", "");
  }

  // Register the user.
  @override
  Future registerUser(User user, Profile profile) async {
    try {
      final String bearerToken = null;
      final GraphQLClient _user = getGraphQLClient(bearerToken);

      final MutationOptions options = MutationOptions(
        document: gql(
          userMutation.createUser(),
        ),
        variables: {
          "input": {
            "firstname": profile.firstname,
            "lastname": profile.lastname,
            "email": user.email,
            "password": user.password,
            "mobile_number": profile.mobileNumber,
          }
        },
      );

      final QueryResult response = await _user.mutate(options);

      if (response.hasException && response.exception.graphqlErrors.first.extensions['validation'] != null) {
        var message = response.exception.graphqlErrors.first.extensions['validation'].toString();
        return Message(
          status: 301,
          title: 'Warning',
          message: message,
          colour: Palette.warningColour,
        );
      }

      if (response.hasException) {
        throw new Exception(response);
      }

      return Message(
        status: 200,
        title: 'Success',
        message: 'You have been registered successfully. Please check your email.',
        colour: Palette.successColour,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Forgotten user password.
  @override
  Future forgottenPassword(String email) async {
    try {
      final String bearerToken = null;
      final GraphQLClient _user = getGraphQLClient(bearerToken);

      final MutationOptions options = MutationOptions(
        document: gql(
          userMutation.forgottenPassword(),
        ),
        variables: {
          "input": {
            "email": email,
          }
        },
      );

      final QueryResult response = await _user.mutate(options);

      if (response.hasException) {
        throw new Exception('There seems to be a problem. Please contact the system admin.');
      }

      final result = response.data;

      if (result['forgotPassword']['status'] == 'EMAIL_NOT_SENT') {
        return Message(
          status: 301,
          title: 'Warning',
          message: result['forgotPassword']['message'],
          colour: Palette.warningColour,
        );
      } else {
        return Message(
          status: 200,
          title: 'Success',
          message: result['forgotPassword']['message'],
          colour: Palette.successColour,
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Update the user information.
  @override
  Future updateUserDetails(int id, User user) async {
    try {
      final String bearerToken = null;
      final GraphQLClient _user = getGraphQLClient(bearerToken);

      final MutationOptions options = MutationOptions(
        document: gql(
          userMutation.updateUserDetails(),
        ),
        variables: {
          "input": {
            "id": id,
            "firstname": user.profile.firstname,
            "lastname": user.profile.lastname,
            "email": user.email,
          }
        },
      );

      final QueryResult response = await _user.mutate(options);

      if (response.hasException) {
        String message = response.exception.graphqlErrors.first.message;
        throw new Exception(message);
      }

      final result = response.data;

      return Message(
        status: 200,
        title: 'Success',
        message: result['updateUserDetails']['message'],
        colour: Palette.successColour,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Upload the user avatar.
  @override
  Future uploadUserAvatar(int id, dynamic imageFile) async {
    String fileName = imageFile.path.split("/").last;
    var byteData = imageFile.readAsBytesSync();

    var multipartFile = http.MultipartFile.fromBytes(
      'file',
      byteData,
      filename: fileName,
    );

    try {
      final String bearerToken = null;
      final GraphQLClient _user = getGraphQLClient(bearerToken);

      final MutationOptions options = MutationOptions(
        document: gql(
          userMutation.uploadUserAvatar(),
        ),
        variables: {
          "id": id,
          "file": multipartFile,
        },
      );

      final QueryResult response = await _user.mutate(options);

      if (response.hasException) {
        String message = response.exception.toString();
        throw new Exception(message);
      }

      final result = response.data;

      return Message(
        status: 200,
        title: 'Success',
        message: result['uploadUserAvatar']['message'],
        colour: Palette.successColour,
      );
    } catch (e) {
      return Message(
        status: 400,
        title: 'Error',
        message: e.toString(),
        colour: Palette.errorColour,
      );
    }
  }
}
