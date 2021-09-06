import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyChatEntity extends Equatable {
  final String? senderName;
  final String? recipientName;
  final String? channelId;
  final String? recipientUID;
  final String? senderUID;
  final String? profileUrl;
  final String? recentTextMessage;
  final bool? isRead;
  final Timestamp? time;
  final bool? isArchived;
  final String? recipientPhoneNumber;
  final String? senderPhoneNumber;
  final String? subjectName;
  final String? communicationType;

  MyChatEntity({this.senderName,
    this.recipientName,
    this.channelId,
    this.recipientUID,
    this.senderUID,
    this.profileUrl,
    this.recentTextMessage,
    this.isRead,
    this.time,
    this.isArchived,
    this.recipientPhoneNumber,
    this.senderPhoneNumber, this.subjectName,
    this.communicationType,
  });

  @override
  // TODO: implement props
  List<Object> get props =>
      [
        senderName!,
        recipientName!,
        channelId!,
        recipientUID!,
        senderUID!,
        profileUrl!,
        recentTextMessage!,
        isRead!,
        time!,
        isArchived!,
        recipientPhoneNumber!,
        senderPhoneNumber!,
        subjectName!,
        communicationType!,
      ];
}
