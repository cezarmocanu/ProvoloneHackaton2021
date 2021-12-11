class Learner {
  final int id;
  final String firstName;
  final String lastName;
  final String birthdate;
  final String age;
  final String gender;
  final String comesFrom;
  final String description;

  Learner({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.age,
    required this.gender,
    required this.comesFrom,
    required this.description,
  });

  factory Learner.fromJson(Map<String, dynamic> json) {
    return Learner(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      birthdate: json["birthdate"],
      age: json["age"],
      gender: json["gender"],
      comesFrom: json["comesFrom"],
      description: json["description"],
    );
  }

  Map toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "birthdate": birthdate,
      "age": age,
      "gender": gender,
      "comesFrom": comesFrom,
      "description": description,
    };
  }
}
