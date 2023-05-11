import 'message.model.dart';
import 'package:playrr_app/models/chat/sender.model.dart';

class ChatModel {
  final int id;
  final List<MessageModel> messages;
  final List<Sender> participants;

  ChatModel({
    required this.id,
    required this.messages,
    required this.participants,
  });

  void updateLastMessage(MessageModel newMessage) {
    if (messages.isNotEmpty) {
      messages.removeLast();
    }
    messages.add(newMessage);
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      messages: (json['messages'] as List)
          .map((messageJson) => MessageModel.fromJson(messageJson))
          .toList(),
      participants: (json['participants'] as List)
          .map((participantJson) => Sender.fromJson(participantJson))
          .toList(),
    );
  }
}
