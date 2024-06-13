part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class FetchCommentEvent extends CommentEvent {
  final String postId;
  FetchCommentEvent(this.postId);
}
