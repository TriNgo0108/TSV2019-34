import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import './../models/majors.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadMajors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Major> majors = snapshot.data;
            return ListView.builder(
              itemCount: majors.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Text(majors[index].majorName),
                      Text("Ma nganh: ${majors[index].majorCode}"),
                      Text("Thoi gian dao tao: ${majors[index].intendTime}"),
                      Text("Danh hieu: ${majors[index].title}"),
                      Text("Khoa: ${majors[index].collegeName}"),
                      Text("Anh minh hoa: ${majors[index].collegeImage}"),
                      Text("Nhom nganh: ${majors[index].majorGroup}"),
                      Text("Phuong thuc tuyen sinh: ${majors[index].inputRequest[0].testMethod}"),
                    ],
                  ),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<String> _loadMajorAsset() async {
    return await rootBundle.loadString('assets/jsons/majors.json');
  }

  Future loadMajors() async {
    Major major = Major();
    String jsonString = await _loadMajorAsset();
    final jsonResponse = json.decode(jsonString);
    return majorsList(jsonResponse);
  }
}
