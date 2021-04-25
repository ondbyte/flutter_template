import 'package:flutter/material.dart';
import './../../../../enum/enum.dart';
import './../../../../models/model.dart';
import './../../../../widgets/widgets.dart';
import './../../../../includes/include.dart';
import './../../../../partials/partial.dart';
import './../../../../viewmodels/viewmodels.dart';

class RegisterMobilePortrait extends BaseModelWidget<RegisterViewModel> {
  static final _formKey = GlobalKey<FormState>();
  final int titleID = 0;
  final User user = User(name: "", email: "");
  final Profile profile = Profile();

  @override
  Widget build(BuildContext context, RegisterViewModel data) {
    var width = MediaQuery.of(context).size.width;
    return FullBusyOverlay(
      show: data.state == ViewStateType.Busy,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            left: true,
            top: true,
            right: true,
            child: Column(
              children: <Widget>[
                buildLogo(context, 150.0),
                PageTitle(
                  title: 'Register',
                  height: 50.0,
                ),
                if (data.state != ViewStateType.Busy)
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        listWidget(
                            context, _formKey, data, user, profile, width),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterMobileLandscape extends BaseModelWidget<RegisterViewModel> {
  final _formKey = GlobalKey<FormState>();
  final int titleID = 0;
  final User user = User(name: "", email: "");
  final Profile profile = Profile();
  @override
  Widget build(BuildContext context, RegisterViewModel data) {
    var width = MediaQuery.of(context).size.width;
    return FullBusyOverlay(
      show: data.state == ViewStateType.Busy,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            left: true,
            top: true,
            right: true,
            child: Column(
              children: <Widget>[
                buildLogo(context, 150.0),
                PageTitle(
                  title: 'Register',
                  height: 50.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
                if (data.state != ViewStateType.Busy)
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        listWidget(
                            context, _formKey, data, user, profile, width),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

