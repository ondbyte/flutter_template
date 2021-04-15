import 'package:flutter/material.dart';
import './../../../widgets/widgets.dart';
import './../../../models/model.dart';

class DrawerOptionTabletPortrait extends BaseModelWidget<DrawerItems> {
  @override
  Widget build(BuildContext context, DrawerItems data) {
    return Container(
      width: 150.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            data.icon,
            size: 45.0,
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

class DrawerOptionTabletLandscape extends BaseModelWidget<DrawerItems> {
  @override
  Widget build(BuildContext context, DrawerItems data) {
    return Container(
      height: 120.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            data.icon,
            size: 45.0,
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
