




import 'package:self_host_group_chat_app/features/domain/entities/engage_user_entity.dart';
import 'package:self_host_group_chat_app/features/domain/entities/group_entity.dart';
import 'package:self_host_group_chat_app/features/domain/entities/my_chat_entity.dart';
import 'package:self_host_group_chat_app/features/domain/entities/text_messsage_entity.dart';
import 'package:self_host_group_chat_app/features/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> googleAuth();
  Future<void> forgotPassword(String email);

  Future<void> getCreateGroup(GroupEntity groupEntity);
  Stream<List<GroupEntity>> getGroups();
  Future<void> joinGroup(GroupEntity groupEntity);
  Future<void> updateGroup(GroupEntity groupEntity);

  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> getUpdateUser(UserEntity user);
  Future<String> getCurrentUId();
  Stream<List<UserEntity>> getAllUsers();
  Future<String> createOneToOneChatChannel(EngageUserEntity engageUserEntity);
  Future<String> getChannelId(EngageUserEntity engageUserEntity);
  Future<void> createNewGroup(MyChatEntity myChatEntity,List<String> selectUserList);
  Future<void> getCreateNewGroupChatRoom(MyChatEntity myChatEntity,List<String> selectUserList);
  Future<void> sendTextMessage(TextMessageEntity textMessageEntity,String channelId);
  Stream<List<TextMessageEntity>> getMessages(String channelId);
  Future<void> addToMyChat(MyChatEntity myChatEntity);
  Stream<List<MyChatEntity>> getMyChat(String uid);
}