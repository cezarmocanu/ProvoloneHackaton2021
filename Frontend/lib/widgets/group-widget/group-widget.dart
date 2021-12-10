import 'package:flutter/material.dart';
import 'package:vot_senat_client/model/group.dart';

class GroupWidget extends StatelessWidget {
  final Group group;

  const GroupWidget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text('Group name ' + group.name),
      subtitle: Text(
        "Coordinated by " + group.instructor,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
