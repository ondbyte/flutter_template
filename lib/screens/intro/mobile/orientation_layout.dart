import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../screens/screens.dart';
import './../../../viewmodels/viewmodels.dart';

class IntroViewMobilePortrait extends BaseModelWidget<IntroViewModel> {
  @override
  Widget build(BuildContext context, IntroViewModel data) {
    var height = MediaQuery.of(context).size.height;
    return data.state == ViewStateType.Busy
        ? BusyOverlay(
      show: data.state == ViewStateType.Busy,
      child: const Text(''),
    )
        : Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: SplashScreen(
            seconds: 8,
            navigateAfterSeconds: data.user != null && data.user.id > 0 ? HomeView() : LoginView(),
            title: Text(
              AppEnv.description,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                fontSize: 12.0,
                fontFamily: Font.secondaryFont,
              ),
            ),
            image: Image.asset('assets/images/logo.png'),
            backgroundColor: Palette.whiteColour,
            photoSize: height > 570.0 ? 85.0 : 50.0,
            onClick: () {},
            loaderColor: Palette.primaryColour,
            loadingText: Text(
              'Loading app...',
              style: TextStyle(
                fontFamily: Font.secondaryFont,
                color: Palette.primaryColour,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IntroViewMobileLandscape extends BaseModelWidget<IntroViewModel> {
  @override
  Widget build(BuildContext context, IntroViewModel data) {
    var height = MediaQuery.of(context).size.height;
    return data.state == ViewStateType.Busy
        ? BusyOverlay(
      show: data.state == ViewStateType.Busy,
      child: const Text(''),
    )
        : Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: SplashScreen(
            seconds: 8,
            navigateAfterSeconds: data.user.id > 0 ? HomeView() : LoginView(),
            title: Text(
              AppEnv.description,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                fontSize: 12.0,
                fontFamily: Font.secondaryFont,
              ),
            ),
            image: Image.asset('assets/images/logo.png'),
            backgroundColor: Palette.whiteColour,
            photoSize: height > 570.0 ? 85.0 : 50.0,
            onClick: () {},
            loaderColor: Palette.primaryColour,
            loadingText: Text(
              'Loading app...',
              style: TextStyle(
                fontFamily: Font.secondaryFont,
                color: Palette.primaryColour,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
