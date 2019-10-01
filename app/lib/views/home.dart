import 'package:app/views/widgets/drawer_menu.dart';
import 'package:app/views/widgets/fab.dart';
import 'package:app/views/widgets/majors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../providers/specialization.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var specList = Provider.of<SpeList>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.robot), 
            onPressed: () {
              Navigator.pushNamed(context, '/chatbot');
            })
        ],
      ),
      drawer: DrawerMenu(),
      floatingActionButton: Fab(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            YoutubePlayer(
                  key: new GlobalKey(),
                  context: context,
                  videoId: "BxMLuCzmjgE",
                  thumbnailUrl: "https://img.youtube.com/vi/BxMLuCzmjgE/0.jpg",
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    showVideoProgressIndicator: true,
                  ),
                ),
            MajorList(
              title: "Có Thể Bạn Thích",
              majors: specList.getTop(),
              isLoading: specList.isLoading,
              heroTag: "0",
            ),
            MajorList(
              title: "Các ngành Tiên tiến, Chất lượng cao",
              majors: specList.getTTCLC(),
              isLoading: specList.isLoading,
              heroTag: "1",
            ),
            MajorList(
              title: "Đào tạo tại khu Hòa An (Hậu Giang)",
              majors: specList.getHoaAn(),
              isLoading: specList.isLoading,
              heroTag: "2",
            ),
          ],
        )
      ),
    );
  }
}
