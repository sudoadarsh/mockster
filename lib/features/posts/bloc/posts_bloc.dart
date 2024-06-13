import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../domain/entities/post_entity.dart';
import '../domain/entities/user_entity.dart';
import '../domain/post_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  /// The post repository.
  final PostRepository postRepository;

  /// The posts.
  final List<PostEntity> posts = List.empty(growable: true);

  /// The users.
  final Map<int, UserEntity> users = <int, UserEntity>{};

  PostsBloc(this.postRepository) : super(PostsInitial()) {
    // Fetch the posts.
    on<FetchPostsEvent>((event, emit) async {
      emit(FetchingPostsState());
      try {
        posts.clear();
        posts.addAll(await postRepository.fetchPosts());
        emit(PostsFetchedState());
      } catch (error) {
        emit(PostsFetchFailedState(error));
      }
    }, transformer: droppable());

    // Fetch users.
    on<FetchUsersEvent>((event, emit) async {
      emit(FetchingUsersState());
      try {
        users.clear();
        users.addAll(await postRepository.fetchUsers());
        emit(UsersFetchedState());
      } catch (error) {
        emit(UsersFetchFailedState(error));
      }
    }, transformer: droppable());
  }
}
