class Rank {
  List<StationRank> station;

  Rank({this.station});

  Rank.fromJson(Map<String, dynamic> json) {
    if (json['station'] != null) {
      station = new List<StationRank>();
      json['station'].forEach((v) {
        station.add(new StationRank.fromJson(v));
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

class StationRank {
  String ranking;
  String idRadio;
  String jumlah;
  String nama;

  StationRank({this.ranking, this.idRadio, this.jumlah, this.nama});

  StationRank.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    idRadio = json['id_radio'];
    jumlah = json['jumlah'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ranking'] = this.ranking;
    data['id_radio'] = this.idRadio;
    data['jumlah'] = this.jumlah;
    data['nama'] = this.nama;
    return data;
  }
}
