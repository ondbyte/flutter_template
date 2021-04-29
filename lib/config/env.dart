// Application environments
class AppEnv {
  static const bool hasLogo = true;
  static const app = 'Only Way To Settle';
  static const name = 'This';
  static const description = 'The only place to resolve an argument!';
  static const version = '1.0.0';

  static const bool fakeData = false;

  // Live site:
  // static const String graphQLApi = "https://www.imarveldesign.co.uk/graphql";

  // // Test Site:
  static const String ngrok = "cb54b55869f2";
  //
  // // Full link for API.
  static const String graphQLApi = 'https://$ngrok.ngrok.io/graphql';

  // API link with images.
  static const String graphQLApiImg = graphQLApi + '/storage/';
}
