part of 'posts_bloc.dart';

@immutable
sealed class PostsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PostsInitial extends PostsState {}

/// Posts fetch state.
final class PostsFetchState extends PostsState {}

final class FetchingPostsState extends PostsFetchState {}

final class PostsFetchedState extends PostsFetchState {}

final class PostsFetchFailedState extends PostsFetchState {
  final Object? error;

  PostsFetchFailedState(this.error);
}

/// Users fetch state.
final class UsersFetchState extends PostsState {}

final class FetchingUsersState extends UsersFetchState {}

final class UsersFetchedState extends UsersFetchState {}

final class UsersFetchFailedState extends UsersFetchState {
  final Object? error;

  UsersFetchFailedState(this.error);
}
