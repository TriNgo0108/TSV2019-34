import 'package:app/models/majors.dart';
import 'package:flutter/material.dart';

class MajorCard extends StatelessWidget {
  final Major major;

  MajorCard({Key key, @required this.major}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
      decoration: BoxDecoration(
          border: Border.all(width: 0.6, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    "assets/images/building.jpg",
                    fit: BoxFit.fitWidth,
                  ))),
          ListTile(
            title: Text("Cong nghe thong tin và truyền thông".toUpperCase(), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle: Text("A00, A01"),
            trailing: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(bottom: 3.0),
                      margin: EdgeInsets.only(bottom: 3.0),
                      child: Text("27.2", maxLines: 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      )),
                  Text("100", maxLines: 1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
