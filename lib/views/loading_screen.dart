import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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