import 'dart:convert';

import 'package:vot_senat_client/model/group.dart';

class GroupsService {
  const GroupsService._internal();

  static const GroupsService instance = GroupsService._internal();

  List<Group> deserializeResponseBodyToList(String body) {
    return (json.decode(body) as List).map((item) => Group.fromJson(item)).toList();
  }
}
