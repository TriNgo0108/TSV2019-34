import 'package:app/models/college.dart';
import 'package:app/views/major_detail.dart';
import 'package:app/views/web_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/specialization.dart';

class CollegeDetail extends StatelessWidget {
  final College college;

  CollegeDetail({Key key, this.college}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var speList = Provider.of<SpeList>(context);
    var majors = speList.getMajorsInCollege(college.fullName, '', '');
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    titlePadding: EdgeInsets.fromLTRB(52, 3, 0, 16),
                    title: Text(college.fullName.length > 17 ? college.shortName : college.fullName),
                    background: Hero(
                      tag: "background-${college.imagePath}",
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                        child: Image.asset(
                          college.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        onPressed: ()=> {
                          Navigator.of(context).pushNamed('/web', arguments: WebViewArgs(college.website))
                        }
                    )
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.vertical(bottom: Radius.circular(30))
                  ),
                ),
              ];
            },
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: majors.length,
                    itemExtent: 120,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MajorDetail(major: majors[index], heroTag: "heroTag$index")));
                      },
                      child: Card(
                        elevation: 2,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AspectRatio(
                                aspectRatio: 1/1,
                                child: Hero(
                                  tag: majors[index].videoId + "heroTag$index" + majors[index].name,
                                  child: Image.asset(majors[index].imgPath, fit: BoxFit.fitHeight)
                                ),
                              ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(majors[index].name.toUpperCase(), style: TextStyle(height: 1.2, fontSize: 16, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2, softWrap: true,),
                                    Text("Mã ngành: ${majors[index].code}", style: TextStyle(height: 1.2)),
                                    Text(majors[index].inputRequest[0].combinations.join(', '), style: TextStyle(height: 1.2)),
                                    Text("Điểm chuẩn ${majors[index].seasons[0].year}: ${majors[index].seasons[0].points}", style: TextStyle(height: 1.2))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
      )
    );
  }
}
