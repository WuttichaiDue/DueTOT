import 'dart:io';

import 'package:duetot/models/user_model.dart';
import 'package:duetot/scaffold/authen.dart';
import 'package:duetot/scaffold/webview_youtube.dart';
import 'package:duetot/scaffold/webview_google.dart';
import 'package:duetot/utility/my_style.dart';
import 'package:duetot/widgets/show_infomation.dart';
import 'package:duetot/widgets/show_list_product.dart';
import 'package:duetot/widgets/show_video.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class MyService extends StatefulWidget {
  final UserModel userModel;

  //const MyService({Key key, this.userModel}) : super(key: key);

  MyService({Key key, this.userModel}) : super(key: key);
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // ! Field
  UserModel myUserModel;
  Widget currentWidget;
  // ! Method
  @override
  void initState() {
    super.initState();
    myUserModel = widget.userModel;
    currentWidget = ShowListProduct(
      userModel: myUserModel,
    );
  }

  Widget menuShowList() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
        color: Colors.purpleAccent,
      ),
      title: Text(
        'Show List Product',
        style: MyTextStyle().nomalTextStyle7,
      ),
      subtitle: Text(
        ' : Expand or Description Menu Show List Product',
        style: MyTextStyle().subtitleTextStyle7,
      ),
      onTap: () {
        setState(() {
          currentWidget = ShowListProduct();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget menuShowInfo() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
        color: Colors.lightBlue,
      ),
      title: Text(
        'Show Infomation',
        style: MyTextStyle().nomalTextStyle6,
      ),
      subtitle: Text(
        ' : Expand or Description Menu Infomation',
        style: MyTextStyle().subtitleTextStyle6,
      ),
      onTap: () {
        setState(() {
          currentWidget = ShowInfomation();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget menuShowQrCode() {
    return ListTile(
      leading: Icon(
        Icons.filter_3,
        color: Colors.lightBlueAccent,
      ),
      title: Text(
        'Show QrCode',
        style: MyTextStyle().nomalTextStyle5,
      ),
      subtitle: Text(
        ' : Expand or Description Menu QrCode and BarCode',
        style: MyTextStyle().subtitleTextStyle5,
      ),
    );
  }

  Widget menuVibration() {
    return ListTile(
      leading: Icon(
        Icons.vibration,
        color: Colors.lightGreen,
      ),
      title: Text(
        'Vibration',
        style: MyTextStyle().nomalTextStyle4,
      ),
      subtitle: Text(
        ' : Test ... Vibration ',
        style: MyTextStyle().subtitleTextStyle4,
      ),
      onTap: () {
        setState(() {
          Vibration.vibrate(duration: 1000);
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget menuVideo() {
    return ListTile(
      leading: Icon(
        Icons.videocam,
        color: Colors.yellow[700],
      ),
      title: Text(
        'List Video',
        style: MyTextStyle().nomalTextStyle3,
      ),
      subtitle: Text(
        ' : Expand ListVideo',
        style: MyTextStyle().subtitleTextStyle3,
      ),
      onTap: () {
        setState(() {
          currentWidget = ListVideo();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget menuGoogle() {
    return ListTile(
      leading: Icon(
        Icons.search,
        color: Colors.deepOrangeAccent,
      ),
      title: Text(
        'Google',
        style: MyTextStyle().nomalTextStyle2,
      ),
      subtitle: Text(
        ' : Web Google ',
        style: MyTextStyle().subtitleTextStyle2,
      ),
      onTap: () {
        setState(() {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext buildContext) => WebViewGoogle());

          Navigator.of(context).push(materialPageRoute);
        });
      },
    );
  }

  Widget menuYoutube() {
    return ListTile(
      leading: Icon(
        Icons.ondemand_video,
        color: Colors.redAccent,
      ),
      title: Text(
        'YouTube',
        style: MyTextStyle().nomalTextStyle1,
      ),
      subtitle: Text(
        ' : Web View Youtube ',
        style: MyTextStyle().subtitleTextStyle1,
      ),
      onTap: () {
        setState(() {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext buildContext) => WebViewYoutube());

          Navigator.of(context).push(materialPageRoute);
        });
      },
    );
  }

  Widget menuSingOut() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
        color: Colors.purpleAccent,
      ),
      title: Text(
        'Sing Out',
        style: MyTextStyle().nomalTextStyle7,
      ),
      subtitle: Text(
        ' : Sing Out ',
        style: MyTextStyle().subtitleTextStyle7,
      ),
      onTap: () {
        signOutProcess();
      },
    );
  }

  Future<void> signOutProcess() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    // exit(0); //!Exit App
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext buildcontext) {
      return Authen();
    });
    Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
        (Route<dynamic> route) {
      return false;
    });
  }

  Widget showNameLogin() {
    return Text(
      'Login by ${myUserModel.name}',
      style: MyStyle().drawerTextStyle,
    );
  }

  Widget showAvatarDrawer() {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
            gradient: RadialGradient(
              colors: <Color>[
                Colors.white,
                Colors.blue[50],
                Colors.lightBlueAccent,
              ],
              radius: 1.5,
            )),
        width: 100.0,
        height: 100.0,
        child: ClipOval(
          child: Image.network(myUserModel.avatar, fit: BoxFit.cover),
        )
        // CircleAvatar(
        //   //backgroundColor: Colors.white,
        //   backgroundImage: NetworkImage(myUserModel.avatar),
        // ),
        );
  }

  Widget showHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/walldrawer.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          showAvatarDrawer(),
          showNameLogin(),
        ],
      ),
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHeadDrawer(),
          menuShowList(),
          Divider(
            color: Colors.purpleAccent[700],
          ),
          menuShowInfo(),
          Divider(
            color: Colors.lightBlue[700],
          ),
          menuShowQrCode(),
          Divider(
            color: Colors.lightBlueAccent,
          ),
          menuVibration(),
          Divider(
            color: Colors.lightGreenAccent,
          ),
          menuVideo(),
          Divider(
            color: Colors.yellowAccent,
          ),
          menuGoogle(),
          Divider(
            color: Colors.orangeAccent,
          ),
          menuYoutube(),
          Divider(
            color: Colors.redAccent,
          ),
          menuSingOut(),
          Divider(
            color: Colors.purpleAccent[700],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showDrawer(),
      appBar: AppBar(
        backgroundColor: MyStyle().mainColor,
        title: Text(
          'MyService',
          style: MyStyle().appbarStyle,
        ),
      ),
      body: currentWidget,
    );
  }
}
