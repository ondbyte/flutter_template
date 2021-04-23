// Application environments
class AppEnv {
  static const bool hasLogo = true;
  static const app = 'Only Way To Settle';
  static const name = 'This';
  static const description = 'The only place to resolve an argument!';
  static const version = '1.0.0';

  static const bool fakeData = false;

  // Live site:
  // static const String graphQLApi = "https://app.bonappetit.co.uk";

  // Test Site:
  static const String ngrok = "d48137ce2ce8";

  // Full link for API.
  static const String graphQLApi = 'https://$ngrok.ngrok.io/graphql';

  // API link with images.
  static const String graphQLApiImg = graphQLApi + '/storage/';
}
