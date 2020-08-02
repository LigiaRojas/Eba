import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
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
              //margin: const EdgeInsets.only(top: 90.0),
              child: Image.asset('images/Bienvenido.png'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/Logo-2.png'),
            ),
          )
        ],
      ),
    );
  }
}