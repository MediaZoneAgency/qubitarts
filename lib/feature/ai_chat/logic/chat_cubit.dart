

import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/chat_repo.dart';
import 'chat_state.dart';


class AiChatCubit extends Cubit<AiChatState> {
  final AiChatRepository repository;
  final List<ChatMessage> _messages = [];

  AiChatCubit({required this.repository}) : super(AiChatInitial());

  Future<void> sendMessage(String text) async {
    _messages.add(ChatMessage(text: text, isUser: true));
    emit(AiChatLoading(List.from(_messages)));

    try {
      final resp = await repository.sendMessage(text);

      _messages.add(ChatMessage(text: resp.response, isUser: false));
      emit(AiChatSuccess(List.from(_messages)));
    } catch (e) {
      emit(AiChatFailure(e.toString()));
    }
  }
}
