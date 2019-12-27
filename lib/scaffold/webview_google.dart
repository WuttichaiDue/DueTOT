import 'package:duetot/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewGoogle extends StatefulWidget {
  @override
  _WebViewGoogleState createState() => _WebViewGoogleState();
}

class _WebViewGoogleState extends State<WebViewGoogle> {
  Widget showWebView() {
    String url = 'https://www.google.co.th/?hl=th';
    return WebviewScaffold(
      url: url,
      withJavascript: true,
      withZoom: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().mainColor,
        title: Text(
          'Web Google',
          style: MyStyle().appbarStyle,
        ),
      ),
      body: Container(
        decoration: MyStyle().containerDecoration,
        child: showWebView(),
      ),
    );
  }
}
