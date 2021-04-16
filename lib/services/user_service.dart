import 'package:graphql/client.dart';

import './../models/model.dart';
import './../config/config.dart';
import './../api/api.dart';

UserQuery userQuery = UserQuery();
UserMutation userMutation = UserMutation();

class UserService {
  // Get a list of users from the site.
  Future<List<User>> getUsers() async {
    final GraphQLClient _user = getGraphQLClient();

    final QueryOptions options = QueryOptions(
      document: gql(
        userQuery.getUsers(),
      ),
    );

    final QueryResult response = await _user.query(options);

    if (response.hasException) {
      throw new Exception('Could not get users data ${response.exception.toString()}.');
    }

    final result = response.data;

    Iterable list = result['users'];

    return list.map((users) => User.fromJson(users)).toList();
  }

  // Get a specific user from ID.
  Future<User> getUser(int id) async {
    final GraphQLClient _user = getGraphQLClient();

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
      throw new Exception('Could not get the user data. ${response.exception.toString()}');
    }

    final result = response.data;

    User user = User(
      id: int.parse(result['user']['id']),
      name: result['user']['name'],
      avatar: result['user']['avatar'],
      email: result['user']['email'],
    );

    return user;
  }
}
