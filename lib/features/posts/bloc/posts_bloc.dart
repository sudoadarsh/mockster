import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../domain/post_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  /// The post repository.
  final PostRepository postRepository;

  PostsBloc(this.postRepository) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
