import 'package:flutter/material.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';
import './../../models/model.dart';

class AppDrawer extends StatelessWidget {
  final Application application;

  AppDrawer(this.application);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AppDrawerMobile(application),
      tablet: OrientationLayout(
        landscape: (context) => AppDrawerTabletLandscape(),
        portrait: (context) => AppDrawerTabletPortrait(),
      ),
    );
  }

  static List<Widget> getDrawerOptions(Application application) {
    return <Widget>[
      DrawerOption(
        title: 'Images',
        icon: Icons.image,
      ),
      DrawerOption(
        title: 'Reports',
        icon: Icons.photo_filter,
      ),
      DrawerOption(
        title: 'Incidents',
        icon: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        icon: Icons.settings,
      ),
      SizedBox(
        height: 200.0,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Name: ${application.name} \nVersion: ${application.version}'),
          ),
        ),
      )
    ];
  }
}
