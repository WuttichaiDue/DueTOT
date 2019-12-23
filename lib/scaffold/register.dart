import 'package:flutter/material.dart';
import 'package:duetot/utility/my_style.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ! Field

  // ! Method
  Widget nameForm() {
    Color color = Colors.lightBlue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Name :',
              labelStyle: TextStyle(color: color),
              helperText: 'Type Your Name in Blank',
              helperStyle: TextStyle(color: color),
              hintText: 'English Only',
              icon: Icon(
                Icons.account_box,
                size: 36.0,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget userForm() {
    Color color = Colors.lightGreen;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Username :',
              labelStyle: TextStyle(color: color),
              helperText: 'Type Your Username in Blank',
              helperStyle: TextStyle(color: color),
              hintText: 'English Only',
              icon: Icon(
                Icons.email,
                size: 36.0,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordForm() {
    Color color = Colors.lime;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Password :',
              labelStyle: TextStyle(
                color: color,
              ),
              helperText: 'Type Your Password in Blank',
              helperStyle: TextStyle(
                color: color,
                fontFamily: 'IndieFlower',
                fontWeight: FontWeight.bold,
              ),
              hintText: 'more 6 Charactor',
              icon: Icon(
                Icons.lock,
                size: 36.0,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget cameraButton() {
    return OutlineButton.icon(
      icon: Icon(Icons.add_a_photo),
      label: Text(
        'Camera',
        style: TextStyle(
          fontFamily: 'IndieFlower',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
    );
  }

  Widget galleryButton() {
    return OutlineButton.icon(
      icon: Icon(Icons.add_photo_alternate),
      label: Text(
        'Gallery',
        style: TextStyle(
          fontFamily: 'IndieFlower',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        cameraButton(),
        galleryButton(),
      ],
    );
  }

  Widget showAvatar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Image.asset(
        'images/avatar.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(
        Icons.cloud_upload,
        size: 36.0,
      ),
      onPressed: () {},
      tooltip: 'Upload tp Server',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().mainColor,
        title: Text(
          ' Register . . . ',
          style: TextStyle(
            fontFamily: 'IndieFlower',
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
        actions: <Widget>[
          registerButton(),
        ],
      ),
      body: ListView(
        children: <Widget>[
          showAvatar(),
          showButton(),
          nameForm(),
          userForm(),
          passwordForm(),
        ],
      ),
    );
  }
}
