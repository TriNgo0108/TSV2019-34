import 'package:app/models/majors.dart';
import 'package:app/providers/specialization.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MajorDetail extends StatefulWidget {
  final Specialization major;

  MajorDetail({Key key, this.major}) : super(key: key);

  @override
  _MajorDetailState createState() => _MajorDetailState();
}

class _MajorDetailState extends State<MajorDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.major.name),
      ),
      body: Column(
        children: <Widget>[
          widget.major.videoId != null ? Hero(
            tag: widget.major.videoId,
            child: YoutubePlayer(
              key: new GlobalKey(),
              context: context,
              videoId: widget.major.videoId,
              thumbnailUrl: "https://img.youtube.com/vi/${widget.major.videoId}/hqdefault.jpg",
              flags: YoutubePlayerFlags(
                autoPlay: false,
                showVideoProgressIndicator: true,
              ),
            ),
          ) : Text("Video not found"),
          Expanded(
            child: ListView(
              children: <Widget>[
                title(widget.major.name),
                Container(
                  padding: EdgeInsets.fromLTRB(16,8,16,16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.major.common.map((p) => Text(p, style: TextStyle(fontSize: 16, height: 1.5))).toList(),
                  ),
                ),
                collapseContent("Mục tiêu đào tạo", widget.major.objective),
                collapseContent("Vị trí việc làm", widget.major.job),
                collapseContent("Khả năng học tập, nâng cao trình độ sau khi ra trường", widget.major.developAbilities),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget title(String text) {
  return Container(
    padding: EdgeInsets.fromLTRB(16,16,16,0),
    child: Text(text.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );
}

Widget heading(String text) {
  return Container(
    child: Text(
      text, 
      style: TextStyle(
          color: Colors.blue,
          fontSize: 16
        )
      ),
  );
}

Widget paragraph(List<String> text) {
  return Container(
    padding: EdgeInsets.fromLTRB(16,0,16,16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: text.map((p) => Container(
        margin: EdgeInsets.only(bottom: 3),
        child: Text("    " + p, 
          style: TextStyle(fontSize: 16, height: 1.5), 
          textAlign: TextAlign.justify
        )
      )).toList()
    ),
  );
}

Widget collapseContent(String title, List<String> content) {
  return ExpansionTile(
    title: heading(title),
    children: <Widget>[
      paragraph(content)
    ],
  );
}