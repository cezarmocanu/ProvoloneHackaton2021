import 'package:http/http.dart';
import 'package:vot_senat_client/model/group.dart';
import 'package:vot_senat_client/model/learner.dart';

List<Group> groups = [
  Group(
    id: 1,
    name: 'Group 1',
    instructor: 'Instructor 1',
    discipline: 'discipline 1',
    learners: [
      Learner(
        id: 1,
        firstName: 'Giulia',
        lastName: 'Radu',
        birthdate: '11.05.2000',
        age: '21',
        gender: 'feminine',
        comesFrom: 'Brasov',
        description: 'Comes from a defavorized environment',
      ),
      Learner(
        id: 2,
        firstName: 'Cezar',
        lastName: 'Mocanu',
        birthdate: '11.10.1999',
        age: '22',
        gender: 'masculine',
        comesFrom: 'Brasov',
        description: 'Comes from a pretty defavorized environment',
      ),
    ],
  )
];

class GroupsRepo {
  const GroupsRepo._internal();

  static const GroupsRepo instance = GroupsRepo._internal();

  Future<List<Group>> getAllGroups() async {
    //Uri url = Uri.https("jsonplaceholder.typicode.com", "todos");

    try {
      List<Group> response = groups;
      //Done only for exemplifications of a request taking time
      await Future.delayed(const Duration(seconds: 3));
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }
}
