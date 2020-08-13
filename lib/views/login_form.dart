import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
            ),
          ),
          Divider(
            indent: 30.0,
            endIndent: 30.0,
            thickness: 3.0,
            height: 0.0,
            color: Color(0xffaad4aa),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 30.0, top: 8.0, right: 30.0, bottom: 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                'QUEREMOS\nSABER\nMÁS\nSOBRE\nTI',
                style: TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 50.0,
                  color: Color(0xff363839),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Color(0xffaad4aa),
              alignment: Alignment.topCenter,
              child: Image.asset('images/spilled-milk.png'),
            ),
          ),
        ],
      ),
    );
  }
}
