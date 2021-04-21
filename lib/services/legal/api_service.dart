import 'package:graphql/client.dart';
import './../../services/services.dart';
import '../../models/model.dart';
import '../../config/config.dart';
import '../../api/api.dart';

LegalQuery legalQuery = LegalQuery();

class LegalService implements LegalApi {
  // Get a list of legals from the site.
  @override
  Future<List<Legal>> getLegalInfo() async {

    final String bearerToken = null;
    final GraphQLClient _legal = getGraphQLClient(bearerToken);

    final QueryOptions options = QueryOptions(
      document: gql(
        legalQuery.getLegalInfo(),
      ),
    );

    final QueryResult response = await _legal.query(options);

    if (response.hasException) {
      throw new Exception('LEGAL ERROR: ${response.exception.toString()}');
    }

    final result = response.data;

    Iterable list = result['legalInformation'];

    return list.map((legal) => Legal.fromJson(legal)).toList();

  }
}
