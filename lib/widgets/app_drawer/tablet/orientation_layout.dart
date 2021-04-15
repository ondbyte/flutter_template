import 'package:flutter/material.dart';
import './../side_drawer.dart';

class AppDrawerTabletLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 175.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              color: Colors.black12,
            ),
          ],
        ),
        child: SideDrawer(
          orientation: Orientation.landscape,
          height: 150.0,
          width: double.infinity,
          colour: Colors.orangeAccent,
          showProfile: true,
          profileTitle: 'TestTitle',
          profileColour: Colors.redAccent,
          profileSubTitle: 'SubTitle',
        ));
  }
}

class AppDrawerTabletPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15.0,
            color: Colors.black12,
          ),
        ],
      ),
      child: SideDrawer(
        isRow: true,
        orientation: Orientation.landscape,
        height: double.infinity,
        width: 150.0,
        colour: Colors.orangeAccent,
        showProfile: true,
        profilePosition: 'end',
        profileTitle: 'TestTitle',
        profileColour: Colors.redAccent,
        profileSubTitle: 'SubTitle',
      ),
    );
  }
}
