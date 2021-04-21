import 'package:flutter/material.dart';
import './../../models/model.dart';
import './drawer.dart';

class SideDrawer extends StatelessWidget {
  final bool isRow;
  final Orientation orientation;
  final double width;
  final double height;
  final Color colour;
  final bool showProfile;
  final String profilePosition;
  final double profileRadius;
  final String profileTitle;
  final Color profileColour;
  final String profileSubTitle;
  final Application application;

  SideDrawer(
      {this.isRow = false,
      this.orientation,
      this.width,
      this.height,
      this.colour,
      this.showProfile = false,
      this.profilePosition = 'start',
      this.profileRadius = 40.0,
      this.profileTitle,
      this.profileColour,
      this.profileSubTitle,
      this.application,
      });

  Widget profileStart() {
    if (isRow) {
      return Column(
        children: [
          Row(
            children: <Widget>[
              if (showProfile)
                Container(
                  width: width,
                  height: height,
                  color: colour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: profileRadius,
                        child: Text(profileTitle),
                        backgroundColor: profileColour,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(profileSubTitle)
                    ],
                  ),
                ),
              Row(
                children: AppDrawer.getDrawerOptions(application),
              ),
              // Spacer(),
              // Text("Test")
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Bottom'),
            ),
          )
        ],
      );
    }

    return Column(children: <Widget>[
      if (showProfile)
        Container(
          width: width,
          height: height,
          color: colour,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: profileRadius,
                child: Text(profileTitle),
                backgroundColor: profileColour,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(profileSubTitle),
            ],
          ),
        ),
      if (orientation != Orientation.portrait)
        SizedBox(
          height: 15.0,
        ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: AppDrawer.getDrawerOptions(application),
      )
    ]);
  }

  Widget profileEnd() {
    if (isRow) {
      return Row(
        children: <Widget>[
          Row(
            children: AppDrawer.getDrawerOptions(application),
          ),
          Spacer(),
          if (showProfile)
            Container(
              width: width,
              height: height,
              color: colour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: profileRadius,
                    child: Text(profileTitle),
                    backgroundColor: profileColour,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(profileSubTitle)
                ],
              ),
            ),
        ],
      );
    }
    return Column(
      children: <Widget>[
        if (orientation != Orientation.portrait)
          SizedBox(
            height: 15.0,
          ),
        Column(
          children: AppDrawer.getDrawerOptions(application),
        ),
        Spacer(),
        if (showProfile)
          Container(
            width: width,
            height: height,
            color: colour,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: profileRadius,
                  child: Text(profileTitle),
                  backgroundColor: profileColour,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(profileSubTitle),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return profilePosition == 'start' ? profileStart() : profileEnd();
  }
}
