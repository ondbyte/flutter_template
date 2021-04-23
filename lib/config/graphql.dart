import './../config/config.dart';
import 'package:graphql/client.dart';

// GraphQL set up.
GraphQLClient getGraphQLClient(String bearerToken) {
  final Link _link = HttpLink(
    AppEnv.graphQLApi,
    defaultHeaders: {
      // ignore: undefined_identifier
      'Authorization': 'Bearer $bearerToken',
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}
