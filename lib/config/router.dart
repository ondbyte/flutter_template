import 'package:flutter/material.dart';
import 'routing_constants.dart';
import './../screens/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case IntroScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => IntroScreen(),
    //   );
    case HomeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    case LoginScreenRoute:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );
    // case RegisterScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => RegisterScreen(),
    //   );
    // case InitialScreenRoute:
    //   var arguments = settings.arguments;
    //   return MaterialPageRoute(
    //     builder: (context) => InitialScreen(
    //       user: arguments,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name,
        ),
      );
  }
}
