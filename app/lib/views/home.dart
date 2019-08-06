import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/majors.dart';
import './widgets/MajorCard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 320,
              child: Card(
                margin: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                        child: Text("Có vẻ phù hợp với bạn...",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Theme.of(context).primaryColor, fontStyle: FontStyle.italic),)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MajorCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 320,
              child: Card(
                margin: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                        child: Text("Có thể bạn sẽ thích...",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Theme.of(context).primaryColor, fontStyle: FontStyle.italic),)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MajorCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
