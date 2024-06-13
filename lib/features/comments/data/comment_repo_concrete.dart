import '../domain/comment_entity.dart';
import '../domain/comment_repository.dart';
import 'source/comment_source.dart';

class CommentRepoConcrete implements CommentRepository {
  /// The source.
  final CommentSource source;

  CommentRepoConcrete({required this.source});

  @override
  Future<List<CommentEntity>> fetchComments({required String postId}) {
    return source.fetchComments(postId: postId);
  }
}
