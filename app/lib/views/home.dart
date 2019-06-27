import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../models/majors.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget majorCard({String title, String subtitle}) {
    return Card(
      margin: EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    "assets/images/building.jpg",
                    fit: BoxFit.fitWidth,
                  ))),
          ListTile(
            title: Text("Cong nghe thong tin"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: ListView(
          children: <Widget>[majorCard()],
        ),
      ),
    );
  }
}
