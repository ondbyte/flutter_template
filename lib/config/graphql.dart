import 'package:graphql/client.dart';

// GraphQL set up.
GraphQLClient getGraphQLClient(String bearerToken) {
  final Link _link = HttpLink(
    'https://www.imarveldesign.co.uk/graphql',
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
