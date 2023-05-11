import 'dart:convert';
import 'package:get/get.dart';
import 'package:playrr_app/models/chat/chat.model.dart';
import 'package:playrr_app/models/chat/message.model.dart';
import 'package:playrr_app/providers/chat.provider.dart';
import 'package:playrr_app/services/errorHandling.service.dart';
import 'package:playrr_app/services/webSockets.service.dart';
import 'package:playrr_app/utils/token_manager.dart';

class WebSocketController extends GetxController {
  final WebSocketService _webSocketService = WebSocketService();
  final ChatProvider _chatProvider = Get.put(ChatProvider());
  final TokenManager tokenManager = TokenManager();
  @override
  void onInit() {
    super.onInit();
    _initializeWebSocket();
  }

  void _onMessageReceived(String jsonString) {
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    MessageModel message = MessageModel.fromJson(jsonData);
    int userChatId = jsonData['userChat']['id'];
    print(jsonData);
    // Find the corresponding chat and update the last message
    try {
      ChatModel chatToUpdate = _chatProvider.chats.firstWhere(
        (chat) => chat.id == userChatId,
      );

      chatToUpdate.updateLastMessage(message);
      _chatProvider.addChat(chatToUpdate);
    } catch (e) {
      print('Error here :$e');
      printError(info: e.toString());
      ErrorHandlingService.instance
          .showError('Un error inesperado ha ocurrido');
      // Handle the case where the corresponding chat is not found
    }
  }

  Future<void> _initializeWebSocket() async {
    String? token = await tokenManager.getToken();
    if (token != null) {
      _webSocketService.connect(_onMessageReceived);
    }
  }

  @override
  void onClose() {
    _webSocketService.close();
    super.onClose();
  }
}
