import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import './inputRequest.dart';
import './seasons.dart';
import './specializations.dart';

Future<List<Major>> getMajorsList() async {
    String jsonString = await rootBundle.loadString('assets/jsons/majors.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    List<Major> majors = new List<Major>();
    majors = jsonResponse.map((i) => Major.fromJson(i)).toList();
    return majors;
}

class Major {
  final String majorCode;
  final String majorName;
  final String intendTime;
  final String title;
  final String collegeName;
  final String collegeImage;
  final List<InputRequest> inputRequest;
  final List<String> mainSubjects;
  final String majorGroup;
  final List<Seasons> seasons;
  final List<Specializations> specializations;

  Major({this.majorCode, this.majorName, this.intendTime, this.title, this.collegeName, this.collegeImage, this.inputRequest, this.mainSubjects, this.majorGroup, this.seasons, this.specializations});

  factory Major.fromJson(Map<String,dynamic> json){
    var list = json["inputRequest"] as List;                                     // tao list specialized
    List<InputRequest> inputRequestList = new List<InputRequest>();
    inputRequestList = list.map((i) => InputRequest.fromJson(i)).toList();

    list = json["mainSubjects"];
    List<String> mainSubjectsList = list.cast<String>();

    list = json["seasons"] as List;                                     
    List<Seasons> seasonsList = new List<Seasons>();
    seasonsList = list.map((i) => Seasons.fromJson(i)).toList();   

    list = json["specializations"] as List;                                     
    List<Specializations> specializationsList = new List<Specializations>();
    specializationsList = list.map((i) => Specializations.fromJson(i)).toList(); 

    return new Major(
      majorCode: json["majorCode"],
      majorName: json["majorName"],
      intendTime: json["intendTime"],
      title: json["title"],
      collegeName: json["collegeName"],
      collegeImage: json["collegeImage"],
      inputRequest: inputRequestList,
      mainSubjects: mainSubjectsList,
      majorGroup: json["majorGroup"],
      seasons: seasonsList,
      specializations: specializationsList
    );
  }
}