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
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: cities.length,
      separatorBuilder: (ctx, ix) {
        return Divider(
          height: 2,
        );
      },
      itemBuilder: (context, index) {
        return ListTile(
            leading: Container(
              width: 100,
            ),
            title: Text(cities[index].categoryName),
            );
      },
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
