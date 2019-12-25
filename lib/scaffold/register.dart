import 'dart:io';
import 'dart:math';

import 'package:duetot/utility/normal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:duetot/utility/my_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ! Field
  File file;
  String name, username, password, avatar;
  final formKey = GlobalKey<FormState>();
  // ! Method
  Widget nameForm() {
    Color color = Colors.lightBlue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextFormField(
            onSaved: (String string) {
              name = string.trim();
            },
            decoration: InputDecoration(
              //  enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color:color),
              //         ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color),
              ),
              labelText: 'Name :',
              labelStyle: TextStyle(
                color: color,
              ),
              helperText: 'Type Your Name in Blank',
              helperStyle: TextStyle(
                color: color,
                fontFamily: 'IndieFlower',
                fontWeight: FontWeight.bold,
              ),
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
            onSaved: (String string) {
              username = string.trim();
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color),
              ),
              labelText: 'Username :',
              labelStyle: TextStyle(
                color: color,
              ),
              helperText: 'Type Your Username in Blank',
              helperStyle: TextStyle(
                color: color,
                fontFamily: 'IndieFlower',
                fontWeight: FontWeight.bold,
              ),
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
            onSaved: (String string) {
              password = string.trim();
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color),
              ),
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
      onPressed: () {
        cameraAndGalleryThread(ImageSource.camera);
      },
    );
  }

  Future<void> cameraAndGalleryThread(ImageSource imageSource) async {
    var object = await ImagePicker.pickImage(
      source: imageSource,
      maxHeight: 800.0,
      maxWidth: 600.0,
    );
    setState(() {
      file = object;
    });
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
      onPressed: () {
        cameraAndGalleryThread(ImageSource.gallery);
      },
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
      child: file == null
          ? Image.asset(
              'images/avatar.png',
              fit: BoxFit.contain,
            )
          : Image.file(file),
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(
        Icons.cloud_upload,
        size: 36.0,
      ),
      onPressed: () {
        formKey.currentState.save();
        if (file == null) {
          normalDialog(context, 'Non Choose Image',
              '" Please Click Camera or Gallery for Choose Image. "');
        } else if (name.isEmpty) {
          normalDialog(context, 'Name Blank!', '" Please Type Your Name. "');
        } else if (username.isEmpty) {
          normalDialog(
              context, 'Username Blank!', '" Please Type Your Username. "');
        } else if (password.isEmpty) {
          normalDialog(
              context, 'Password Blank!', '" Please Type Your Password. "');
        } else if (password.length < 6) {
          normalDialog(context, 'Password Weak!',
              '" Please Type Your Password more 6 Charactor. "');
        } else {
          uploadPictureToServer();
        }
      },
      tooltip: 'Upload tp Server',
    );
  }

  Future<void> uploadPictureToServer() async {
    Random random = Random();
    int i = random.nextInt(12345);
    String namePicture = 'avartar$i.jpg';
    avatar = 'https://www.androidthai.in.th/tot/Due/$namePicture';
    String url = 'https://www.androidthai.in.th/tot/saveFileDue.php';

    try {
      Map<String, dynamic> map = Map();
      map['file'] = UploadFileInfo(file, namePicture);
      FormData formData = FormData.from(map);
      Response response = await Dio().post(url, data: formData);
      var result = response.data;
      String string = result['message'];

      if (string == "File uploaded successfully") {
        insertDatatoMysql();
      } else {
        print('cannot Upload');
      }
    } catch (e) {}
  }

  Future<void> insertDatatoMysql() async {
    String url =
        'https://www.androidthai.in.th/tot/addDataDue.php?isAdd=true&Name=$name&User=$username&Password=$password&Avata=$avatar';
    Response response = await Dio().get(url);
    var result = response.data;
    print(result);
    if (result.toString() == 'true') {
      Navigator.of(context).pop();
    } else {
      normalDialog(context, 'Cannot Register', 'Please Try Again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().mainColor,
        title: Text(
          ' Register . . . ',
          style: MyStyle().appbarStyle,
        ),
        actions: <Widget>[
          registerButton(),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            showAvatar(),
            showButton(),
            nameForm(),
            userForm(),
            passwordForm(),
          ],
        ),
      ),
    );
  }
}
