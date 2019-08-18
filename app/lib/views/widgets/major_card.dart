import 'package:app/models/majors.dart';
import 'package:flutter/material.dart';

class MajorCard extends StatelessWidget {
  final Major major;

  MajorCard({Key key, @required this.major}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                "assets/images/building.jpg",
                fit: BoxFit.fitWidth,
              )),
          ListTile(
            title: Text(
              major.majorName.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(major.inputRequest[0].combinations.toString()),
            trailing: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(bottom: 3.0),
                      margin: EdgeInsets.only(bottom: 3.0),
                      child: Text(major.seasons[0].points.toString(), maxLines: 1),
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
