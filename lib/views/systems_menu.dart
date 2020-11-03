import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:eba/views/unity_screen.dart';

class SystemsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffaad4aa),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 6.0, right: 30.0, bottom: 0.0),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '¿Cuál sistema\nquieres ver?',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        color: Color(0xff363839),
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 0.0, right: 180.0, bottom: 0.0),
                        child: Image.asset('images/brushstroke.png')),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: buildButton(
                    action: () {
                      Logger().d('Going to Unity Screen with Skeletal System context from Systems Menu');
                      Navigator.pushNamed(
                        context,
                        '/unity-screen',
                        arguments: UnityArguments(UnityModel.SKELETAL),
                      );
                    },
                    left: Image.asset('images/bone.png'),
                    right: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: buildButtonText('Sistema\nóseo.'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Image.asset('images/middle-spilled-milk.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: buildButton(
                    action: () {
                      Logger().d('Going to Unity Screen with Reproductive System context from Systems Menu');
                      Navigator.pushNamed(
                        context,
                        '/unity-screen',
                        arguments: UnityArguments(UnityModel.REPRODUCTIVE),
                      );
                    },
                    left: Image.asset('images/reproductive.png'),
                    right: buildButtonText('Sistema\nreproductor.'),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: buildButton(
                    action: () {
                      Logger().d('Going to Unity Screen with Digestive System context from Systems Menu');
                      Navigator.pushNamed(
                        context,
                        '/unity-screen',
                        arguments: UnityArguments(UnityModel.DIGESTIVE),
                      );
                    },
                    left: Image.asset('images/digestive.png'),
                    right: buildButtonText('Sistema\ndigestivo.'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 20.0, right: 20.0),
                            child: FlatButton(
                                onPressed: () {
                                  Logger().d('Going back from Systems Menu - On screen back button');
                                  Navigator.pop(context);
                                },
                                child: Image.asset('images/left-arrow.png'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 20.0, left: 20.0),
                            child: FlatButton(
                              onPressed: () {
                                Logger().d('Going to Videos Screen from Systems Menu');
                                Navigator.pushNamed(context, '/videos-screen');
                              },
                              child: Image.asset('images/right-arrow.png'),
                            ),
                          ),
                        ),
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

  FlatButton buildButton({Function action, Widget left, Widget right}) => FlatButton(
    padding: EdgeInsets.zero,
    onPressed: action,
    child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                  child: left,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.centerRight,
                child: right,
              ),
            ),
          ],
        ),
  );

  Container buildButtonText(String text) => Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Canda Tawa Regular',
              fontSize: 30.0,
              height: 0.8,
              color: Color(0xff363839),
            ),
          ),
        ),
      );
}
