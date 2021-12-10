import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/groups_bloc/groups_bloc.dart';
import 'package:vot_senat_client/bloc/groups_bloc/groups_event.dart';
import 'package:vot_senat_client/bloc/groups_bloc/groups_state.dart';
import 'package:vot_senat_client/widgets/group-widget/group-widget-list.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  void initState() {
    super.initState();
    context.read<GroupsBloc>().add(GroupsGetAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groups Screen"),
      ),
      body: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, groupsState) {
          if (groupsState is GroupsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (groupsState is GroupsGetFailure) {
            return Center(
              child: Row(
                children: const [
                  Icon(Icons.warning),
                  Text("Your groups could not be loaded correctly"),
                ],
              ),
            );
          }
          if (groupsState is GroupsGetSuccess) {
            return GroupsList(groups: groupsState.groups);
          }
          return const Center(
            child: Text("Ooops, you reached an unhandled state"),
          );
        },
      ),
    );
  }
}
