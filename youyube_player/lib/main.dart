import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String videourl =
      "https://www.youtube.com/watch?v=ozqb4b_lIMg&ab_channel=TechnicalGuruji";
  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      flags: YoutubePlayerFlags(
          autoPlay: true, mute: false, startAt: 20, endAt: 40, isLive: true),
      initialVideoId: YoutubePlayer.convertUrlToId(
        videourl,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube Player'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [YoutubePlayer(
              
              controller: _controller)],
          ),
        ),
      ),
    );
  }
}
