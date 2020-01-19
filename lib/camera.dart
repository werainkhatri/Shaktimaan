import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CameraView extends StatelessWidget {
  final String url;

  const CameraView({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        )
      ],),
    );
  }
}
