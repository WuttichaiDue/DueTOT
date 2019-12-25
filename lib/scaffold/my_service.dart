import 'package:duetot/models/user_model.dart';
import 'package:duetot/utility/my_style.dart';
import 'package:duetot/widgets/show_infomation.dart';
import 'package:duetot/widgets/show_list_product.dart';
import 'package:flutter/material.dart';

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
  Widget currentWidget = ShowListProduct();
  // ! Method
  @override
  void initState() {
    super.initState();
    myUserModel = widget.userModel;
    print('${myUserModel.name}');
  }

  Widget menuShowList() {
    return ListTile(
      leading: Icon(Icons.filter_1),
      title: Text(
        'Show List Product',
        style: MyStyle().nomalTextStyle,
      ),
      subtitle: Text(
        ' : Expand or Description Menu Show List Product',
        style: MyStyle().subtitleTextStyle,
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
      leading: Icon(Icons.filter_2),
      title: Text(
        'Show Infomation',
        style: MyStyle().nomalTextStyle,
      ),
      subtitle: Text(
        ' : Expand or Description Menu Infomation',
        style: MyStyle().subtitleTextStyle,
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
      leading: Icon(Icons.filter_3),
      title: Text(
        'Show QrCode',
        style: MyStyle().nomalTextStyle,
      ),
      subtitle: Text(
        ' : Expand or Description Menu QrCode and BarCode',
        style: MyStyle().subtitleTextStyle,
      ),
    );
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
            color: Colors.lightBlueAccent,
          ),
          menuShowInfo(),
          Divider(
            color: Colors.lightBlueAccent,
          ),
          menuShowQrCode(),
          Divider(
            color: Colors.lightBlueAccent,
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
          style: TextStyle(
            fontFamily: 'IndieFlower',
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
      ),
      body: currentWidget,
    );
  }
}
