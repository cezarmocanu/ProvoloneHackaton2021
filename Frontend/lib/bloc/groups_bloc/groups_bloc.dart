import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:vot_senat_client/bloc/groups_bloc/groups_event.dart';
import 'package:vot_senat_client/bloc/groups_bloc/groups_state.dart';
import 'package:vot_senat_client/model/group.dart';
import 'package:vot_senat_client/repo/groups_repo.dart';
import 'package:vot_senat_client/service/groups_service.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc() : super(GroupsInit()) {
    on<GroupsGetAll>(_onGetAll);
  }

  FutureOr<void> _onGetAll(GroupsGetAll event, Emitter<GroupsState> emit) async {
    emit(GroupsLoading());

    List<Group> response = await GroupsRepo.instance.getAllGroups();

    // if (response.statusCode == HttpStatus.ok) {
    //   List<Group> groups = GroupsService.instance.deserializeResponseBodyToList(response.body);
    //   emit(GroupsGetSuccess(groups));
    // } else {
    //   emit(GroupsGetFailure());
    // }
    if (response.length != 0) emit(GroupsGetSuccess(groups));
  }
}
