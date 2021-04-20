import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../viewmodel/home_viewmodel.dart';
import './../../../widgets/widgets.dart';

class HomeMobilePortrait extends BaseModelWidget<HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return BusyOverlay(
      show: data.state != ViewStateType.Completed,
      child: Scaffold(
        key: _scaffold,
        drawer: AppDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("This is the floating action btn");
//          data.updateTitle();
            Navigator.pushNamed(context, LoginScreenRoute);
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
              child: _appInfo(data),
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
            AppDrawer(),
            Expanded(
              child: Center(
                child: Center(
                  child: _appInfo(data),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _appInfo(data) {
  return data.state == ViewStateType.Completed
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppEnv.description,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: Font.primaryFont,
                ),
              ),
              Text(data.application.name),
              Text(data.application.version),
              Text(data.application.year),
            ],
          ),
        )
      : Text("");
}
