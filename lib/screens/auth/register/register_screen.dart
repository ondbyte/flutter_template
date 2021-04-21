import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import 'viewmodel/register_viewmodel.dart';
import 'mobile/orientation_layout.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => RegisterMobilePortrait(),
          landscape: (context) => RegisterMobileLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => RegisterMobilePortrait(),
          landscape: (context) => RegisterMobileLandscape(),
        ),
      ),
    );
  }
}