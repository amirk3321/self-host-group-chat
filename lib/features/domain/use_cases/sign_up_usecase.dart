








import 'package:self_host_group_chat_app/features/domain/entities/user_entity.dart';
import 'package:self_host_group_chat_app/features/domain/repositories/firebase_repository.dart';

class SignUpUseCase{
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(UserEntity user){
    return repository.signUp(user);
  }
}