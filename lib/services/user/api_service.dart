import 'package:graphql/client.dart';
import './../../services/user/api.dart';
import '../../models/model.dart';
import '../../config/config.dart';
import '../../api/api.dart';

UserQuery userQuery = UserQuery();
UserMutation userMutation = UserMutation();

class UserService implements UserApi {
  // Get a list of users from the site.
  @override
  Future<List<User>> getUsers() async {
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
  }

  // Get a specific user from ID.
  @override
  Future<User> getUser(int id) async {

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
  }
}
