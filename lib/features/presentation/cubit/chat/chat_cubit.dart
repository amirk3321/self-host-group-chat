import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:self_host_group_chat_app/features/domain/entities/text_messsage_entity.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/get_messages_usecase.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/send_my_text_message.dart';
import 'package:self_host_group_chat_app/features/domain/use_cases/send_text_message_usecase.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendTextMessageUseCase sendTextMessageUseCase;
  final GetMessageUseCase getMessageUseCase;
  ChatCubit({required this.getMessageUseCase,required this.sendTextMessageUseCase}) : super(ChatInitial());

  Future<void> getMessages({required String channelId})async{
    emit(ChatLoading());
    final streamResponse= getMessageUseCase.call(channelId);
    streamResponse.listen((messages) {
      emit(ChatLoaded(messages: messages));
    });
  }

  Future<void> sendTextMessage({required TextMessageEntity textMessageEntity,required String channelId})async{
    try{
      await sendTextMessageUseCase.call(textMessageEntity, channelId);
    }on SocketException catch(_){
      emit(ChatFailure());
    }catch(_){
      emit(ChatFailure());
    }
  }


}
