



import 'package:self_host_group_chat_app/features/domain/repositories/firebase_repository.dart';

class GetCurrentUIDUseCase{
  final FirebaseRepository repository;

  GetCurrentUIDUseCase({required this.repository});
  Future<String> call()async{
    return await repository.getCurrentUId();
  }
}