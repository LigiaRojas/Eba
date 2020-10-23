import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityDemoScreen extends StatefulWidget {

  UnityDemoScreen({Key key}) : super(key: key);

  @override
  _UnityDemoScreenState createState() => _UnityDemoScreenState();
}

class _UnityDemoScreenState extends State<UnityDemoScreen>{
  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();
  UnityWidgetController _unityWidgetController;

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return Stack(
        children: <Widget>[
          Scaffold(
            resizeToAvoidBottomPadding: false,
            key: _scaffoldKey,
            body: WillPopScope(
              onWillPop: () {
                // Pop the category page if Android back button is pressed.
              },
              child: Container(
                color: Colors.yellowAccent,
                child: UnityWidget(
                  onUnityViewCreated: onUnityCreated,
                  isARScene: true,
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              print('Right overlay.');
            },
            child: Image.asset('images/right-arrow.png'),
          ),
        ]
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}