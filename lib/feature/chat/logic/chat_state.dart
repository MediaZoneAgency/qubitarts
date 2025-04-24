part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class LastMsgState extends ChatState {}
class ChatMessagesUpdatedState extends ChatState {}
class ChatErrorState extends ChatState {}
class ChatLoadedState extends ChatState {}
class ChatLoadingState extends ChatState{}
class ChatReadyState extends ChatState{}