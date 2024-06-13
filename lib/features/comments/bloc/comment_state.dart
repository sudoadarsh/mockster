part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class FetchingCommentState extends CommentState {}

final class CommentsFetchedState extends CommentState {}

final class CommentsFetchFailedState extends CommentState {
  final Object? error;
  CommentsFetchFailedState(this.error);
}
