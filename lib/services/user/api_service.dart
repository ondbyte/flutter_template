import 'package:graphql/client.dart';
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
  Future<dynamic> getUsers() async {
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
    } catch(e) {
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
  Future<dynamic> getUser(int id) async {
    try {
      final String bearerToken = null;
      final GraphQLClient _user = getGraphQLClient(bearerToken);

      final QueryOptions options = QueryOptions(
        document: gql(
          userQuery.getUser(),
        ),
        variables: {
          'id': id,
        },
      );

      final QueryResult response = await _user.query(options);

      if (response.hasException) {
        throw new Exception('USER ERROR:  ${response.exception.toString()}');
      }

      final result = response.data;

      User user = User(
        id: int.parse(result['user']['id']),
        name: result['user']['name'],
        avatar: result['user']['avatar'],
        email: result['user']['email'],
      );

      return user;
    } catch(e) {
       return Message(
          status: 401,
          title: 'Error',
          message: e.toString(),
          colour: Palette.errorColour,
          data: null,
        );
    }
  }

  // Log user into application.
  @override
  Future<Message> loginUser(User user) async {
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
      return Message(
        status: 401,
        title: 'Error',
        message: e.toString(),
        colour: Palette.errorColour,
        data: null,
      );
    }
  }

 // Register the user.
 @override
 Future<Message> registerUser(User user, Profile profile) async {
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

     if (response.hasException &&
         response.exception.graphqlErrors.first.extensions['validation'] !=
             null) {
       var message = response
           .exception.graphqlErrors.first.extensions['validation']
           .toString();
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
       message:
           'You have been registered successfully. Please check your email.',
       colour: Palette.successColour,
     );
   } catch (e) {
     return Message(
       status: 401,
       title: 'Error',
       message: e.toString(),
       colour: Palette.errorColour,
     );
   }
 }

 // Forgotten user password.
 @override
 Future<Message> forgottenPassword(String email) async {
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
       throw new Exception(
           'There seems to be a problem. Please contact the system admin.');
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
     return Message(
       status: 401,
       title: 'Error',
       message: e.toString(),
       colour: Palette.errorColour,
     );
   }
 }

 // Update the user information.
 @override
 Future<Message> updateUserDetails(int id, User user) async {
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
     return Message(
       status: 400,
       title: 'Error',
       message: e.toString(),
       colour: Palette.errorColour,
     );
   }
 }

 // Upload the user avatar.
 @override
 Future<Message> uploadUserAvatar(int id, dynamic imageFile) async {
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
       variables: {"id": id, "file": multipartFile,},
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
