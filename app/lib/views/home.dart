import 'package:app/views/colleges_list.dart';
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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    var specList = Provider.of<SpeList>(context);
    return Stack(
      children: [
        Scaffold(
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
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
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
              CollegesList()
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FloatingActionButton(onPressed: (){}, elevation: 0.0),
          bottomNavigationBar: BottomAppBar(
            clipBehavior: Clip.hardEdge,
            notchMargin: 6,
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 52,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {_controller.animateTo(0);},
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.home),
                            Text("Trang chủ")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {_controller.animateTo(1);},
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.business),
                            Text("Khoa, Viện")
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 90)
                ],
              ),
            )
          ),
        ),
        Fab()
      ]
    );
  }
}
