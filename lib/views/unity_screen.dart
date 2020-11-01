import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityScreen extends StatefulWidget {

  UnityScreen({Key key}) : super(key: key);

  @override
  _UnityScreenState createState() => _UnityScreenState();
}

class _UnityScreenState extends State<UnityScreen>{
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
                Logger().d('Going back to Camera Request from Unity Screen - OS back action');
                Navigator.pushNamed(context, '/camera-request');
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
                            Logger().d('Going back to Camera Request from Unity Screen - On screen back button');
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
                            Logger().d('Going to Information Menu from Unity Screen');
                            // TODO: Navigator.pushNamed(context, '/information-menu');
                          },
                          child: Image.asset('images/information-button.png'),
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
                            Logger().d('Going to Systems Menu from Unity Screen');
                            Navigator.pushNamed(context, '/systems-menu');
                          },
                          child: Image.asset('images/systems-button.png'),
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