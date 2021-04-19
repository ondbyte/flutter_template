import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import 'viewmodel/login_viewmodel.dart';
import 'mobile/orientation_layout.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      viewModel: LoginViewModel(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => LoginMobilePortrait(),
          landscape: (context) => LoginMobileLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => LoginMobilePortrait(),
          landscape: (context) => LoginMobileLandscape(),
        ),
      ),
    );
  }
}