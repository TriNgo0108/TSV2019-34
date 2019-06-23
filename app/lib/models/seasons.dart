import 'dart:ffi';

class Seasons {
  final int year;
  final Float points;

  Seasons({this.year, this.points});

  factory Seasons.fromJson(Map<String,dynamic> json){
    return new Seasons(
      year: json["year"],
      points: json["points"]
    );
  }
}