// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_turned_on.dart';
import './step/i_should_see.dart';

void main() {
  group('Splash page.', () {
    testWidgets('The splash page shows on initial launch.', (tester) async {
      await theAppIsTurnedOn(tester);
      await iShouldSee(tester, 'The only place to resolve an argument!');
    });
  });
}
