import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:self_host_group_chat_app/features/domain/entities/group_entity.dart';

class GroupModel extends GroupEntity {

  GroupModel({
    final String groupName="",
    final String groupProfileImage="",
    final String joinUsers="",
    final String limitUsers="",
    final String uid="",
    final Timestamp? creationTime,
    final String groupId="",
    final String lastMessage="",
  }):super(
    groupName: groupName,
    creationTime: creationTime,
    groupId: groupId,
    groupProfileImage: groupProfileImage,
    joinUsers: joinUsers,
    limitUsers: limitUsers,
    uid: uid,
    lastMessage: lastMessage,
  );


  factory GroupModel.fromSnapshot(DocumentSnapshot snapshot) {
    return GroupModel(
      groupName: snapshot.get('groupName'),
      creationTime: snapshot.get('creationTime'),
      groupId: snapshot.get('groupId'),
      groupProfileImage: snapshot.get('groupProfileImage'),
      joinUsers: snapshot.get('joinUsers'),
      limitUsers: snapshot.get('limitUsers'),
      lastMessage: snapshot.get('lastMessage'),
      uid: snapshot.get('uid'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "groupName": groupName,
      "creationTime": creationTime,
      "groupId": groupId,
      "groupProfileImage": groupProfileImage,
      "joinUsers": joinUsers,
      "limitUsers": limitUsers,
      "lastMessage": lastMessage,
      "uid": uid,
    };
  }
}
