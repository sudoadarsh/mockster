import '../models/post_model.dart';
import '../models/user_model.dart';

abstract class PostSource {
  /// Fetch the posts.
  Future<List<PostModel>> fetchPosts();

  /// Fetch the users.
  Future<List<UserModel>> fetchUsers();
}
