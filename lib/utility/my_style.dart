import 'package:flutter/material.dart';

class MyStyle {
  Color mainColor = Colors.lightBlueAccent[100];
  Color textColor = Colors.yellowAccent;
  TextStyle titledialogStyle = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
    color: Colors.red,
  );
  TextStyle nomaldialogStyle = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.deepOrangeAccent,
  );
  TextStyle drawerTextStyle = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
    color: Colors.white,
    shadows: [
      Shadow(
          // bottomLeft
          offset: Offset(-1, -1),
          color: Colors.purpleAccent),
      Shadow(
          // bottomRight
          offset: Offset(1, -1),
          color: Colors.lightBlueAccent),
      Shadow(
          // topRight
          offset: Offset(1, 1),
          color: Colors.lightGreenAccent),
      Shadow(
          // topLeft
          offset: Offset(-1, 1),
          color: Colors.redAccent[100]),
    ],
  );

  TextStyle nomalTextStyle = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.blueAccent[700],
  );

  TextStyle subtitleTextStyle = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.blueAccent[400],
  );
  TextStyle buttondialogStyle = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: Colors.yellowAccent[700],
  );
  TextStyle appbarStyle = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 32.0,
    color: Colors.white,
    shadows: [
      Shadow(
          // bottomLeft
          offset: Offset(-1, -1),
          color: Colors.purpleAccent),
      Shadow(
          // bottomRight
          offset: Offset(1, -1),
          color: Colors.lightBlueAccent),
      Shadow(
          // topRight
          offset: Offset(1, 1),
          color: Colors.lightGreenAccent),
      Shadow(
          // topLeft
          offset: Offset(-1, 1),
          color: Colors.redAccent[100]),
    ],
  );

  TextStyle textStyle = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.white,
    shadows: [
      Shadow(
          // bottomLeft
          offset: Offset(-0.5, -0.5),
          color: Colors.purpleAccent),
      Shadow(
          // bottomRight
          offset: Offset(0.5, -0.5),
          color: Colors.lightBlueAccent),
      Shadow(
          // topRight
          offset: Offset(0.5, 0.5),
          color: Colors.lightGreenAccent),
      Shadow(
          // topLeft
          offset: Offset(-0.5, 0.5),
          color: Colors.redAccent[100]),
    ],
  );
  BoxDecoration containerDecoration = BoxDecoration(
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.lightBlueAccent[100],
            Colors.white,
            Colors.green[50],
            Colors.yellow[100],
          ],
        ),
      );

  MyStyle();
}

class MyTextStyle {
  TextStyle nomalTextStyle7 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.purpleAccent[700],
  );

  TextStyle subtitleTextStyle7 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.purpleAccent[400],
  );
  TextStyle nomalTextStyle6 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.lightBlue[900],
  );

  TextStyle subtitleTextStyle6 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.lightBlue[700],
  );
  TextStyle nomalTextStyle5 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.lightBlueAccent[700],
  );
  TextStyle subtitleTextStyle5 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.lightBlueAccent[400],
  );
  TextStyle nomalTextStyle4 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.lightGreenAccent[700],
  );
  TextStyle subtitleTextStyle4 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.lightGreenAccent[400],
  );
  TextStyle nomalTextStyle3 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.yellowAccent[700],
  );
  TextStyle subtitleTextStyle3 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.yellowAccent[400],
  );
  TextStyle nomalTextStyle2 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.orangeAccent[700],
  );
  TextStyle subtitleTextStyle2 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.orangeAccent[400],
  );
  TextStyle nomalTextStyle1 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.redAccent[700],
  );
  TextStyle subtitleTextStyle1 = TextStyle(
    fontFamily: 'IndieFlower',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: Colors.redAccent[400],
  );
  MyTextStyle();
}
