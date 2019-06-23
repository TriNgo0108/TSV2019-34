class Specializations {
  final String specializationName;
  final List<String> objectives;
  final List<String> jobs;
  final List<String> developAbilities;
  final String standardOutput;

  Specializations({this.specializationName, this.objectives, this.jobs, this.developAbilities, this.standardOutput});

  factory Specializations.fromJson(Map<String,dynamic> json){
    var list = json["objectives"];
    List<String> objectivesList = list.cast<String>();

    list = json["jobs"];
    List<String> jobsList = list.cast<String>();

    list = json["developAbilities"];
    List<String> developAbilitiesList = list.cast<String>();

    return new Specializations(
      specializationName: json["specializationName"],
      objectives: objectivesList,
      jobs: jobsList,
      developAbilities: developAbilitiesList,
      standardOutput: json["standardOutput"]
    )
  }
}