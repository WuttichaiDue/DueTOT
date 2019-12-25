import 'package:duetot/utility/my_style.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  // ! Field
  // ! Method
  Widget nameForm() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name Product :'),
    );
  }

  Widget detailForm() {
    return TextFormField(maxLines: 6,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(labelText: 'Detail Product :'),
    );
  }

  Widget cameraButton() {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        size: 36.0,
      ),
      onPressed: () {},
    );
  }

  Widget galleryButton() {
    return IconButton(
      icon: Icon(
        Icons.add_photo_alternate,
        size: 36.0,
      ),
      onPressed: () {},
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        cameraButton(),
        galleryButton(),
      ],
    );
  }

  Widget showPicture() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.purpleAccent[100],
            Colors.lightBlueAccent[100],
            Colors.lightGreenAccent[100],
            Colors.yellowAccent[100],
          ],
        ),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Image.asset('images/pic.png'),
    );
  }

  Widget mainContent() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showPicture(),
            showButton(),
            nameForm(),
            detailForm(),
          ],
        ),
      ),
    );
  }

  Widget uploadButton() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().mainColor,
        title: Text(
          'Add New Product',
          style: MyStyle().appbarStyle,
        ),
      ),
      body: Stack(
        children: <Widget>[
          mainContent(),
        ],
      ),
    );
  }
}
