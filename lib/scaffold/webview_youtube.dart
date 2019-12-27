import 'package:duetot/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewYoutube extends StatefulWidget {
  @override
  _WebViewYoutubeState createState() => _WebViewYoutubeState();
}

class _WebViewYoutubeState extends State<WebViewYoutube> {
  // !Field

  // !Method
  Widget showWebView() {
    String url = 'https://youtu.be/';
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
          'Web View Youtube',
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
