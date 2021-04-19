// Application environments
class AppEnv {
  final String appName = 'App Name';
  final String appVersion = 'App Version';
  final int settingsPrimary = 0xFF0080FF;
  final int settingsAccent = 0xFF6FBEFF;
  final int settingsBackground = 0xFFFFFFFF;
  final int settingsSliderStatus = 0;
  final int settingsSliderFull = 0;

  static const bool fakeData = true;

  // Live site:
  static const String graphQLApi = "https://app.bonappetit.co.uk";

  // API link with images.
  final String graphQLApiImg = graphQLApi + '/storage/';
}
