import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaktimaan/api.dart';
import 'package:shaktimaan/moor_db.dart';
import 'package:shaktimaan/shakti_webview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notifs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static int i = 0;
  static SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((o) => print("Token: $o"));
    return MultiProvider(
      providers: [
        Provider<APIService>(
          create: (_) => APIService.create(),
          dispose: (context, APIService service) => service.client.dispose(),
        ),
        Provider<Database>(
          create: (_) => Database(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        routes: {
          '/notifs': (_) => Notifs(),
        },
        home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, prefSnap) {
            if (prefSnap.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            prefs = prefSnap.data;
            if (prefs.getStringList("notifs") == null)
              prefs.setStringList("notifs", List<String>());
            print("No of Notifs: ${prefs.getStringList("notifs").length}");
            return Home(_firebaseMessaging);
          },
        ),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  final FirebaseMessaging _firebaseMessaging;
  Home(this._firebaseMessaging);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    widget._firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: ${message["data"]["type"]}");
        print("onMessage: $message");
        if (message["type"] == 0) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Notifs(),
              settings:
                  RouteSettings(arguments: "${message["data"]["type"]}")));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Notifs(),
              settings: RouteSettings(
                  arguments:
                      "${message["data"]["type"]}~${message["feed_url"]}")));
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: ${message["data"]["type"]}");
        print("onResume: $message");
        if (message["type"] == 0)
          Navigator.of(context)
              .pushNamed("/notifs", arguments: "${message["data"]["type"]}");
        else
          Navigator.of(context).pushNamed("/notifs",
              arguments: "${message["data"]["type"]}~${message["feed_url"]}");
      },
    );
    return ShaktiWebView();
  }
}