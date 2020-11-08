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
    final UnityArguments arguments = ModalRoute.of(context).settings.arguments;
    return Stack(
        children: <Widget>[
          Scaffold(
            resizeToAvoidBottomPadding: false,
            key: _scaffoldKey,
            body: WillPopScope(
              onWillPop: () {
                Logger().d('Going back to Camera Request from Unity Screen - OS back action');
                Navigator.pushNamed(context, arguments.model == UnityModel.GENERAL ? '/camera-request' : '/systems-menu');
                return Future.value(true);
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
                            Navigator.pushNamed(context, arguments.model == UnityModel.GENERAL ? '/camera-request' : '/systems-menu');
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
                            switch(arguments.model) {
                              case UnityModel.GENERAL:
                                Logger().d('Going to General Information Menu from Unity Screen');
                                Navigator.pushNamed(context, '/general-screen');
                                break;
                              case UnityModel.DIGESTIVE:
                                Logger().d('Going to Digestive Information Menu from Unity Screen');
                                Navigator.pushNamed(context, '/digestive-screen');
                                break;
                              case UnityModel.REPRODUCTIVE:
                                Logger().d('Going to Reproductive Information Menu from Unity Screen');
                                Navigator.pushNamed(context, '/reproductive-screen');
                                break;
                              case UnityModel.SKELETAL:
                                Logger().d('Going to Skeletal Information Menu from Unity Screen');
                                Navigator.pushNamed(context, '/skeletal-screen');
                                break;
                            }
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

class UnityArguments {
  final UnityModel model;

  UnityArguments(this.model);
}

enum UnityModel {
  GENERAL, DIGESTIVE, REPRODUCTIVE, SKELETAL
}