import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //!Field

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
      color: Colors.blueAccent[100],
      child: Text(
        'Sign In',
        style: TextStyle(
          fontFamily: 'IndieFlower',
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
    );
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
      onPressed: () {},
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
        decoration: InputDecoration(
          labelText: 'Usermane :',
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'DueTOT',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.yellowAccent,
        fontFamily: 'IndieFlower',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.grey[200],
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: <Color>[
            Colors.white,
            Colors.lightBlueAccent,
          ],
          radius: 1.5,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                mySizeBox(),
                showAppName(),
                userForm(),
                passwordForm(),
                mySizeBox(),
                showButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
