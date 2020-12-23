import 'package:flutter/material.dart';
import 'package:flutter_radio_player_example/model/mobile.dart';
import 'package:flutter_radio_player_example/model/slider.dart';
import 'package:flutter_radio_player_example/repository/repo.dart';
import 'package:flutter_radio_player_example/ui/about.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PlaylistPage extends StatefulWidget {
  final IfacePlaylist ifacePlaylist;

  PlaylistPage({Key key, @required this.ifacePlaylist}) : super(key: key);

  @override
  _PlaylistPageState createState() => _PlaylistPageState(ifacePlaylist);

  void previous() {

  }

  void next() {

  }
}

class _PlaylistPageState extends State<PlaylistPage> {
  IfacePlaylist callback;

  _PlaylistPageState(IfacePlaylist callback){
    this.callback = callback;
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(
        children: <Widget>[
          Container(
              constraints: BoxConstraints.expand(height: 185),
              child: imageSlider(context)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Station...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: stations.length,
              separatorBuilder: (ctx, ix) {
                return Divider(
                  height: 2,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                    leading: Image.network(
                      stations[index].imageURL,
                      fit: BoxFit.cover,
                      width: 100.0,
                    ),
                    title: Text(stations[index].name),
                    onTap: () {
                      callback.selectStation(stations[index]);
                    });
              },
            ),
          ),
        ],
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  var tempStation = new List<Station>();
  var stations = new List<Station>();
  TextEditingController _textController = TextEditingController();

  _getStations() {
    Repository.stations().then((response) {
      setState(() {
        tempStation = response.station;
        stations = tempStation;
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getStations();
    _getSlider();
  }

  onItemChanged(String value) {
    setState(() {
      stations = tempStation
          .where((string) =>
          string.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  Swiper imageSlider(context) {
    return new Swiper(
      autoplay: true,
      // ignore: missing_return
      itemBuilder: (BuildContext context, int index) {
        for (int i = index; i < sliders.length; i++) {
          return GestureDetector(
            onTap: (){
              AboutPage.launchURL(sliders[i].url);
            },
            child: Image.network(
              sliders[i].image,
              fit: BoxFit.fitHeight,
            ),
          );
        }
      },
      itemCount: sliders.length,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }

  var sliders = new List<SliderStation>();

  void _getSlider() {
    Repository.slider().then((response) {
      setState(() {
        sliders = response.station;
      });
    });
  }
}

abstract class IfacePlaylist{
  void selectStation(Station station);
}