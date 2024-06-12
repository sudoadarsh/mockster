part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

/// Posts fetch state.
final class PostsFetchState extends PostsState {}

final class FetchingPostsState extends PostsFetchState {}

final class PostsFetchedState extends PostsFetchState {}

final class PostsFetchFailedState extends PostsFetchState {
  final Object? error;

  PostsFetchFailedState(this.error);
}
