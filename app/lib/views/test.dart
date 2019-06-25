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
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        body: FutureBuilder(
          future: loadMajors(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done)
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(snapshot.data[index].majorName),
                    subtitle: Column(
                      children: <Widget>[
                        Text("Ma nganh: ${snapshot.data[index].majorCode}"),
                        Text("Video: ${snapshot.data[index].videoURL}"),
                        Text("Thoi gian dao tao: ${snapshot.data[index].intendTime}"),
                        Text("Danh hieu: ${snapshot.data[index].title}"),
                        Text("Khoa: ${snapshot.data[index].collegeName}"),
                        Text("Anh minh hoa: ${snapshot.data[index].collegeImage}"),
                        Text("Nhom nganh: ${snapshot.data[index].majorGroup}"),
                        Text("Phuong thuc tuyen sinh: ${snapshot.data[index].inputRequest[0].testMethod}"),
                        ListView.builder(
                          itemCount: snapshot.data[index].inputRequest[0].combinations.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              subtitle: Column(
                                children: <Widget>[
                                  Text("${snapshot.data[index].inputRequest[0]..combinations[index]}")
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
              );
              return CircularProgressIndicator();
          },
          ),
      )
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