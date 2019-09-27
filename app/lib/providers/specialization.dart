import 'dart:io';
import 'package:app/models/specializations.dart';
import 'package:http/http.dart' show get;
import 'package:app/models/inputRequest.dart';
import 'package:app/models/majors.dart';
import 'package:app/models/seasons.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Specialization {
  int score;
  String college;
  String majorGroup;
  String videoId;
  String imgPath;
  String name;
  List<String> mainSubjects;
  List<String> common;
  List<String> objective;
  List<String> job;
  List<InputRequest> inputRequest;
  List<Seasons> seasons;
  List<String> developAbilities;
  String standardOutput;

  Specialization({
    this.score = 0,
    this.college,
    this.majorGroup,
    this.videoId,
    this.imgPath,
    this.mainSubjects,
    this.common,
    this.objective,
    this.job,
    this.inputRequest,
    this.seasons,
    this.developAbilities,
    this.standardOutput,
    this.name
  });

  increaseScore(int n) {
    this.score += n;
  }
}

class SpeList with ChangeNotifier {
  List<Specialization> _list;

  SpeList() {
    this._list = [];
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<List<Specialization>> loadData() async {
    if (_list.length > 0) return _list;

    String localPath = await _localPath;
    Directory dir = new Directory(localPath + '/majorImg');
    print(">>> Data path: " + localPath);
    
    if (!dir.existsSync()) await dir.create();

    List<Major> majors = await getMajorsList();

    for (var i = 0; i < majors.length; i++) {
      Major major = majors[i];
      for (var i = 0; i < major.specializations.length; i++) {
        Specializations spec = major.specializations[i];
        File img = new File(dir.path + "/${spec.videoId}.jpg");

        if (!img.existsSync()) {
          var response = await get("https://img.youtube.com/vi/${spec.videoId}/hqdefault.jpg");
          img.writeAsBytesSync(response.bodyBytes);
        }

        _list.add(Specialization(
          name: spec.specializationName,
          college: major.collegeName,
          majorGroup: major.majorGroup,
          videoId: spec.videoId,
          imgPath: dir.path + "/${spec.videoId}.jpg",
          mainSubjects: major.mainSubjects,
          common: <String>[
            "Mã Ngành: ${major.majorCode}",
            "Tổ hợp xét tuyển: ${major.inputRequest[0].combinations.join(', ')}",
            "Điển chuẩn năm ${major.seasons[0].year}: ${major.seasons[0].points}",
            "Thời gian đào tạo: ${major.intendTime} năm",
            "Danh hiệu: ${major.title}",
            "Đơn vị: ${major.collegeName}",
          ],
          objective: spec.objectives,
          job: spec.jobs,
          inputRequest: major.inputRequest,
          seasons: major.seasons,
          developAbilities: spec.developAbilities,
          standardOutput: spec.standardOutput
        ));
      }
    }

    return _list;
  }

}