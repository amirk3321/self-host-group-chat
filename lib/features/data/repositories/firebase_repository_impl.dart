

import 'package:self_host_group_chat_app/features/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:self_host_group_chat_app/features/domain/entities/engage_user_entity.dart';
import 'package:self_host_group_chat_app/features/domain/entities/group_entity.dart';
import 'package:self_host_group_chat_app/features/domain/entities/my_chat_entity.dart';
import 'package:self_host_group_chat_app/features/domain/entities/text_messsage_entity.dart';
import 'package:self_host_group_chat_app/features/domain/entities/user_entity.dart';
import 'package:self_host_group_chat_app/features/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      await remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUId() async =>
      await remoteDataSource.getCurrentUId();

  @override
  Future<bool> isSignIn() async => await remoteDataSource.isSignIn();

  @override
  Future<void> signInWithPhoneNumber(String pinCode) async =>
      await remoteDataSource.signInWithPhoneNumber(pinCode);

  @override
  Future<void> signOut() async => await remoteDataSource.signOut();

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await remoteDataSource.verifyPhoneNumber(phoneNumber);
  }

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();

  @override
  Future<String> createOneToOneChatChannel(EngageUserEntity engageUserEntity) async =>
      remoteDataSource.createOneToOneChatChannel(engageUserEntity);

  @override
  Future<void> sendTextMessage(
          TextMessageEntity textMessageEntity, String channelId) async {
      return await remoteDataSource.sendTextMessage(textMessageEntity, channelId);
}
  @override
  Stream<List<TextMessageEntity>> getMessages(String channelId) {
    return remoteDataSource.getMessages(channelId);
  }

  @override
  Future<String> getChannelId(EngageUserEntity engageUserEntity) async {
    return remoteDataSource.getChannelId(engageUserEntity);
  }

  @override
  Future<void> addToMyChat(MyChatEntity myChatEntity) async{
   return await remoteDataSource.addToMyChat(myChatEntity);
  }

  @override
  Stream<List<MyChatEntity>> getMyChat(String uid) {
   return remoteDataSource.getMyChat(uid);
  }

  @override
  Future<void> createNewGroup(MyChatEntity myChatEntity, List<String> selectUserList) {
    return remoteDataSource.createNewGroup(myChatEntity, selectUserList);
  }

  @override
  Future<void> getCreateNewGroupChatRoom(MyChatEntity myChatEntity, List<String> selectUserList) {
    return remoteDataSource.createNewGroup(myChatEntity, selectUserList);
  }

  @override
  Future<void> googleAuth() async =>
      remoteDataSource.googleAuth();

  @override
  Future<void> forgotPassword(String email) async =>
      remoteDataSource.forgotPassword(email);

  @override
  Future<void> signIn(UserEntity user) async =>
      remoteDataSource.signIn(user);

  @override
  Future<void> signUp(UserEntity user) async =>
      remoteDataSource.signUp(user);

  @override
  Future<void> getUpdateUser(UserEntity user) async =>
      remoteDataSource.getUpdateUser(user);

  @override
  Future<void> getCreateGroup(GroupEntity groupEntity) async =>
      remoteDataSource.getCreateGroup(groupEntity);

  @override
  Stream<List<GroupEntity>> getGroups() =>
      remoteDataSource.getGroups();

  @override
  Future<void> joinGroup(GroupEntity groupEntity) async =>
      remoteDataSource.joinGroup(groupEntity);

  @override
  Future<void> updateGroup(GroupEntity groupEntity) async =>
      remoteDataSource.updateGroup(groupEntity);
}
