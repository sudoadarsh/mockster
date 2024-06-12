import '../domain/entities/post_entity.dart';
import '../domain/entities/user_entity.dart';
import '../domain/post_repository.dart';
import 'models/post_model.dart';
import 'models/user_model.dart';
import 'source/post_source.dart';

class PostRepositoryConcrete implements PostRepository {
  /// The posts source.
  final PostSource source;

  PostRepositoryConcrete({required this.source});

  @override
  Future<List<PostEntity>> fetchPosts() async {
    final List<PostModel> posts = await source.fetchPosts();
    return posts.map((final PostModel post) {
      return PostEntity(
        postId: post.id,
        userId: post.userId,
        title: post.title,
        body: post.body,
      );
    }).toList();
  }

  @override
  Future<List<UserEntity>> fetchUsers() async {
    final List<UserModel> users = await source.fetchUsers();
    return users.map((final UserModel user) {
      return UserEntity(
        email: user.email,
        catchPhrase: user.company?.catchPhrase,
        company: user.company?.name,
      );
    }).toList();
  }
}
