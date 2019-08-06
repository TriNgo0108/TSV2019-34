import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
        future: getMajorsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Major> majors = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: majors.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Text("$index"),
                      Text(majors[index].majorName),
                      // Text(majors[index].majorCode),
                      // Text(majors[index].intendTime),
                      // Text(majors[index].title),
                      // Text(majors[index].collegeName),
                      // Text(majors[index].collegeImage),
                      // Text(majors[index].inputRequest[0].testMethod),
                      // Text(majors[index].inputRequest[0].combinations[0]),
                      // Text("${majors[index].inputRequest[0].quantity}"),
                      // Text(majors[index].mainSubjects[0]),
                      // Text(majors[index].majorGroup),
                      // Text("${majors[index].seasons[0].year}"),
                      // Text("${majors[index].seasons[0].points}"),
                      Text("${majors[index].specializations[0].specializationName}"),
                      Text("${majors[index].specializations[0].videoURL}"),
                      // Text("${majors[index].specializations[0].objectives[0]}"),
                      // Text("${majors[index].specializations[0].jobs[0]}"),
                      // Text("${majors[index].specializations[0].developAbilities[0]}"),
                      Text("${majors[index].specializations[0].standardOutput}"),
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
}
