class City {
  List<StationCity> station;

  City({this.station});

  City.fromJson(Map<String, dynamic> json) {
    if (json['station'] != null) {
      station = new List<StationCity>();
      json['station'].forEach((v) {
        station.add(new StationCity.fromJson(v));
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

class StationCity {
  String cid;
  String categoryName;
  String categoryImage;

  StationCity({this.cid, this.categoryName, this.categoryImage});

  StationCity.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}
