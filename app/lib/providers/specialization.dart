import 'package:app/models/inputRequest.dart';
import 'package:app/models/majors.dart';
import 'package:app/models/seasons.dart';
import 'package:flutter/material.dart';

class Specialization {
  int score;
  String college;
  String majorGroup;
  String videoId;
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

  Future<List<Specialization>> loadData() async {
    await getMajorsList().then((majors) {
      majors.forEach((major) {
        major.specializations.forEach((spec) {
          this._list.add(Specialization(
            name: spec.specializationName,
            college: major.collegeName,
            majorGroup: major.majorGroup,
            videoId: spec.videoId,
            mainSubjects: major.mainSubjects,
            common: <String>[
              "Mã Ngành: ${major.majorCode}",
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
        });
      });
    });
    return this._list;
  }

}