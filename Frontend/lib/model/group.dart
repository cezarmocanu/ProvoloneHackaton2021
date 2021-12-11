import 'package:vot_senat_client/model/learner.dart';

class Group {
  final int id;
  final String name;
  final String instructor;
  final String discipline;
  final List<Learner> learners;

  Group({
    required this.id,
    required this.name,
    required this.instructor,
    required this.discipline,
    required this.learners,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json["id"],
      name: json["name"],
      instructor: json["instructor"],
      discipline: json["discipline"],
      learners: json["learners"],
    );
  }

  Map toJson() {
    return {
      "id": id,
      "name": name,
      "instructor": instructor,
      "discipline": discipline,
      "learners": learners,
    };
  }
}
