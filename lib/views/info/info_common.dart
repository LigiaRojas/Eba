import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> buildText(String text, {
  TextAlign textAlign: TextAlign.justify,
  String fontFamily: 'LeagueSpartan',
  fontSize: 18.0,
  height: 1.4,
  Color dividerColor: Colors.white,
}) {
  return [
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: fontFamily,
          color: Colors.black,
          fontSize: fontSize,
          height: height,
      ),
    ),
    buildDivider(color: dividerColor),
  ];
}

List<Widget> buildBoxedText(String text, {
  String fontFamily: 'LeagueSpartan',
  fontSize: 18.0,
  height: 1.4,
  Color dividerColor: Colors.white,
}) {
  return [
    Container(
      color: Color(0xffaad4aa),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: fontFamily,
            color: Colors.black,
            fontSize: fontSize,
            height: height,
        ),
      ),
    ),
    buildDivider(color: dividerColor),
  ];
}

Divider buildDivider({ Color color: Colors.white }) => Divider(
  thickness: color == Colors.white ? 0.0 : 5.0,
  height: 20.0,
  color: color,
);

List<Widget> buildHeader(String bottomText, double fontSize, Function backButtonAction) {
  return [
    Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.topLeft,
        color: Color(0xff363839),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        onPressed: backButtonAction,
                        child: Image.asset('images/left-arrow.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.only(top: 55.0, right: 25.0),
                      child: Text(
                        'Sistema',
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          color: Colors.white,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        bottomText,
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          color: Colors.white,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    ),
    Divider(
      thickness: 6.0,
      height: 0.0,
      color: Color(0xffaad4aa),
    ),
  ];
}