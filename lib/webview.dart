import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://35.200.154.82:3000/",
      appBar: new AppBar(
        title: new Text("Google"),
      ),
      withZoom: true,
      initialChild: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text('Please Wait.....'),
          ],
        ),
      ),
    );
  }
}
