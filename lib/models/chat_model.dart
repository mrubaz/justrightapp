import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? message;
  Timestamp? messageTime;
  String? senderId;
  String? threadId;
  String? messageId;
  String? receiverId;
  List? playersIds;

  ChatModel({
    this.message,
    this.messageTime,
    this.senderId,
    this.threadId,
    this.messageId,
    this.receiverId,
    this.playersIds,
  });

  ChatModel.mapToChat(Map<String, dynamic> map) {
    message = map["message"];
    messageTime = map["messageTime"];
    senderId = map["senderId"];
    threadId = map["threadId"];
    messageId = map["messageId"];
    receiverId = map["receiverId"];
    playersIds = map["playersIds"];
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'messageTime': messageTime,
      'senderId': senderId,
      'threadId': threadId,
      'messageId': messageId,
      'receiverId': receiverId,
      'playersIds': playersIds,
    };
  }
}
