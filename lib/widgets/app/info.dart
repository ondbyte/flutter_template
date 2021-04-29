import 'package:flutter/material.dart';
import './../../config/config.dart';
import './../../enum/enum.dart';

Widget appInfo(data) {
  return data.state == ViewStateType.Completed
      ? Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppEnv.description,
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: Font.primaryFont,
          ),
        )
      ],
    ),
  )
      : Text("");
}