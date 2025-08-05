

class ChatResponseModel {
  final String response;
  final String sessionId;
  ChatResponseModel({required this.response, required this.sessionId});
  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      response: json['response'] as String,
      sessionId: json['session_id'] as String,
    );
  }
}