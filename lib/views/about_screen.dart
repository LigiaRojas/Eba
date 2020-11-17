import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: FlatButton(
                        child: Image.asset('images/close-button.png'),
                        onPressed: () {
                          Logger().d('Close About Screen');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Image.asset('images/round-logo.png'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(
                        'Versión 1.0.0',
                        style: TextStyle(
                          fontFamily: 'Canda Tawa Regular',
                          color: Color(0xff363839),
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(
                        'DESARROLLADO POR',
                        style: TextStyle(
                          fontFamily: 'Canda Tawa Regular',
                          color: Color(0xffaad4aa),
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Ligia Fernanda Rojas Sarmiento\n'
                            'Diana Carolina Páez Castiblanco',
                        style: TextStyle(
                          fontFamily: 'Canda Tawa Regular',
                          color: Color(0xff363839),
                          fontSize: 33.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Como trabajo de grado para obtener el título de\n'
                        'Ingeniero de Sistemas de la Universidad de Cundinamarca.\n'
                        '2020',
                        style: TextStyle(
                          fontFamily: 'Canda Tawa Regular',
                          color: Color(0xffaad4aa),
                          fontSize: 23.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
