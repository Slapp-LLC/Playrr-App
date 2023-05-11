import 'package:get/get.dart';
import 'package:playrr_app/models/chat/chat.model.dart';
import 'package:playrr_app/models/chat/message.model.dart';

class ChatProvider extends GetxController {
  final RxList<ChatModel> _chats = <ChatModel>[].obs;

  List<ChatModel> get chats => _chats.toList();

  void addChat(ChatModel chat) {
    final existingIndex = _chats.indexWhere((element) => element.id == chat.id);
    if (existingIndex != -1) {
      _chats[existingIndex] = chat;
    } else {
      _chats.add(chat);
    }
  }

  void addMessage(MessageModel message) {
    final existingChatIndex =
        _chats.indexWhere((chat) => chat.id == message.userChat?.id);
    if (existingChatIndex != -1) {
      final chat = _chats[existingChatIndex];
      chat.messages
          .insert(0, message); // Add the message to the beginning of the array
      _chats[existingChatIndex] = chat;
    } else {
      print('Chat not found');
      // Handle this case, e.g. by fetching the chat and adding it to the list
    }
  }

  void setChats(List<ChatModel> newChats) {
    _chats.assignAll(newChats);
  }
}
