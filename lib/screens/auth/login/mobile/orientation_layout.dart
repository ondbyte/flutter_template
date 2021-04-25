import 'package:flutter/material.dart';
import './../../../../models/model.dart';
import './../../../../widgets/widgets.dart';
import './../../../../includes/include.dart';
import './../../../../partials/partial.dart';
import './../../../../viewmodels/viewmodels.dart';

class LoginMobilePortrait extends BaseModelWidget<LoginViewModel> {
  final _formKey = GlobalKey<FormState>();
  final User user = User();

  @override
  Widget build(BuildContext context, LoginViewModel data) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          left: true,
          top: true,
          right: true,
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildLogo(context, 150.0),
              PageTitle(
                title: 'Login',
                height: 100.0,
                keyWord: "sitePageTitle",
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    userEmailTextInput(user, _formKey),
                    userPasswordTextInput(user, _formKey),
                    loginBtn(context, user, _formKey, data),
                    SizedBox(height: 5.0),
                    registerForgottenPassword(context, data),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginMobileLandscape extends BaseModelWidget<LoginViewModel> {
  final _formKey = GlobalKey<FormState>();
  final User user = User();
  @override
  Widget build(BuildContext context, LoginViewModel data) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          left: true,
          top: true,
          right: true,
          child: Column(
            children: <Widget>[
              buildLogo(context, 150.0),
              PageTitle(
                title: 'Login',
                height: 50.0,
                keyWord: "sitePageTitle",
              ),
              SizedBox(
                height: 25.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: userEmailTextInput(user, _formKey),
                        ),
                        Expanded(
                          child: userPasswordTextInput(user, _formKey),
                        ),
                      ],
                    ),
                    loginBtn(context, user, _formKey, data),
                    SizedBox(height: 5.0),
                    registerForgottenPassword(context, data),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

