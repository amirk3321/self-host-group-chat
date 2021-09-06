import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:self_host_group_chat_app/features/domain/entities/user_entity.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_all_users_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_update_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final GetUpdateUserUseCase getUpdateUserUseCase;
  UserCubit({required this.getAllUsersUseCase,required this.getUpdateUserUseCase}) : super(UserInitial());


  Future<void> getUsers()async{
     emit(UserLoading());
    final streamResponse= getAllUsersUseCase.call();
    streamResponse.listen((users) {
      emit(UserLoaded(users: users));
    });
  }

  Future<void> getUpdateUser({required UserEntity user})async{
    try{
      await getUpdateUserUseCase.call(user);
    }on SocketException catch(_){
      emit(UserFailure());
    }catch(_){
      emit(UserFailure());
    }
  }

}
