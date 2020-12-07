import 'package:flutter/material.dart';
import 'package:flutter_radio_player_example/model/rank.dart';
import 'package:flutter_radio_player_example/repository/repo.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  var ranks = List<StationRank>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(ranks[0].nama),
    );
  }

  @override
  void initState() {
    super.initState();
    _getRanks();
  }

  _getRanks() {
    Repository.ranks().then((response) {
      setState(() {
        ranks = response.station;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
