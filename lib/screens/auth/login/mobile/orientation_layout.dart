import 'package:flutter/material.dart';
import './../../../../config/config.dart';
import './../../../../enum/enum.dart';
import './../../../../models/model.dart';
import './../../../../widgets/widgets.dart';
import './../../../../includes/include.dart';
import './../../../../partials/partial.dart';
import './../../../../viewmodels/viewmodels.dart';
import 'package:another_flushbar/flushbar.dart';

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

// User login widget.
Widget userEmailTextInput(User user, _formKey) {
  return InputText(
    icon: Icons.email,
    hintText: 'Email Address',
    isEmail: true,
    validator: FormValidator.validateEmail,
    onSaved: (String value) {
      user.email = value;
    },
  );
}

// User password widget.
Widget userPasswordTextInput(User user, _formKey) {
  return InputText(
    icon: Icons.lock,
    hintText: 'Password',
    isPassword: true,
    validator: (String value) => FormValidator.validatePassword(value: value, passNumber: 8),
    onSaved: (String value) {
      user.password = value;
    },
  );
}

// Login button.
Widget loginBtn(BuildContext context, User user, _formKey, LoginViewModel data) {
  // Alert the user of the progress..
  void _snackBar(Message message) {
    Flushbar(
      title: message.title,
      message: message.message.replaceAll('Exception: ', ''),
      backgroundColor: message.colour,
      duration: Duration(seconds: message.status != 200 ? 7 : 3),
    )..show(context).then(
        (_) {
          data.setState(ViewStateType.Completed);
          // Send the user to the Initial Application Screen on success.
          if (message.status == 200) {
            Navigator.of(context).pushNamedAndRemoveUntil(HomeViewRoute, (Route<dynamic> route) => false, arguments: {'user': message.data, 'information': 'dashboard'});
          }
        },
      );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: data.state == ViewStateType.Processing
              ? SizedBox(
                  height: 15.0,
                  width: 15.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Palette.whiteColour,
                    ),
                  ),
                )
              : Text(
                  'Login',
                  style: TextStyle(
                    color: Palette.whiteColour,
                    fontFamily: Font.secondaryFont,
                  ),
                ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Palette.primaryColour),
          ),
          onPressed: () {
            // Form validation is Successful.
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              data.logUserIn(user).then(
                (message) {
                  // Alert message to the user.
                  _snackBar(message);
                },
              ).catchError((error) {
                // print(error);
                var errorMessage = Message(
                  status: 400,
                  title: 'Error',
                  message: error.toString(),
                  colour: Palette.errorColour,
                );

                // Alert message to the user.
                _snackBar(errorMessage);
              });
            }
          },
        ),
      )
    ],
  );
}

// Register/ Forgotten Password actions.
Widget registerForgottenPassword(BuildContext context, LoginViewModel data) {
  TextEditingController forgottenEmailTxt = TextEditingController();
  final _formAlertKey = GlobalKey<FormState>();

  var email = '';

  void _snackBar(Message message) {
    Flushbar(
      title: message.title,
      message: message.message,
      backgroundColor: Palette.warningColour,
      duration: Duration(seconds: 7),
    )..show(context);
  }

  // Alert Dialog Popup.
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Forgotten Password',
            style: TextStyle(
              color: Palette.primaryColour,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: Font.primaryFont,
            ),
          ),
          content: Container(
            child: Form(
              key: _formAlertKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: FormValidator.validateEmail,
                      onSaved: (String value) {
                        email = value;
                      },
                      controller: forgottenEmailTxt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Request password via email',
                        labelText: 'Email Address',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Palette.primaryColour)),
              child: data.state == ViewStateType.Busy
                  ? SizedBox(
                      height: 15.0,
                      width: 15.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Palette.whiteColour,
                        ),
                      ),
                    )
                  : Text(
                      'Submit',
                      style: TextStyle(
                        color: Palette.whiteColour,
                        fontFamily: Font.secondaryFont,
                      ),
                    ),
              onPressed: () {
                // Form validation is successfull.
                if (_formAlertKey.currentState.validate()) {
                  // Close the dialog.
                  Navigator.of(context).pop();
                  // data.getForgottenPassword(email).then(
                  //       (message) {
                  //     _snackBar(message);
                  //   },
                  // );
                }
              },
            ),
          ],
        );
      },
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 10.0),
        child: InkWell(
          child: Text(
            'Register',
            style: TextStyle(
              color: Palette.accentSecondColour,
              fontWeight: FontWeight.bold,
              fontFamily: Font.secondaryFont,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(RegisterViewRoute, (Route<dynamic> route) => false);
          },
        ),
      ),
      Container(
        padding: const EdgeInsets.only(right: 10.0),
        child: InkWell(
          child: Text(
            'Forgot Password',
            style: TextStyle(
              color: Palette.accentSecondColour,
              fontWeight: FontWeight.bold,
              fontFamily: Font.secondaryFont,
            ),
          ),
          onTap: () {
            _showDialog();
          },
        ),
      ),
    ],
  );
}
