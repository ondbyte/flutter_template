// Class to determine the orientation layout of the device.
import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget Function(BuildContext) landscape;
  final Widget Function(BuildContext) portrait;

  OrientationLayout({
    this.landscape,
    @required this.portrait,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.landscape) {
        if (landscape != null) {
          return landscape(context);
        }
      }

      return portrait(context);
    });
  }
}
