import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vot_senat_client/model/group.dart';
import 'package:vot_senat_client/widgets/group-widget/group_widget.dart';

class GroupsList extends StatelessWidget {
  final List<Group> groups;
  const GroupsList({Key? key, required this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (listContext, index) {
        return GroupWidget(
          group: groups.elementAt(index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
      itemCount: groups.length,
    );
  }
}
