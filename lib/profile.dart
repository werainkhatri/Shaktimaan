import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:shaktimaan/moor_db.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Profile extends StatefulWidget {
  Profile(this.data);

  final TableProfile data;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TableProfile data;
  @override
  Widget build(BuildContext context) {
    data = widget.data;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Name: ${data.name}",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Date: ${data.time.split("T")[0]}",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Time: ${data.time.split("T")[1].substring(0,8)}",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Place: ${data.place}",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Text("Video: ", style: TextStyle(fontSize: 35)),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.3,
                child: WebView(
                  initialUrl: data.feedUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Location: "),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      openMapsSheet(context, double.parse(data.lat), double.parse(data.longi));
                    },
                    child: Text("Open in Maps"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  openMapsSheet(context, double lat, double longi) async {
    try {
      final title = "Shanghai Tower";
      final description = "Asia's tallest building";
      final coords = Coords(lat, longi);
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
