import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaktimaan/api.dart';
import 'package:shaktimaan/camera.dart';
import 'package:shaktimaan/profile.dart';
import 'package:shaktimaan/profile_data.dart';

import 'moor_db.dart';

class Notifs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    final database = Provider.of<Database>(context);
    List<TableProfile> profiles = List();
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: FutureBuilder(
        future: database.getAllProfiles(),
        builder: (context, dbSnap) {
          if (dbSnap.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          profiles = dbSnap.data;
          return FutureBuilder(
            future: Provider.of<APIService>(context).getAllNotifs(),
            builder: (context, apiSnap) {
              if (apiSnap.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              print(apiSnap.data.bodyString);
              List list = ["Empty"];
              if (apiSnap.data != null) {
                list = json.decode(apiSnap.data.bodyString)["results"];
                print("List: $list");
                list.forEach((ele) {
                  print("Element: $ele");
                  // database.insertProfile(jsonToProfile(ele["checkin"]));
                  profiles.add(jsonToProfile(ele["checkin"]));
                });
              }
              if (args != null) {
                int type = int.parse(args.split("~")[0]);
                print(type);
                if (type == 0)
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Profile(profiles[type])));
                else
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => CameraView(url: args.split("~")[1])));
              }
              return ListView.builder(
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  TableProfile prof = profiles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Profile(prof)));
                    },
                    child: Card(
                        margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${prof.name}",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        )),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
