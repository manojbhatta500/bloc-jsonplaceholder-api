import 'dart:async';

import 'package:apibloc/model/postmodel.dart';
import 'package:apibloc/repository/post_repository.dart';
import 'package:apibloc/utils/status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository manager = PostRepository();

  PostBloc() : super(const PostState()) {
    on<FetchPostEvent>(_onfetchpostevent);
  }

  FutureOr<void> _onfetchpostevent(
      FetchPostEvent event, Emitter<PostState> emit) async {
    await manager.fetchdatafromserver().then((value) {
      emit(state.copyWith(
          inputstatus: Status.success,
          inputpostmodellist: value,
          inputmessage: 'succesfully fetched'));
    }).onError((error, stackTrace) {
      emit(
          state.copyWith(inputstatus: Status.faliure, inputmessage: '$error '));
    });
  }
}
