import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityScreen extends StatefulWidget {
  @override
  _UnityScreenState createState() => _UnityScreenState();
}

class _UnityScreenState extends State<UnityScreen>{
  UnityWidgetController _unityWidgetController;
  UnityArguments arguments;

  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: WillPopScope(
        onWillPop: () {
          Logger().d('Going back to Camera Request from Unity Screen - OS back action');
          Navigator.pushNamed(context, arguments.model == UnityModel.GENERAL ? '/camera-request' : '/systems-menu');
          _unityWidgetController.pause();
          return Future.value(true);
        },
        child: Stack(
            children: <Widget>[
              UnityWidget(
                onUnityViewCreated: onUnityCreated,
                isARScene: true,
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
                                _unityWidgetController.pause();
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
                                _unityWidgetController.pause();
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
                                _unityWidgetController.pause();
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
        ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    _unityWidgetController = controller;
    String prefabName;
    switch(arguments.model) {
      case UnityModel.GENERAL:
        prefabName = 'General';
        break;
      case UnityModel.DIGESTIVE:
        prefabName = 'Digestive';
        break;
      case UnityModel.REPRODUCTIVE:
        prefabName = 'Reproductive';
        break;
      case UnityModel.SKELETAL:
        prefabName = 'Skeletal';
        break;
    }
    _unityWidgetController.postMessage(
        'AR Session Origin',
        'SetPrefabName',
        prefabName
    );
  }
}

class UnityArguments {
  final UnityModel model;

  UnityArguments(this.model);
}

enum UnityModel {
  GENERAL, DIGESTIVE, REPRODUCTIVE, SKELETAL
}