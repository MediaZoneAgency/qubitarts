import 'package:equatable/equatable.dart';


/// A single chat message, either from the user or the AI.
class ChatMessage extends Equatable {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [text, isUser, timestamp];
}


abstract class AiChatState extends Equatable {
  const AiChatState();
  @override
  List<Object?> get props => [];
}

class AiChatInitial extends AiChatState {}

class AiChatLoading extends AiChatState {
  final List<ChatMessage> messages;
  const AiChatLoading(this.messages);

  @override
  List<Object?> get props => [messages];
}

class AiChatSuccess extends AiChatState {
  final List<ChatMessage> messages;
  const AiChatSuccess(this.messages);

  @override
  List<Object?> get props => [messages];
}

class AiChatFailure extends AiChatState {
  final String error;
  const AiChatFailure(this.error);

  @override
  List<Object?> get props => [error];
}
