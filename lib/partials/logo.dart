import 'package:flutter/material.dart';

// Logo widget.
class Logo extends StatelessWidget {
  final double height;

  Logo({this.height});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        child: Image.asset(
          'assets/images/logo.png',
          width: 100.0,
          height: 100.0,
        ),
      ),
    );
  }
}
