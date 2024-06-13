import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../domain/comment_entity.dart';
import '../domain/comment_repository.dart';

part 'comment_event.dart';

part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  /// The comment repository.
  final CommentRepository repository;

  /// The list of comments.
  final List<CommentEntity> comments = List.empty(growable: true);

  CommentBloc(this.repository) : super(CommentInitial()) {
    // Fetch the comments.
    on<FetchCommentEvent>((event, emit) async {
      emit(FetchingCommentState());
      try {
        comments.clear();
        comments.addAll(await repository.fetchComments(postId: event.postId));
        emit(CommentsFetchedState());
      } catch (error) {
        emit(CommentsFetchFailedState(error));
      }
    });
  }
}
