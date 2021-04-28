import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../../screens/screens.dart';

class RegisterView extends StatelessWidget {
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
