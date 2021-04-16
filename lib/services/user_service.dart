import 'package:graphql/client.dart';

import './../models/model.dart';
import './../config/config.dart';
import './../api/api.dart';
// import 'package:http/http.dart' as http;

//GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
//
UserQuery userQuery = UserQuery();
//UserMutation userMutation = UserMutation();

class UserService {
  // Get a list of users from the site.
  Future<User> getUsers() async {
    final GraphQLClient _user = getGraphQLClient();

    final QueryOptions options = QueryOptions(
      document: gql(
        userQuery.getUsers(),
      ),
    );

    final QueryResult results = await _user.query(options);

    if (results.hasException) {
      // stderr.writeln(result.exception.toString());
      // exit(2);
      throw new Exception('Could not get user data.');
    }

    print(results);

    // final List<dynamic> = users
    // result.data['viewer']['repositories']['nodes'] as List<dynamic>;
    //
    // User user = User(
    //   name: result['user']['name'],
    //   email: result['user']['email'],
    //   password: result['user']['password'],
    // );
    //
    // return user;

    // exit(0);

    // if (response.hasException) {
    //   throw new Exception('Could not get user data.');
    // }
    //
    // final result = response.data;
    //
    // User user = User(
    //   name: result['user']['name'],
    //   email: result['user']['email'],
    //   password: result['user']['password'],
    // );
    //
    User user = User(id: 1, name: "Test", email: "test@test.com");
    //
    return user;
  }

  // Get a specific user from ID.
  Future<User> getUser(int id) async {
    final GraphQLClient _user = getGraphQLClient();

    final QueryOptions options = QueryOptions(
      document: gql(
        userQuery.getUsers(),
      ),
    );

    final QueryResult result = await _user.query(options);

    if (result.hasException) {
      // stderr.writeln(result.exception.toString());
      // exit(2);
      throw new Exception('Could not get the user data.');
    }

    print(result);

    // final result = response.data;
    //
    // User user = User(
    //   id: int.parse(result['user']['id']),
    //   name: result['user']['name'],
    //   avatar: result['user']['avatar'],
    //   email: result['user']['email'],
    //   password: result['user']['password'],
    //   messages: List<Message>.from(
    //     result['user']['messages'].map(
    //       (i) => Message(
    //         id: int.parse(i['id']),
    //         title: i['title'],
    //         body: i['body'],
    //       ),
    //     ),
    //   ),
    // );
    User user = User(id: 1, name: "Test", email: "test@test.com");
    //
    return user;
  }
//
//   // Log user into application.
//   Future<Message> loginUser(User user) async {
//     try {
//       GraphQLClient _user = graphQLConfiguration.clientToQuery();
//       QueryResult response = await _user.mutate(
//         MutationOptions(
//           documentNode: gql(
//             userMutation.loginUser(),
//           ),
//           variables: {
//             "input": {
//               "username": user.email,
//               "password": user.password,
//             }
//           },
//         ),
//       );
//
//       if (response.hasException) {
//         String message = response.exception.graphqlErrors.first.message;
//
//         // Incorrect user credentials.
//         if (message == 'The user credentials were incorrect.') {
//           throw new Exception(message + ' Please try again');
//         } else {
//           // Any other message.
//           throw new Exception(response.exception.graphqlErrors.toString());
//         }
//       }
//
//       final result = response.data;
//
//       if (response.data['login']['user']['email_verified_at'] == null) {
//         return Message(
//           status: 301,
//           title: 'Warning',
//           message: 'Please verify your email.',
//           colour: Palette.warningColour,
//           data: null,
//         );
//       }
//
//       return Message(
//         status: 200,
//         title: 'Success',
//         message: 'Logging you in...',
//         colour: Palette.successColour,
//         data: User(
//           id: int.parse(result['login']['user']['id']),
//           name: result['login']['user']['name'],
//           avatar: result['login']['user']['avatar'],
//           email: result['login']['user']['email'],
//           messages: List<Message>.from(
//             result['login']['user']['messages'].map(
//               (i) => Message(
//                 id: int.parse(i['id']),
//                 title: i['title'],
//                 body: i['body'],
//               ),
//             ),
//           ),
//         ),
//       );
//     } catch (e) {
//       return Message(
//         status: 401,
//         title: 'Error',
//         message: e.toString(),
//         colour: Palette.errorColour,
//         data: null,
//       );
//     }
//   }
//
//   // Register the user.
//   Future<Message> registerUser(User user, Profile profile, int location, int profession, String token, bool email, bool app, bool text) async {
//     try {
//       GraphQLClient _user = graphQLConfiguration.clientToQuery();
//       QueryResult response = await _user.mutate(
//         MutationOptions(
//           documentNode: gql(
//             userMutation.createUser(),
//           ),
//           variables: {
//             "input": {
//               "title": profile.title,
//               "firstname": profile.firstname,
//               "lastname": profile.lastname,
//               "email": user.email,
//               "password": user.password,
//               "mobile_number": profile.mobileNumber,
//               "site": location,
//               "job": profession,
//               "mobile_token": token,
//               "emailNotification": email,
//               "appNotification": app,
//               "textNotification": text,
//             }
//           },
//         ),
//       );
//
//       if (response.hasException && response.exception.graphqlErrors.first.extensions['validation'] != null) {
//         var message = response.exception.graphqlErrors.first.extensions['validation'].toString();
//         return Message(
//           status: 301,
//           title: 'Warning',
//           message: message,
//           colour: Palette.warningColour,
//         );
//       }
//
//       if (response.hasException) {
//         throw new Exception(response);
//       }
//
//       return Message(
//         status: 200,
//         title: 'Success',
//         message: 'You have been registered successfully. Please check your email.',
//         colour: Palette.successColour,
//       );
//     } catch (e) {
//       return Message(
//         status: 401,
//         title: 'Error',
//         message: e.toString(),
//         colour: Palette.errorColour,
//       );
//     }
//   }
//
//   // Forgotten user password.
//   Future<Message> forgottenPassword(String email) async {
//     try {
//       GraphQLClient _user = graphQLConfiguration.clientToQuery();
//       QueryResult response = await _user.mutate(
//         MutationOptions(
//           documentNode: gql(
//             userMutation.forgottenPassword(),
//           ),
//           variables: {
//             "input": {
//               "email": email,
//             }
//           },
//         ),
//       );
//
//       if (response.hasException) {
//         throw new Exception('There seems to be a problem. Please contact the system admin.');
//       }
//
//       final result = response.data;
//
//       if (result['forgotPassword']['status'] == 'EMAIL_NOT_SENT') {
//         return Message(
//           status: 301,
//           title: 'Warning',
//           message: result['forgotPassword']['message'],
//           colour: Palette.warningColour,
//         );
//       } else {
//         return Message(
//           status: 200,
//           title: 'Success',
//           message: result['forgotPassword']['message'],
//           colour: Palette.successColour,
//         );
//       }
//     } catch (e) {
//       return Message(
//         status: 401,
//         title: 'Error',
//         message: e.toString(),
//         colour: Palette.errorColour,
//       );
//     }
//   }
//
//   // Update the user information
//   Future<Message> updateUserDetails(int id, User user) async {
//     try {
//       GraphQLClient _user = graphQLConfiguration.clientToQuery();
//       QueryResult response = await _user.mutate(
//         MutationOptions(
//           documentNode: gql(
//             userMutation.updateUserDetails(),
//           ),
//           variables: {
//             "input": {
//               "id": id,
//               "firstname": user.profile.firstname,
//               "lastname": user.profile.lastname,
//               "email": user.email,
//               "mobile_number": user.profile.mobileNumber,
//             }
//           },
//         ),
//       );
//
//       if (response.hasException) {
//         String message = response.exception.graphqlErrors.first.message;
//         throw new Exception(message);
//       }
//
// //      QueryResult imageResponse = await _user.mutate(
// //        MutationOptions(
// //          documentNode: gql(
// //            userMutation.uploadImage(),
// //          ),
// //          variables: {"file": image},
// //        ),
// //      );
// //
// //      if (imageResponse.hasException) {
// //        String message = response.exception.toString();
// //        throw new Exception(message);
// //      }
//
//       final result = response.data;
//
//       return Message(
//         status: 200,
//         title: 'Success',
//         message: result['updateUserDetails']['message'],
//         colour: Palette.successColour,
//       );
//     } catch (e) {
//       return Message(
//         status: 400,
//         title: 'Error',
//         message: e.toString(),
//         colour: Palette.errorColour,
//       );
//     }
//   }
//
//   Future<Message> uploadUserAvatar(int id, dynamic imageFile) async {
//     String fileName = imageFile.path.split("/").last;
//     var byteData = imageFile.readAsBytesSync();
//
//     var multipartFile = http.MultipartFile.fromBytes(
//       'file',
//       byteData,
//       filename: fileName,
// //    contentType: MediaType("image", "jpg"),
//     );
//
//     try {
//       GraphQLClient _user = graphQLConfiguration.clientToQuery();
//       QueryResult response = await _user.mutate(
//         MutationOptions(
//           documentNode: gql(
//             userMutation.uploadUserAvatar(),
//           ),
//           variables: {"id": id, "file": multipartFile},
//         ),
//       );
//
//       if (response.hasException) {
//         String message = response.exception.toString();
//         throw new Exception(message);
//       }
//
//       final result = response.data;
//
//       return Message(
//         status: 200,
//         title: 'Success',
//         message: result['uploadUserAvatar']['message'],
//         colour: Palette.successColour,
//       );
//     } catch (e) {
//       return Message(
//         status: 400,
//         title: 'Error',
//         message: e.toString(),
//         colour: Palette.errorColour,
//       );
//     }
//   }
}
