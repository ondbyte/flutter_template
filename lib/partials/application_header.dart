import 'package:flutter/material.dart';
import './../models/model.dart';
import './../config/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeApplicationHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  HomeApplicationHeader({@required GlobalKey<ScaffoldState> scaffoldKey}) : _scaffoldKey = scaffoldKey;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
          icon: Icon(Icons.menu),
        ),
        Image.asset(
          'assets/images/logo.png',
          height: 50.0,
        ),
        Stack(
          children: <Widget>[
            IconButton(
              onPressed: () { print("What does this do");},
              icon: Icon(Icons.shopping_cart),
            ),

          ],
        )
      ],
    );
  }
}

class ApplicationHeader extends StatelessWidget {
  final User user;
  final String route;
  final String information;

  const ApplicationHeader({Key key, this.user, this.route, this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        information != 'dashboard'
            ? IconButton(
                onPressed: () => route == null
                    ? Navigator.pushNamed(context, InitialScreenRoute, arguments: user)
                    : route == 'goback' ? Navigator.of(context).pop() : Navigator.of(context).pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false),
                icon: Icon(Icons.arrow_back),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.dashboard),
              ),
        Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 35.0,
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            information != 'dashboard'
                ? IconButton(
                    onPressed: () { print("What does this do again?");},
                    icon: Icon(Icons.shopping_cart),
                  )
                : IconButton(
                    onPressed: () => _logUserOut(context),
                    icon: Icon(FontAwesomeIcons.signOutAlt),
                  ),

          ],
        )
      ],
    );
  }
}


void _logUserOut(BuildContext context) {
  Navigator.pushNamed(context, LoginScreenRoute);
}
