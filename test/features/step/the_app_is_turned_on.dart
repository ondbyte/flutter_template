import 'package:flutter_template/config/orientation_layout.dart';
import 'package:flutter_template/config/screen_type_layout.dart';
import 'package:flutter_template/screens/intro/mobile/orientation_layout.dart';
import 'package:flutter_template/screens/intro/view.dart';
import 'package:flutter_template/viewmodels/viewmodels.dart';
import 'package:flutter_template/widgets/app_drawer/drawer.dart';
import 'package:flutter_template/widgets/base_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> theAppIsTurnedOn(WidgetTester tester) async {
  Widget createWidgetForTesting({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  // Get the splash view widget.
  await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => new IntroViewModel(),
      child: createWidgetForTesting(child: new IntroViewMobilePortrait())));

  //tester.pumpAndSettle() will throw (see the documentation) if it finds an infinite
  //animation like a loader, so itll not be a fit for our scenerio.
  //you should manually call tester.pump() instead which will wait for given time or moved ahead if
  //there is no frame updates
  await tester.pump(Duration(seconds: 10));
  //await tester.pumpAndSettle();

  // Create the Finders.
  final appLoading = find.byKey(ValueKey('appLoading'));

  // Use the `findsOneWidget` matcher provided by flutter_test to
  // verify that the Text widgets appear exactly once in the widget tree.
  expect(appLoading, findsOneWidget);
}

Widget wrapWithController<T>(T controller, Widget child) {
  return Provider<T>(create: (_) => controller, child: child);
}
