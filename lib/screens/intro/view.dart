import 'package:flutter/material.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';
import './../../viewmodels/viewmodels.dart';
import './../../screens/screens.dart';

class IntroView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<IntroViewModel>(
        viewModel: IntroViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => IntroViewMobilePortrait(),
            landscape: (context) => IntroViewMobileLandscape(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => IntroViewMobilePortrait(),
            landscape: (context) => IntroViewMobileLandscape(),
          ),
        ),
      ),
    );
  }
}