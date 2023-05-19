import 'dart:convert';

import 'package:playrr_app/utils/token_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WebSocketService {
  late IO.Socket _socket;
  final TokenManager tokenManager = TokenManager();
  void connect(Function(String) onMessageReceived) async {
    final token = await tokenManager.getToken();
    _socket =
        IO.io('http://192.168.0.13:3000/?token=$token', <String, dynamic>{
      'transports': ['websocket'],
    });

    _socket.onConnect((_) {
      print('Connected to WebSocket server');
    });

    _socket.on('message', (data) {
      String jsonString = jsonEncode(data);
      onMessageReceived(jsonString);
    });

    _socket.onError((error) {
      print('WebSocket error: $error');
    });

    _socket.onDisconnect((_) {
      print('WebSocket closed');
    });
  }

  void close() {
    _socket.disconnect();
  }
}
