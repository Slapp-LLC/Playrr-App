import 'package:get/get.dart';
import 'package:playrr_app/models/chat/chat.model.dart';
import 'package:playrr_app/providers/chat.provider.dart';
import 'package:playrr_app/providers/user.provider.dart';
import 'package:playrr_app/services/chat.service.dart';
import 'package:playrr_app/services/errorHandling.service.dart';
import 'package:playrr_app/utils/api_error.dart';
import 'package:dio/dio.dart' as dio;

class ChatController extends GetxController {
  final UserProvider _userProvider = Get.find<UserProvider>();
  final ChatService _chatService = ChatService.instance;
  final ChatProvider _chatProvider = Get.find<ChatProvider>();
  Future<bool> getMyChats() async {
    try {
      final userId = _userProvider.user.id;
      dio.Response myChatsResponse = await _chatService.getMyChats(userId);
      List<dynamic> chatListJson = myChatsResponse.data;
      List<ChatModel> chatList =
          chatListJson.map((chatJson) => ChatModel.fromJson(chatJson)).toList();
      _chatProvider.setChats(chatList);
      return true;
    } on ApiError catch (e) {
      ErrorHandlingService.instance
          .showError(e.message, statusCode: e.statusCode);
      return false;
    } catch (e) {
      print('Error here :$e');
      printError(info: e.toString());
      ErrorHandlingService.instance
          .showError('Un error inesperado ha ocurrido');
      return false;
    }
  }
}
