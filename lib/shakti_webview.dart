import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: ShaktiWebView()));

class ShaktiWebView extends StatefulWidget {
  @override
  _ShaktiWebViewState createState() => _ShaktiWebViewState();
}

class _ShaktiWebViewState extends State<ShaktiWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brain'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          NavigationControls(_controller.future),
          SampleMenu(_controller.future),
          IconButton(
            icon: Icon(Icons.notification_important),
            onPressed: () {
              Navigator.of(context).pushNamed('/notifs');
            },
          )
        ],
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'http://192.168.168.22:3000/login/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context),
          ].toSet(),
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
        );
      }),
      // floatingActionButton: favoriteButton(),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}

enum MenuOptions {
  getSessionData,
  setSessionData
}

class SampleMenu extends StatelessWidget {
  SampleMenu(this.controller);

  final Future<WebViewController> controller;
  final CookieManager cookieManager = CookieManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, prefSnap) {
        return FutureBuilder<WebViewController>(
          future: controller,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            return PopupMenuButton<MenuOptions>(
              onSelected: (MenuOptions value) {
                switch (value) {
                  case MenuOptions.getSessionData:
                    _getSessionStorage(controller.data, context).then((o) {
                      print(o);
                      prefSnap.data.setString("access_token", o);
                      print(prefSnap.data.getString("access_token"));
                    });
                    _getRefreshStorage(controller.data, context).then((o) {
                      print(o);
                      prefSnap.data.setString("refresh_token", o);
                    });
                    break;
                  case MenuOptions.setSessionData:
                    {
                      String token1 = prefSnap.data.getString("access_token");
                      String token2 = prefSnap.data.getString("refresh_token");
                      print(token1);
                      if (token1 != null)
                        _setSessionStorage(controller.data, context, token1, token2);
                      controller.data
                          .loadUrl("http://35.200.154.82:3000/dashboard/");
                    }
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuItem<MenuOptions>>[
                const PopupMenuItem<MenuOptions>(
                  value: MenuOptions.getSessionData,
                  child: Text('Get Data'),
                ),
                const PopupMenuItem<MenuOptions>(
                  value: MenuOptions.setSessionData,
                  child: Text('Set Data'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<String> _getSessionStorage(
      WebViewController controller, BuildContext context) async {
    return await controller
        .evaluateJavascript("sessionStorage.getItem('access_token')");
  }

  Future<String> _getRefreshStorage(
      WebViewController controller, BuildContext context) async {
    return await controller
        .evaluateJavascript("sessionStorage.getItem('refresh_token')");
  }

  void _setSessionStorage(
      WebViewController controller, BuildContext context, String token1, String token2) async {
    await controller
        .evaluateJavascript("sessionStorage.setItem('access_token', '$token1')");
    await controller
        .evaluateJavascript("sessionStorage.setItem('refresh_token', '$token2')");
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      } else {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("No back history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      } else {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("No forward history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}
