import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_radio_player_example/ui/mobile_city.dart';
import 'package:flutter_radio_player_example/ui/mobile_rank.dart';
import 'package:flutter_radio_player_example/ui/playlist.dart';
import 'package:flutter_radio_player_example/ui/widgets.dart';

import 'about.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (iRn this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();
  AnimationController _animationController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _initPlayer();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initPlayer() async {
    await _flutterRadioPlayer.init("JogjaScreamer", "subTitle", "streamURL", "true");
  }

  void _newRadio(String stationsName, String stationsUri, String urlImage) async {
    _pauseRadio();
    await _flutterRadioPlayer.play();
  }

  void _pauseRadio() async {
    await _flutterRadioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: myAppBar(),
      body: Stack(
        children: <Widget>[
          NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.direction == ScrollDirection.forward) {
                  _animationController.forward();
                }
                if (notification.direction == ScrollDirection.reverse) {
                  _animationController.reverse();
                }
                return true;
              },
              child: IndexedStack(
                index: _currentPage,
                children: <Widget>[
                  PlaylistPage(),
                  CityPage(),
                  RankPage(),
                  AboutPage()
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return SizeTransition(
                    axisAlignment: -1,
                    sizeFactor: _animationController,
                    child: child);
              },
              child: Text("knknm"),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              leading: Icon(Icons.featured_play_list_outlined),
              title: Text('Playlist'),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('mobile_city'),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.leaderboard),
              title: Text('mobile_ranking'),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
                Navigator.pop(context);

              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }


}
