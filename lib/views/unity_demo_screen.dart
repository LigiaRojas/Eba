import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityDemoScreen extends StatefulWidget {

  UnityDemoScreen({Key key}) : super(key: key);

  @override
  _UnityDemoScreenState createState() => _UnityDemoScreenState();
}

class _UnityDemoScreenState extends State<UnityDemoScreen>{
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  UnityWidgetController _unityWidgetController;

  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Scaffold(
            resizeToAvoidBottomPadding: false,
            key: _scaffoldKey,
            body: WillPopScope(
              onWillPop: () {
                Navigator.pushNamed(context, '/camera-request');
                // Pop the category page if Android back button is pressed.
                // go back to camera request
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
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/camera-request');
                          },
                          child: Image.asset('images/left-arrow.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          onPressed: () {
                            // TODO: Navigator.pushNamed(context, '/information-menu');
                            print('Information button.');
                          },
                          child: Image.asset('images/information_button.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/systems-menu');
                          },
                          child: Image.asset('images/systems_button.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  color: Colors.transparent,
                ),
              )
            ],
          ),
        ]
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}