import 'package:app/models/college.dart';
import 'package:app/models/majors.dart';
import 'package:app/views/widgets/major_card.dart';
import 'package:app/views/widgets/web_view_Container.dart';
import 'package:flutter/material.dart';

class CollegeDetailPage extends StatelessWidget {
  final College college;

  CollegeDetailPage({Key key, this.college}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(

                  expandedHeight: 200.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                      titlePadding: EdgeInsets.fromLTRB(70, 5, 0, 5),
                      title: Row(
                        children: <Widget>[
                          // logo của khoa
                          CircleAvatar(
                            backgroundImage: AssetImage(college.logoPath),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Hero(
                            tag: "name-${college.name}",
                            // nếu tên của khoa lớn hơn 15 kí tự thì sẽ dùng tên viết tắt của khoa
                            child: Text(
                                college.name.length > 15
                                    ? college.shortName
                                    : college.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    height: 2)),
                          ),
                        ],
                      ),
                      background: Hero(
                        tag: "background-${college.imagePath}",
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                          child: Image.asset(
                            college.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        onPressed: ()=> {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>WebViewContainer(url: college.web,title: college.name,)
                          ))
                        }
                    )
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.vertical(bottom: Radius.circular(30))
                  ),
                ),
              ];
            },
            body: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topRight,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20,right: 10),
                  child: Text('${college.name.length>15 ? college.shortName : college.name} có ${college.numberOfMajor} ngành đào tạo bậc đại học',style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Divider(),
                FutureBuilder(
                  future: getMajorsList(),
                  builder: (context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return CircularProgressIndicator();
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          List<Major> majors = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                            child: ListView.builder(
                                itemCount: majors.length,
                                itemBuilder: (context, index) => Text("major")
                                //MajorCard(major: majors[index])
                            ),
                          );
                        }
                        break;
                      default:
                        return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            )));
  }
}
