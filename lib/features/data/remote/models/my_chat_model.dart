import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:self_host_group_chat_app/features/domain/entities/my_chat_entity.dart';

class MyChatModel extends MyChatEntity {
  MyChatModel({
    String? senderName,
    String? recipientName,
    String? channelId,
    String? recipientUID,
    String? senderUID,
    String? profileUrl,
    String? recentTextMessage,
    bool? isRead,
    Timestamp? time,
    bool? isArchived,
    String? recipientPhoneNumber,
    String? senderPhoneNumber,
    String? subjectName,
    String? communicationType,
  }) : super(
      senderName:senderName,
      recipientName:recipientName,
      channelId:channelId,
      recipientUID:recipientUID,
      senderUID:senderUID,
      profileUrl:profileUrl,
      recentTextMessage:recentTextMessage,
      isRead:isRead,
      time:time,
      isArchived:isArchived,
      recipientPhoneNumber:recipientPhoneNumber,
      senderPhoneNumber:senderPhoneNumber,
      subjectName:subjectName,
      communicationType:communicationType,
  );

factory MyChatModel.fromSnapshot(DocumentSnapshot snapshot) {
  return MyChatModel(
    senderName: snapshot.get('senderName'),
    recipientName: snapshot.get('recipientName'),
    channelId: snapshot.get('channelId'),
    recipientUID: snapshot.get('recipientUID'),
    senderUID: snapshot.get('senderUID'),
    profileUrl: snapshot.get('profileUrl'),
    recentTextMessage: snapshot.get('recentTextMessage'),
    isRead: snapshot.get('isRead'),
    time: snapshot.get('time'),
    isArchived: snapshot.get('isArchived'),
    recipientPhoneNumber: snapshot.get('recipientPhoneNumber'),
    senderPhoneNumber: snapshot.get('senderPhoneNumber'),
    subjectName: snapshot.get('subjectName'),
    communicationType: snapshot.get('communicationType'),
  );
}

Map<String, dynamic> toDocument() {
  return {
    "senderName": senderName,
    "recipientName": recipientName,
    "channelId": channelId,
    "recipientUID": recipientUID,
    "senderUID": senderUID,
    "profileUrl": profileUrl,
    "recentTextMessage": recentTextMessage,
    "isRead": isRead,
    "time": time,
    "isArchived": isArchived,
    "recipientPhoneNumber": recipientPhoneNumber,
    "senderPhoneNumber": senderPhoneNumber,
    "subjectName":subjectName,
    "communicationType":communicationType
  };
}
}
