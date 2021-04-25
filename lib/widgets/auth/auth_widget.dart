import 'package:flutter/material.dart';
import './../../config/config.dart';
import './../../enum/enum.dart';
import './../../models/model.dart';
import './../../includes/include.dart';
import './../../viewmodels/viewmodels.dart';
import 'package:another_flushbar/flushbar.dart';

// List of input text fields for register view.
Widget listWidget(context, _formKey, data, user, profile, width) {
  var orientation = MediaQuery.of(context).orientation;

  void _snackBar(Message message) {
    Flushbar(
      title: message.title,
      message: message.message.replaceAll('[', '').replaceAll(']', ''),
      backgroundColor: message.colour,
      duration: Duration(seconds: message.status != 200 ? 7 : 3),
    )..show(context).then(
          (_) {
        // Send the user to the Initial Application Screen on success.
        if (message.status == 200) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              LoginViewRoute, (Route<dynamic> route) => false);
        }
      },
    );
  }

  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: InputText(
                initialValue: data.firstName,
                icon: Icons.person,
                hintText: 'First Name',
                validator: (String value) =>
                    FormValidator.validateInputField(value, 'firstname'),
                onChanged: (String value) {
                  data.updateFirstName(value);
                },
                onSaved: (String value) {
                  profile.firstname = value;
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: InputText(
              initialValue: data.lastName,
              icon: Icons.person,
              hintText: 'Surname',
              validator: (String value) =>
                  FormValidator.validateInputField(value, 'lastname'),
              onChanged: (String value) {
                data.updateLastName(value);
              },
              onSaved: (String value) {
                profile.lastname = value;
              },
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: InputText(
              initialValue: data.email,
              icon: Icons.email,
              hintText: 'Email Address',
              isEmail: true,
              validator: FormValidator.validateEmail,
              onChanged: (String value) {
                data.updateEmail(value);
              },
              onSaved: (String value) {
                user.email = value;
              },
            ),
          ),
          Expanded(
            child: InputText(
              initialValue: data.mobile,
              icon: Icons.mobile_screen_share,
              hintText: 'Mobile',
              validator: (String value) =>
                  FormValidator.validateNumberField(value, 'mobile'),
              onChanged: (String value) {
                data.updateMobile(value);
              },
              onSaved: (String value) {
                profile.mobileNumber = value;
              },
            ),
          )
        ],
      ),
      if (orientation == Orientation.portrait)
        Column(
          children: <Widget>[
            InputText(
              icon: Icons.lock,
              initialValue: data.password,
              hintText: 'Password',
              isPassword: true,
              validator: (String value) =>
                  FormValidator.validatePassword(value: value, passNumber: 8),
              onChanged: (String value) {
                data.updatePassword(value);
              },
              onSaved: (String value) {
                user.password = value;
              },
            ),
            InputText(
              icon: Icons.lock,
              initialValue: data.confirmPassword,
              hintText: 'Confirm Password',
              isPassword: true,
              validator: (String value) =>
                  FormValidator.validatePasswordConfirmation(
                      value, user.password),
              onChanged: (String value) {
                data.updateConfirmPassword(value);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            if (data.state != ViewStateType.Busy)
              for (var i = 0; i < data.legals.length; i++)
                Column(
                  children: <Widget>[
                    Container(
                      width: width * 0.95,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: Checkbox(
                              value: data.checkbox[i].value,
                              onChanged: (bool value) =>
                                  data.updateCheckBox(i, value),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Text(data.legals[i].description),
                          ),
                          if (data.legals[i].link != null)
                            SizedBox(
                              height: 25.0,
                              width: 25.0,
                              child: IconButton(
                                icon: Icon(
                                  Icons.info,
                                ),
                                iconSize: 15.0,
                                color: Palette.thirdColour,
                                onPressed: () =>
                                    navigateToUrl(data.legals[i].link),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                )
          ],
        ),
      if (orientation == Orientation.landscape)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: InputText(
                    icon: Icons.lock,
                    initialValue: data.password,
                    hintText: 'Password',
                    isPassword: true,
                    validator: (String value) => FormValidator.validatePassword(
                        value: value, passNumber: 8),
                    onSaved: (String value) {
                      user.password = value;
                    },
                  ),
                ),
                Expanded(
                  child: InputText(
                    icon: Icons.lock,
                    initialValue: data.confirmPassword,
                    hintText: 'Confirm Password',
                    isPassword: true,
                    validator: (String value) =>
                        FormValidator.validatePasswordConfirmation(
                            value, user.password),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            if (data.state != ViewStateType.Busy)
              for (var i = 0; i < data.legals.length; i++)
                Column(
                  children: <Widget>[
                    Container(
                      width: width * 0.87,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: Checkbox(
                              value: data.checkbox[i],
                              onChanged: (bool value) =>
                                  data.updateCheckBox(i, value),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Text(data.legals[i].description),
                          ),
                          if (data.legals[i].link != null)
                            SizedBox(
                              height: 25.0,
                              width: 25.0,
                              child: IconButton(
                                icon: Icon(
                                  Icons.info,
                                ),
                                iconSize: 15.0,
                                color: Palette.thirdColour,
                                onPressed: () =>
                                    navigateToUrl(data.legals[i].link),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
          ],
        ),
      Column(
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
                  backgroundColor: Palette.whiteColour,
                  strokeWidth: 2,
                ),
              )
                  : Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Register'),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Palette.primaryColour),
              ),
              onPressed: () {
                for (var i = 0; i < data.checkbox.length; i++) {
                  if (!data.checkbox[i].value) {
                    Flushbar(
                      title: 'Warning',
                      message:
                      'Please confirm the ${data.checkbox[i].name} checkbox.',
                      backgroundColor: Palette.warningColour,
                      duration: Duration(seconds: 5),
                    )..show(context);
                    return;
                  }
                }

                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  data
                      .registerUser(
                    user,
                    profile,
                  )
                      .then(
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
      ),
      SizedBox(height: 5.0),
      Container(
        alignment: Alignment(1.0, 0.0),
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(
            'Login',
            style: TextStyle(
              color: Palette.accentSecondColour,
              fontWeight: FontWeight.bold,
              fontFamily: Font.secondaryFont,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                LoginViewRoute, (Route<dynamic> route) => false);
          },
        ),
      ),
    ],
  );
}

// User login widget.
Widget userEmailTextInput(User user, _formKey) {
  return InputText(
    keyWord: "inputTextLogin",
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
    keyWord: "inputTextPassword",
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
              key: const ValueKey("siteProgressIndicator"),
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                Palette.whiteColour,
              ),
            ),
          )
              : Text(
            'Login',
            key: const ValueKey("siteLoginBtn"),
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
                  // Navigator.of(context).pop();
                  data.getForgottenPassword(email).then(
                        (message) {
                      _snackBar(message);
                    },
                  );
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