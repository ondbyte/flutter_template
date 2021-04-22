// Application environments
class AppEnv {
  static const bool hasLogo = true;
  static const app = 'Only Way To Settle';
  static const name = 'This';
  static const description = 'The only place to resolve an argument!';
  static const version = '1.0.0';

  static const bool fakeData = true;

  // Live site:
  static const String graphQLApi = "https://app.bonappetit.co.uk";

  // API link with images.
  final String graphQLApiImg = graphQLApi + '/storage/';
}
