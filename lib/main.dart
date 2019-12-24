import 'package:flutter/material.dart';
import 'package:duetot/scaffold/authen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '         /(O_o)/ ',
      debugShowCheckedModeBanner: false,
      home: Authen(),
    );
  }
}
