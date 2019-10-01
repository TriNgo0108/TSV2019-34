import 'package:app/views/widgets/majors_list.dart';
import 'package:provider/provider.dart';
import '../providers/specialization.dart';
import './web_view.dart';
import 'package:app/providers/specialization.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MajorDetail extends StatefulWidget {
  final Specialization major;
  final String heroTag;

  MajorDetail({Key key, this.major, this.heroTag}) : super(key: key);

  @override
  _MajorDetailState createState() => _MajorDetailState();
}

class _MajorDetailState extends State<MajorDetail> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    var speList = Provider.of<SpeList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.major.name),
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: widget.major.videoId + widget.heroTag  + widget.major.name,
            child: Stack(
              children: <Widget>[  
                YoutubePlayer(
                  key: new GlobalKey(),
                  context: context,
                  videoId: widget.major.videoId,
                  thumbnailUrl: "https://img.youtube.com/vi/${widget.major.videoId}/hqdefault.jpg",
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    showVideoProgressIndicator: true,
                  ),
                  onPlayerInitialized: (controller) {
                    controller.addListener(() {
                      if (controller.value.isLoaded && isLoading)
                        setState(() {
                          isLoading = false;
                        });
                    });
                  },
                ),
                isLoading ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset(widget.major.imgPath)
                  )
                ) : Container()
              ]
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
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
                ListTile(
                  title: heading("Chuẩn đầu ra"),
                  trailing: Icon(Icons.open_in_new),
                  onTap: () {
                    Navigator.of(context).pushNamed("/web", arguments: WebViewArgs(widget.major.standardOutput));
                  },
                ),
                MajorList(
                  title: "Các ngành liên quan",
                  majors: speList.getMajorsInCollege(widget.major.college, widget.major.name, widget.major.code),
                  heroTag: widget.heroTag + widget.major.videoId,
                )
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
          fontWeight: FontWeight.bold,
          fontSize: 18
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