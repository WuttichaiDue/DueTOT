import 'package:duetot/models/user_model.dart';
import 'package:duetot/scaffold/add_new_product.dart';
import 'package:duetot/utility/my_style.dart';
import 'package:flutter/material.dart';

class ShowListProduct extends StatefulWidget {
  final UserModel userModel;

  ShowListProduct({Key key, this.userModel}) : super(key: key);
  @override
  _ShowListProductState createState() => _ShowListProductState();
}

class _ShowListProductState extends State<ShowListProduct> {
  // ! Field
  UserModel myuserModel;
  // ! Method
  @override
  void initState() {
    super.initState();
    myuserModel = widget.userModel;
  }

  Widget addProductButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16.0),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    side: BorderSide(
                        color: Colors.lightGreenAccent[700], width: 2.0)),
                backgroundColor: Colors.lightGreenAccent[100],
                child: Icon(
                  Icons.add,
                  size: 36,
                ),
                onPressed: () {
                  MaterialPageRoute materialPageRoute =
                      MaterialPageRoute(builder: (BuildContext buildContext) {
                    return AddNewProduct(
                      userModel: myuserModel,
                    );
                  });
                  Navigator.of(context).push(materialPageRoute);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MyStyle().containerDecoration,
      child: Stack(
        children: <Widget>[
          addProductButton(),
        ],
      ),
    );
  }
}
