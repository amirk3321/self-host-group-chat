import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:self_host_group_chat_app/features/domain/entities/group_entity.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/create_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_all_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/join_group_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/update_group_usecase.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final GetCreateGroupUseCase getCreateGroupUseCase;
  final GetAllGroupsUseCase getAllGroupsUseCase;
  final JoinGroupUseCase joinGroupUseCase;
  final UpdateGroupUseCase groupUseCase;
  GroupCubit({required this.groupUseCase, required this.joinGroupUseCase, required this.getCreateGroupUseCase, required this.getAllGroupsUseCase}) : super(GroupInitial());


  Future<void> getGroups()async{
    emit(GroupLoading());
    final streamResponse= getAllGroupsUseCase.call();
    streamResponse.listen((groups) {
      emit(GroupLoaded(groups: groups));
    });
  }

  Future<void> getCreateGroup({required GroupEntity groupEntity})async{
    try{
      await getCreateGroupUseCase.call(groupEntity);
    }on SocketException catch(_){
      emit(GroupFailure());
    }catch(_){
      emit(GroupFailure());
    }
  }
  Future<void> joinGroup({required GroupEntity groupEntity})async{
    try{
      await joinGroupUseCase.call(groupEntity);
    }on SocketException catch(_){
      emit(GroupFailure());
    }catch(_){
      emit(GroupFailure());
    }
  }
  Future<void> updateGroup({required GroupEntity groupEntity})async{
    try{
      await groupUseCase.call(groupEntity);
    }on SocketException catch(_){
      emit(GroupFailure());
    }catch(_){
      emit(GroupFailure());
    }
  }

}
