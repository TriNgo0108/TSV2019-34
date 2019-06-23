import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import './../models/majors.dart';

class TestPage extends StatefulWidget {
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
                  return ListTitle(
                    title: Text(snapshot.data[index].name),
                    subtitle: Column(
                      children: <Widget>[
                        Text("college: ${snapshot.data[index].majorCode}"),
                        Text("${snapshot.data[index].videoURL}"),
                        Text("${snapshot.data[index].intendTime}"),
                        Text("${snapshot.data[index].title}"),
                        Text("${snapshot.data[index].collegeName}"),
                        Text("${snapshot.data[index].collegeImage}"),
                        Text("${snapshot.data[index].majorGroup}"),
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
    return await rootBundle.loadString('assets/majors.json');
  }

  Future loadMajors() async {
    Major major = Major();
    String jsonString = await _loadMajorAsset();
    final jsonResponse = json.decode(jsonString);
    return majorsList(jsonResponse);
  }

}