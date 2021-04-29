import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../../widgets/widgets.dart';

class HomeMobilePortrait extends BaseModelWidget<HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return FullBusyOverlay(
      show: data.state != ViewStateType.Completed,
      child: Scaffold(
        key: _scaffold,
        drawer: AppDrawer(data.application),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            data.logUserOut();
            Navigator.pushNamed(context, LoginViewRoute);
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 25.0,
                ),
                onPressed: () {
                  _scaffold.currentState.openDrawer();
                },
              ),
            ),
            Expanded(
              child: appInfo(data),
            )
          ],
        ),
      ),
    );
  }
}

class HomeMobileLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return BusyOverlay(
      show: data.state == ViewStateType.Busy,
      child: Scaffold(
        body: Row(
          children: <Widget>[
            AppDrawer(data.application),
            Expanded(
              child: Center(
                child: Center(
                  child: appInfo(data),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

