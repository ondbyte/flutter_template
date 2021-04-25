import 'package:flutter/material.dart';
import './../config/config.dart';

class PageTitle extends StatelessWidget {
  final double height;
  final String title;
  final String keyWord;
  PageTitle({this.height, this.title, this.keyWord});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            key: ValueKey(keyWord),
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: Font.primaryFont,
            ),
          ),
          Text(
            '.',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              color: Palette.primaryColour,
              fontFamily: Font.primaryFont,
            ),
          ),
        ],
      ),
    );
  }
}
