import 'package:app/models/majors.dart';
import 'package:flutter/material.dart';

class MajorDetail extends StatefulWidget {

  final Major major;

  MajorDetail({Key key, this.major}) : super(key: key);

  @override
  _MajorDetailState createState() => _MajorDetailState();
}

class _MajorDetailState extends State<MajorDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}