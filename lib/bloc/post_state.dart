part of 'post_bloc.dart';

class PostState extends Equatable {
  final Status status;
  final List<PostModel> postmodellist;

  final String message;

  const PostState(
      {this.status = Status.loading,
      this.postmodellist = const [],
      this.message = ''});

  PostState copyWith(
      {Status? inputstatus,
      List<PostModel>? inputpostmodellist,
      String? inputmessage}) {
    return PostState(
        status: inputstatus ?? status,
        postmodellist: inputpostmodellist ?? postmodellist,
        message: inputmessage ?? message);
  }

  @override
  List<Object> get props => [status, postmodellist, message];
}
