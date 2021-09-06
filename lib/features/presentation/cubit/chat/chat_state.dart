part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoaded extends ChatState {
  final List<TextMessageEntity> messages;

  ChatLoaded({required this.messages});
  @override
  List<Object> get props => [messages];
}

class ChatFailure extends ChatState {
  @override
  List<Object> get props => [];
}


