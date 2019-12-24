import 'package:duetot/utility/my_style.dart';
import 'package:flutter/material.dart';

Widget showTitle(String title) {
  return ListTile(
    leading: Icon(
      Icons.add_alert,
      color: Colors.redAccent[700],
      size: 40.0,
    ),
    title: Text(
      title,
      style: MyStyle().titledialogStyle,
    ),
  );
}

Widget okButton(BuildContext buildContext) {
  return FlatButton(
    child: Text('OK',style: MyStyle().buttondialogStyle,),
    onPressed: () {
      Navigator.of(buildContext).pop();
    },
  );
}

Future<void> normalDialog(
    BuildContext buildContext, String title, String message) async {
  showDialog(
      context: buildContext,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: showTitle(title),
          content: Text(message,style: MyStyle().nomaldialogStyle,),
          actions: <Widget>[
            okButton(buildContext),
          ],
        );
      });
}
