import 'package:shaktimaan/moor_db.dart';

class ProfileData {
  final int id;
  final String name;
  final Map<String, int> categories;
  final String feedUrl;
  final double lat;
  final double longi;
  final String address;
  final String place;
  final String district;
  final String state;
  final String country;
  final String caption;
  final String time;

  ProfileData(
      this.id,
      this.name,
      this.categories,
      this.feedUrl,
      this.lat,
      this.longi,
      this.address,
      this.place,
      this.district,
      this.state,
      this.country,
      this.caption,
      this.time);
}

TableProfile jsonToProfile(Map<String, dynamic> json) {
  print("Json: $json");
  List cat = json["profile"]["categories"];
  if (cat.length == 0)
    return TableProfile(
        id: json["profile"]["id"],
        name: json["profile"]["name"],
        category1: null,
        category2: null,
        category3: null,
        feedUrl: json["camera"]["feed_url"],
        lat: json["camera"]["address"]["latitude"],
        longi: json["camera"]["address"]["longitude"],
        address: json["camera"]["address"]["additional_lines"],
        place: json["camera"]["address"]["place"]["name"],
        district: json["camera"]["address"]["place"]["district"]["name"],
        state: json["camera"]["address"]["place"]["district"]["state"]["name"],
        country: json["camera"]["address"]["place"]["district"]["state"]
            ["country"]["name"],
        caption: json["camera"]["caption"],
        time: json["created_at"]);
  else if (cat.length == 1)
    return TableProfile(
        id: json["profile"]["id"],
        name: json["profile"]["name"],
        category1: "${cat[0]["name"]}&${cat[0]["threat_level"]}",
        category2: "null",
        category3: "null",
        feedUrl: json["camera"]["feed_url"],
        lat: json["camera"]["address"]["latitude"],
        longi: json["camera"]["address"]["longitude"],
        address: json["camera"]["address"]["additional_lines"],
        place: json["camera"]["address"]["place"]["name"],
        district: json["camera"]["address"]["place"]["district"]["name"],
        state: json["camera"]["address"]["place"]["district"]["state"]["name"],
        country: json["camera"]["address"]["place"]["district"]["state"]
            ["country"]["name"],
        caption: json["camera"]["caption"],
        time: json["created_at"]);
  else if (cat.length == 2)
    return TableProfile(
        id: json["profile"]["id"],
        name: json["profile"]["name"],
        category1: "${cat[0]["name"]}&${cat[0]["threat_level"]}",
        category2: "${cat[1]["name"]}&${cat[1]["threat_level"]}",
        category3: "null",
        feedUrl: json["camera"]["feed_url"],
        lat: json["camera"]["address"]["latitude"],
        longi: json["camera"]["address"]["longitude"],
        address: json["camera"]["address"]["additional_lines"],
        place: json["camera"]["address"]["place"]["name"],
        district: json["camera"]["address"]["place"]["district"]["name"],
        state: json["camera"]["address"]["place"]["district"]["state"]["name"],
        country: json["camera"]["address"]["place"]["district"]["state"]
            ["country"]["name"],
        caption: json["camera"]["caption"],
        time: json["created_at"]);
  else
    return TableProfile(
        id: json["profile"]["id"],
        name: json["profile"]["name"],
        category1: "${cat[0]["name"]}&${cat[0]["threat_level"]}",
        category2: "${cat[1]["name"]}&${cat[1]["threat_level"]}",
        category3: "${cat[3]["name"]}&${cat[2]["threat_level"]}",
        feedUrl: json["camera"]["feed_url"],
        lat: json["camera"]["address"]["latitude"],
        longi: json["camera"]["address"]["longitude"],
        address: json["camera"]["address"]["additional_lines"],
        place: json["camera"]["address"]["place"]["name"],
        district: json["camera"]["address"]["place"]["district"]["name"],
        state: json["camera"]["address"]["place"]["district"]["state"]["name"],
        country: json["camera"]["address"]["place"]["district"]["state"]
            ["country"]["name"],
        caption: json["camera"]["caption"],
        time: json["created_at"]);
}
