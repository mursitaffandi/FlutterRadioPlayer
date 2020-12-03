class Mobile {
  List<Station> station;

  Mobile({this.station});

  Mobile.fromJson(Map<String, dynamic> json) {
    if (json['station'] != null) {
      station = new List<Station>();
      json['station'].forEach((v) {
        station.add(new Station.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.station != null) {
      data['station'] = this.station.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Station {
  String id;
  String name;
  String streamURL;
  String imageURL;
  String desc;
  String longDesc;

  Station(
      {this.id,
        this.name,
        this.streamURL,
        this.imageURL,
        this.desc,
        this.longDesc});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    streamURL = json['streamURL'];
    imageURL = json['imageURL'];
    desc = json['desc'];
    longDesc = json['longDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['streamURL'] = this.streamURL;
    data['imageURL'] = this.imageURL;
    data['desc'] = this.desc;
    data['longDesc'] = this.longDesc;
    return data;
  }
}
