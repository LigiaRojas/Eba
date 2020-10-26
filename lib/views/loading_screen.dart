import 'package:flutter/material.dart';

import 'package:flutter_session/flutter_session.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void goToNextScreen() async {
    var sessionId = await FlutterSession().get('id');
    if (sessionId == null) {
      Navigator.pushReplacementNamed(context, '/login-form');
    } else {
      Navigator.pushReplacementNamed(context, '/camera-request');
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      goToNextScreen();
    });
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