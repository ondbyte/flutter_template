import 'package:graphql/client.dart';
import './../../services/services.dart';
import '../../models/model.dart';
import '../../config/config.dart';
import '../../api/api.dart';

ApplicationQuery applicationQuery = ApplicationQuery();

class ApplicationService implements ApplicationApi {
  // Get a list of applications from the site.
  @override
  Future<Application> getApplication() async {

    final String bearerToken = null;
    final GraphQLClient _application = getGraphQLClient(bearerToken);

    final QueryOptions options = QueryOptions(
      document: gql(
        applicationQuery.getApplicationData(),
      ),
    );

    final QueryResult response = await _application.query(options);

    if (response.hasException) {
      throw new Exception('APPLICATION ERROR: ${response.exception.toString()}');
    }

    final result = response.data;

    Application application = Application(
      name: result['application']['name'],
      version: result['application']['version'],
      environment: result['application']['environment'],
      year: result['application']['year'],
    );

    return application;
  }
}
