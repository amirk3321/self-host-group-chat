


import 'package:self_host_group_chat_app/features/domain/entities/engage_user_entity.dart';
import 'package:self_host_group_chat_app/features/domain/repositories/firebase_repository.dart';

class CreateOneToOneChatChannelUseCase {
  final FirebaseRepository repository;

  CreateOneToOneChatChannelUseCase({required this.repository});

  Future<String> call(EngageUserEntity engageUserEntity)async{
    return repository.createOneToOneChatChannel(engageUserEntity);
  }
}
