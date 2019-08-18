import 'package:app/models/majors.dart';
import 'package:app/views/major_detail.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MajorCard extends StatefulWidget {
  final Major major;

  MajorCard({Key key, @required this.major}) : super(key: key);

  @override
  _MajorCardState createState() => _MajorCardState();
}

class _MajorCardState extends State<MajorCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.major.specializations[0].videoId == null) {
      print(">>> Video not found");
    } else if (widget.major.specializations[0].videoId.length != 11) {
      print(">>> Invalid Video ID: " + widget.major.specializations[0].videoId);
    }
    return GestureDetector(
      onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MajorDetail(major: widget.major)));
          },
      child: Column(
        children: <Widget>[
          widget.major.specializations[0].videoId != null
              ? widget.major.specializations[0].videoId.length == 11
                  ? Hero(
                      tag: widget.major.specializations[0].videoId,
                      child: YoutubePlayer(
                          key: new GlobalKey(),
                          context: context,
                          videoId: widget.major.specializations[0].videoId,
                          flags: YoutubePlayerFlags(
                              autoPlay: false,
                              hideControls: true,
                              showVideoProgressIndicator: true,
                              hideFullScreenButton: true)),
                    )
                  : Text("Video Id Invalid")
              : Text("Video not found"),
          ListTile(
            title: Text(
              widget.major.majorName.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle:
                Text(widget.major.inputRequest[0].combinations.toString()),
            trailing: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(bottom: 3.0),
                      margin: EdgeInsets.only(bottom: 3.0),
                      child: Text(widget.major.seasons[0].points.toString(),
                          maxLines: 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      )),
                  Text(widget.major.seasons[0].year.toString(), maxLines: 1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
