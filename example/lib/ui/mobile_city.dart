import 'package:flutter/material.dart';
import 'package:flutter_radio_player_example/model/city.dart';
import 'package:flutter_radio_player_example/repository/repo.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  var cities = List<StationCity>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(cities[0].categoryName),
    );
  }

  @override
  void initState() {
    super.initState();
    _getAbout();
  }

  _getAbout() {
    Repository.cities().then((response) {
      setState(() {
        cities = response.station;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
