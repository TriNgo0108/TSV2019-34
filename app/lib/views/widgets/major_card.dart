import 'dart:io';

import 'package:app/providers/specialization.dart';
import 'package:app/views/major_detail.dart';
import 'package:flutter/material.dart';

class MajorCard extends StatelessWidget {
  final Specialization major;

  MajorCard({Key key, @required this.major}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (major.videoId == null) {
      print(">>> Video not found");
    } else if (major.videoId.length != 11) {
      print(">>> Invalid Video ID: " + major.videoId);
    }
    return GestureDetector(
      onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MajorDetail(major: major)));
          },
      child: Column(
        children: <Widget>[
          major.videoId != null
              ? major.videoId.length == 11
                  ? Hero(
                      tag: major.videoId,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Image.file(File(major.imgPath)),
                        )
                      )
                    )
                  : Text("Video Id Invalid")
              : Text("Video not found"),
          ListTile(
            leading: Text("${major.score}"),
            title: Text(
              major.name.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle:
                Text(major.inputRequest[0].combinations.toString()),
            trailing: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(bottom: 3.0),
                      margin: EdgeInsets.only(bottom: 3.0),
                      child: Text(major.seasons[0].points.toString(),
                          maxLines: 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      )),
                  Text(major.seasons[0].year.toString(), maxLines: 1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
