import 'package:playrr_app/models/chat/sender.model.dart';
import 'package:playrr_app/models/chat/userChat.mode.dart';

class MessageModel {
  final int id;
  final String content;
  final DateTime createdAt;
  final Sender sender;
  final UserChatModel? userChat;
  MessageModel(
      {required this.content,
      required this.id,
      required this.createdAt,
      required this.sender,
      this.userChat});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        id: json['id'],
        content: json['content'],
        createdAt: DateTime.parse(json['createdAt']),
        sender: Sender.fromJson(json['sender']),
        userChat: json['userChat'] != null
            ? UserChatModel.fromJson(json['userChat'])
            : null);
  }
}
