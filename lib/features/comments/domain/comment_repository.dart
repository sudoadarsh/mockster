import 'comment_entity.dart';

abstract interface class CommentRepository {
  /// Fetch the comments for a particular post.
  Future<List<CommentEntity>> fetchComments({required final String postId});
}
