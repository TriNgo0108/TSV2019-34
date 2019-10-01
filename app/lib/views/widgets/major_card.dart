import 'dart:math';
import 'package:app/providers/specialization.dart';
import 'package:app/views/major_detail.dart';
import 'package:flutter/material.dart';

class MajorCard extends StatelessWidget {
  final Specialization major;
  final String heroTag;

  MajorCard({Key key, @required this.major, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bgColor = Color.fromRGBO(Random().nextInt(128), Random().nextInt(128),Random().nextInt(128), 0.8);
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MajorDetail(major: major, heroTag: heroTag)));
      },
      child: Container(
        color: bgColor,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: major.videoId + heroTag + major.name,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset(major.imgPath),
                    )
                  )
                ),
                Positioned(
                  top: 8,
                  left: 0,
                  child: Container(
                    child: Text(major.college, style: TextStyle(color: Colors.white, fontSize: 14),),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10))
                    ),
                    padding: EdgeInsets.fromLTRB(8,3,8,3),
                  ),
                )
              ]
            ),
            ListTile(
              title: Text(
                major.name.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              subtitle:
                  Text(major.inputRequest[0].combinations.join(', '), style: TextStyle(color: Colors.white), ),
              trailing: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 3.0),
                        margin: EdgeInsets.only(bottom: 3.0),
                        child: Text(major.seasons[0].points.toString(),
                            maxLines: 1, style: TextStyle(color: Colors.white),),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.white)),
                        )),
                    Text(major.seasons[0].year.toString(), maxLines: 1, style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
