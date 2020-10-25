import 'package:flutter/material.dart';

class VideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 145.0, right: 100.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Left.');
                  },
                  child: Image.asset('images/left-arrow.png'),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Color(0xffaad4aa).withOpacity(0.3), BlendMode.overlay),
                  image: AssetImage('images/cows.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 6.0,
            height: 0.0,
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background-green.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

