// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_template/config/locator.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_turned_on.dart';
import './step/i_should_see.dart';

void main() {
  setupLocator();
  group('Splash page.', () {
    testWidgets('The splash page shows on initial launch.', (tester) async {
      await theAppIsTurnedOn(tester);
    });
  });
}
