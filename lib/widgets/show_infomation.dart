import 'package:duetot/utility/my_style.dart';
import 'package:flutter/material.dart';
class ShowInfomation extends StatefulWidget {
  @override
  _ShowInfomationState createState() => _ShowInfomationState();
}

class _ShowInfomationState extends State<ShowInfomation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MyStyle().containerDecoration,
      child:  Text('This is Infomation'),
    );
  }
}