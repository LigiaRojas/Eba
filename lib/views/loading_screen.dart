import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eba/database/login.dart';
import 'package:eba/database/driver.dart';
import 'package:flutter_session/flutter_session.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void goToNextScreen() async {
    var sessionId = await FlutterSession().get('id');
    if (sessionId == null) {
      bool connectedSuccessfully = await Driver().openConnection();
      Future.delayed(Duration(milliseconds: connectedSuccessfully ? 100 : 2000), () {
        Logger().d('Going to Login Form from Loading Screen');
        Navigator.pushReplacementNamed(context, '/login-form');
      });
    } else {
      Logger().d('Already logged in. Session ID: $sessionId');
      if (sessionId is Map<String, dynamic>) {
        Logger().d('Login info is stored locally. Attempting to save');
        var loginInfo = Login(
            age: sessionId['edad'],
            country: sessionId['pais'],
            department: sessionId['departamento'],
            city: sessionId['municipio']
        );
        Driver().login(loginInfo);
      } else if (sessionId is! String) {
        Logger().d('Session ID is corrupted. Closing application');
        SystemNavigator.pop();
      }
      Future.delayed(Duration(milliseconds: 2000), () {
        Logger().d('Going to Camera Request from Loading Screen');
        Navigator.pushReplacementNamed(context, '/camera-request');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffaad4aa),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('images/welcome.png'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/logo.png'),
            ),
          )
        ],
      ),
    );
  }
}