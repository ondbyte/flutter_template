import 'package:flutter/material.dart';
import 'routing_constants.dart';
import './../screens/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case IntroScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => IntroScreen(),
    //   );
    case HomeViewRoute:
      return MaterialPageRoute(
        builder: (context) => HomeView(),
      );
    case LoginViewRoute:
      return MaterialPageRoute(
        builder: (context) => LoginView(),
      );
    case RegisterViewRoute:
      return MaterialPageRoute(
        builder: (context) => RegisterView(),
      );
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
