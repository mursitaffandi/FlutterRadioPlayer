import 'dart:convert';

import 'package:flutter_radio_player_example/model/about.dart';
import 'package:flutter_radio_player_example/model/city.dart';
import 'package:flutter_radio_player_example/model/mobile.dart';
import 'package:flutter_radio_player_example/model/rank.dart';
import 'package:flutter_radio_player_example/model/slider.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class Api {
  final _baseUrl = 'http://jogjastreamers.com/m/';
  final http.Client httpClient;

  Api({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<About> getAbout() async {
    var url = _baseUrl + 'about.php';
    var response = await this.httpClient.get(url);

    if (response.statusCode != 200) throw new Exception('error getting about');
    var start = "{";
    var end = "}";

    var startIndex = response.body.indexOf(start);
    var endIndex = response.body.indexOf(end, startIndex);

    final jsonData = jsonDecode(response.body.substring(startIndex , endIndex+1));
    print(jsonData);
    return About.fromJsonMap(jsonData);
  }

  Future<Mobile> getStations() async {
    var url = _baseUrl + 'mobile_list.php';
    var response = await this.httpClient.get(url);

    if (response.statusCode != 200)
      throw new Exception('error getting stations');

    final jsonData = jsonDecode(response.body);
    return Mobile.fromJson(jsonData);
  }

  Future<Slider> getSlider() async {
    var url = _baseUrl + 'slider.php';
    var response = await this.httpClient.get(url);

    if (response.statusCode != 200)
      throw new Exception('error getting stations');

    final jsonData = jsonDecode(response.body);
    return Slider.fromJson(jsonData);
  }

  Future<Rank> getRanks() async {
    var url = _baseUrl + 'mobile_ranking.php';
    var response = await this.httpClient.get(url);

    if (response.statusCode != 200)
      throw new Exception('error getting mobile_ranking');

    final jsonData = jsonDecode(response.body);
    return Rank.fromJson(jsonData);
  }

  Future<City> getCity() async {
    var url = _baseUrl + 'mobile_city.php';
    var response = await this.httpClient.get(url);

    if (response.statusCode != 200)
      throw new Exception('error getting mobile_city');

    final jsonData = jsonDecode(response.body);
    return City.fromJson(jsonData);
  }
}
