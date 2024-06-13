import 'package:mockster/features/comments/data/comment_model.dart';

abstract interface class CommentSource {
  /// Fetch the comments for a particular post.
  Future<List<CommentModel>> fetchComments({required final String postId});
}