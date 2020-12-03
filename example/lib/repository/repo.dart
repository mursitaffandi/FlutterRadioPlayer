import 'dart:async';
import 'package:flutter_radio_player_example/model/about.dart';
import 'package:flutter_radio_player_example/model/city.dart';
import 'package:flutter_radio_player_example/model/mobile.dart';
import 'package:flutter_radio_player_example/model/rank.dart';
import 'package:flutter_radio_player_example/model/slider.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

class Repository {
  static final Api apiClient = Api(httpClient: http.Client());


  static Future<About> about() async {
    return await apiClient.getAbout();
  }

  static Future<Mobile> stations() async {
    return await apiClient.getStations();
  }

  static Future<Slider> slider() async {
    return await apiClient.getSlider();
  }

  static Future<Rank> ranks() async {
    return await apiClient.getRanks();
  }

  static Future<City> cities() async {
    return await apiClient.getCity();
  }

}