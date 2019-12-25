import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:duetot/models/user_model.dart';
import 'package:duetot/scaffold/my_service.dart';
import 'package:duetot/utility/normal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:duetot/utility/my_style.dart';
import 'package:duetot/scaffold/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //!Field
  String username, password;
  final formKey = GlobalKey<FormState>();
  //!Method
  Widget mySizeBox() {
    return SizedBox(
      width: 5.0,
      height: 10.0,
    );
  }

  Widget signInButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: MyStyle().mainColor,
      child: Text(
        'Sign In',
        style: TextStyle(
          fontFamily: 'IndieFlower',
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        formKey.currentState.save();
        if (username.isEmpty || password.isEmpty) {
          normalDialog(
              context, 'Have Space', '" Please Fill All Every Blank. "');
        } else {
          checkAuthenGetType();
          //checkAuthenPostType();
        }
      },
    );
  }

  Future<void> checkAuthenPostType() async {
    String url = 'http://iservice.totinnovate.com/WebAPI/LoginPost';
    Map<String, dynamic> map = Map();
    map['UserName'] = username;
    map['Password'] = password;
    Response response = await Dio().post(url, data: map);
    print(response);
  }

  Future<void> checkAuthenGetType() async {
    String url =
        'https://www.androidthai.in.th/tot/getUserWhereUserDue.php?isAdd=true&User=$username';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
    print(result);
    if (result.toString() == 'null') {
      normalDialog(context, 'User False', '" No $username in my Database. "');
    } else {
      for (var item in result) {
        UserModel userModel = UserModel.fromJson(item);
        if (password == userModel.password) {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext buildContext) {
            return MyService(
              userModel: userModel,
            );
          });
          Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
              (Route<dynamic> route) {
            return false;
          });
        } else {
          normalDialog(context, 'Password False',
              '" Please Try Agains Password False. "');
        }
      }
    }
  }

  Widget signUpButton() {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        'Sign Up',
        style: TextStyle(
          fontFamily: 'IndieFlower',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        print('object');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
        });
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        mySizeBox(),
        signUpButton(),
      ],
    );
  }

  Widget userForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        onSaved: (String string) {
          username = string.trim();
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().mainColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.lightGreenAccent[400]),
          ),
          hintText: 'Usermane :',
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        onSaved: (String string) {
          password = string.trim();
        },
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().mainColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.lightGreenAccent[400]),
          ),
          hintText: 'Password :',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 140.0,
      height: 140.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      '- DueTOT -',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: MyStyle().textColor,
        fontFamily: 'IndieFlower',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue[50],
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: <Color>[
            Colors.white,
            Colors.blue[50],
            Colors.lightBlueAccent,
          ],
          radius: 1.5,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  showLogo(),
                  mySizeBox(),
                  showAppName(),
                  userForm(),
                  mySizeBox(),
                  passwordForm(),
                  mySizeBox(),
                  showButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
