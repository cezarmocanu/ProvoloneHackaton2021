import 'package:vot_senat_client/model/group.dart';

abstract class GroupsState {
  const GroupsState();
}

class GroupsInit extends GroupsState {}

class GroupsLoading extends GroupsState {}

class GroupsGetSuccess extends GroupsState {
  final List<Group> groups;
  GroupsGetSuccess(this.groups);
}

class GroupsGetFailure extends GroupsState {
  GroupsGetFailure();
}
