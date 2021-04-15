import 'package:flutter/material.dart';
import './../../../widgets/widgets.dart';
import './../../../models/model.dart';

class DrawerOptionMobileLandscape extends BaseModelWidget<DrawerItems> {
  @override
  Widget build(BuildContext context, DrawerItems data) {
    return Container(
      height: 45.0,
      alignment: Alignment.center,
      child: Icon(data.icon),
    );
  }
}

class DrawerOptionMobilePortrait extends BaseModelWidget<DrawerItems> {
  @override
  Widget build(BuildContext context, DrawerItems data) {
    return Container(
      padding: EdgeInsets.only(left: 25.0),
      height: 80.0,
      child: Row(
        children: <Widget>[
          Icon(
            data.icon,
            size: 25.0,
          ),
          SizedBox(
            width: 25.0,
          ),
          Text(
            data.title,
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
