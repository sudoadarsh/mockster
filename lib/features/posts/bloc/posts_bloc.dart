import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../domain/entities/post_entity.dart';
import '../domain/post_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  /// The post repository.
  final PostRepository postRepository;

  PostsBloc(this.postRepository) : super(PostsInitial()) {
    // Fetch the posts.
    on<FetchPostsEvent>((event, emit) async {
      emit(FetchingPostsState());
      try {
        final List<PostEntity> posts = await postRepository.fetchPosts();
        emit(PostsFetchedState());
      } catch (error) {
        emit(PostsFetchFailedState(error));
      }
    }, transformer: droppable());
  }
}
