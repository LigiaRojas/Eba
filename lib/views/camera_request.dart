import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:eba/views/Unity/unity_arguments.dart';

class CameraRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffaad4aa),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
            ),
          ),
          Divider(
            indent: 30.0,
            endIndent: 30.0,
            thickness: 3.0,
            height: 0.0,
            color: Colors.white,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Vamos a conocer a',
                  style: TextStyle(
                    fontFamily: 'Canda Tawa Regular',
                    fontSize: 45.0,
                    color: Color(0xff363839),
                  ),
                ),
                Text(
                  'Eba',
                  style: TextStyle(
                    fontFamily: 'Canda Tawa Regular',
                    fontSize: 75.0,
                    color: Color(0xff363839),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset('images/logo-cropped.png'),
                Text(
                  'Activa la cámara y ubícate\nfrente al marcador.',
                  style: TextStyle(
                    fontFamily: 'LeagueSpartan',
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset('images/left-stain.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Image.asset('images/camera.png'),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container()
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: FlatButton(
                                  onPressed: () {
                                    Logger().d('Going to Unity Screen from Camera Request');
                                    Navigator.pushNamed(
                                      context,
                                      '/unity-screen',
                                      arguments: UnityArguments(UnityModel.GENERAL),
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'ACTIVAR',
                                          style: TextStyle(
                                            fontFamily: 'LeagueSpartan',
                                            color: Colors.white,
                                            fontSize: 22.0,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                          child: Image.asset('images/dashed-line.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topRight,
                            child: Image.asset('images/right-stain.png'),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
