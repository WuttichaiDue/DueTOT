import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:duetot/models/product_model.dart';
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
  List<ProductModel> productModels = List(); //? หรือ = [];
  //  ! Method
  @override
  void initState() {
    super.initState();
    myuserModel = widget.userModel;
    readAllProduct();
  }

  Future<void> readAllProduct() async {
    String url = 'https://www.androidthai.in.th/tot/getAllProductDue.php';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
    print(result);
    for (var item in result) {
      ProductModel productModel = ProductModel.fromJson(item);
      setState(() {
        productModels.add(productModel);
      });
    }
  }

  Widget showPicture(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(productModels[index].path),
        )
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(productModels[index].path),
        backgroundColor: Colors.lightGreenAccent[100],
      ),
    );
  }

  Widget showProduct(int index) {
    return Text(
      productModels[index].product,
      style: MyStyle().serviceTitletextStyle,
    );
  }

  Widget showDetail(int index) {
    String string = productModels[index].detail;
    if (string.length >= 40) {
      string = string.substring(0, 39);
      string = '$string ...';
    }
    return Text(string);
  }

  Widget showText(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          showProduct(index),
          showDetail(index),
        ],
      ),
    );
  }

  Widget showListView() {
    return ListView.builder(
      itemCount: productModels.length,
      itemBuilder: (BuildContext buildContext, int index) {
        return Row(
          children: <Widget>[
            showPicture(index),
            showText(index),
            
          ],
        );
      },
    );
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
          showListView(),
          addProductButton(),
        ],
      ),
    );
  }
}
