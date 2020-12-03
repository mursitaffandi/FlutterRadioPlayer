class Slider {
  List<SliderStation> station;

  Slider({this.station});

  Slider.fromJson(Map<String, dynamic> json) {
    if (json['station'] != null) {
      station = new List<SliderStation>();
      json['station'].forEach((v) {
        station.add(new SliderStation.fromJson(v));
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

class SliderStation {
  String image;
  String title;
  String url;

  SliderStation({this.image, this.title, this.url});

  SliderStation.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
