



import 'package:self_host_group_chat_app/features/domain/entities/my_chat_entity.dart';
import 'package:self_host_group_chat_app/features/domain/repositories/firebase_repository.dart';

class GetCreateNewGroupChatRoomUseCase{
  final FirebaseRepository repository;

  GetCreateNewGroupChatRoomUseCase({required this.repository});

  Future<void> call(MyChatEntity myChatEntity,List<String> selectUserList){
    return repository.getCreateNewGroupChatRoom(myChatEntity, selectUserList);
  }

}