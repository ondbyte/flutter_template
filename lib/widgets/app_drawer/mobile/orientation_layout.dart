import 'package:flutter/material.dart';
import './../../../models/model.dart';
import './../side_drawer.dart';

class AppDrawerMobile extends StatelessWidget {
  final Application application;

  AppDrawerMobile(this.application);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      width: orientation == Orientation.portrait ? 200.0 : 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15.0,
            color: Colors.black12,
          )
        ],
      ),
      child: SafeArea(
        child: SideDrawer(
            orientation: orientation,
            width: double.infinity,
            height: orientation == Orientation.portrait ? 150.0 : 75.0,
            colour: Colors.orangeAccent,
            showProfile: orientation == Orientation.portrait ?? true,
            profileRadius: orientation == Orientation.portrait ? 40.0 : 20.0,
            profileTitle: 'TestTitle',
            profileColour: Colors.redAccent,
            profileSubTitle: 'SubTitle',
            application: application),
      ),
    );
  }
}
