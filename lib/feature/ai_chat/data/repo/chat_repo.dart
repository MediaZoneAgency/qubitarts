import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/chat_response_model.dart';

class AiChatRepository {
  final String baseUrl;
  String? _sessionId;

  AiChatRepository({required this.baseUrl});

  Future<ChatResponseModel> sendMessage(String message) async {
    final body = {
      'message': message,
      if (_sessionId != null) 'session_id': _sessionId,
    };

    final uri = Uri.parse('$baseUrl/chat/');
    final resp = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      _sessionId = data['session_id'] as String?;
      return ChatResponseModel.fromJson(data);
    } else {
      throw Exception('Server error ${resp.statusCode}: ${resp.body}');
    }
  }
}