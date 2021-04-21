import 'package:flutter/material.dart';
import './../../config/config.dart';
import './../../models/model.dart';
import './../../widgets/widgets.dart';
import 'package:provider/provider.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData icon;

  DrawerOption({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: DrawerItems(title: title, icon: icon),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => DrawerOptionMobilePortrait(),
          landscape: (context) => DrawerOptionMobileLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => DrawerOptionTabletPortrait(),
          landscape: (context) => DrawerOptionTabletLandscape(),
        ),
      ),
    );
  }
}
