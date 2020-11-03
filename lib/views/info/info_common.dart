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
  TextAlign textAlign: TextAlign.center,
  alignment: Alignment.center,
  String fontFamily: 'LeagueSpartan',
  fontSize: 18.0,
  height: 1.4,
  Color dividerColor: Colors.white,
}) {
  return [
    Container(
      color: Color(0xffaad4aa),
      alignment: alignment,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: textAlign,
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

Widget buildHeaderDivider() => Divider(
  thickness: 6.0,
  height: 0.0,
  color: Color(0xffaad4aa),
);

Widget buildHeader(String bottomText, double fontSize, Function backButtonAction, { String topText: 'Sistema' }) {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
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
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Text(
                    topText,
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
          flex: 3,
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
  );
}