import 'package:graphql/client.dart';

GraphQLClient getGraphQLClient() {
  final Link _link = HttpLink(
    'https://www.imarveldesign.co.uk/graphql',
    defaultHeaders: {
      // ignore: undefined_identifier
      'Authorization': 'Bearer ',
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}
