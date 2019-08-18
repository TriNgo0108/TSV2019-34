import 'package:app/models/majors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MajorDetail extends StatefulWidget {
  final Major major;

  MajorDetail({Key key, this.major}) : super(key: key);

  @override
  _MajorDetailState createState() => _MajorDetailState();
}

class _MajorDetailState extends State<MajorDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.major.majorName),
      ),
      body: Column(
        children: <Widget>[
          widget.major.specializations[0].videoId != null ? Hero(
            tag: widget.major.specializations[0].videoId,
            child: YoutubePlayer(
              key: new GlobalKey(),
              context: context,
              videoId: widget.major.specializations[0].videoId,
              flags: YoutubePlayerFlags(
                autoPlay: true,
                showVideoProgressIndicator: true,
              ),
            ),
          ) : Text("Video not found"),
          Text("Some detail going here")
        ],
      ),
    );
  }
}
