import 'package:mockster/features/posts/domain/entities/user_entity.dart';

import 'entities/post_entity.dart';

abstract interface class PostRepository {
  /// Fetch the posts.
  Future<List<PostEntity>> fetchPosts();

  /// Fetch the user.
  Future<Map<int, UserEntity>> fetchUsers();
}
