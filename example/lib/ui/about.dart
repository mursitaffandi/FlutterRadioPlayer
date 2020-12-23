import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_radio_player_example/repository/repo.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();

  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _AboutPageState extends State<AboutPage> {
  var about = "";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Html(
            data: about,
            padding: EdgeInsets.all(8.0),
            onLinkTap: (url) {
              AboutPage.launchURL(url);
              print("Opening $url...");
            },
          ),
        ),
      );
  }

  @override
  void initState() {
    super.initState();
    _getAbout();
  }

  _getAbout() {
    Repository.about().then((response) {
      setState(() {
        about = response.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
